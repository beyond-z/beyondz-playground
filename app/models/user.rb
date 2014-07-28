class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  belongs_to :state

  has_many :assignments, dependent: :destroy
  has_many :tasks

  has_many :coach_students, foreign_key: :coach_id
  has_many :students, through: :coach_students, :source => :student

  before_save { self.email = email.downcase }

  # validates complex email addresses with top-level domains and two letter country domains
  TOP_LEVEL_DOMAINS = "aero|asia|bike|biz|camera|cat|clothing|com|coop|equipment|estate|eus|gallery|graphics|guru|info|int|holdings|jobs|lighting|mobi|museum|name|net|org|photography|plumbing|post|pro|singles|tel|travel|ventures|xxx"
  VALID_EMAIL_REGEX = /[a-zA-Z0-9!#$%&'*+\/=?^_{|}~-]+(?:.[a-zA-Z0-9!#$%&'*+\/=?^_{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[a-zA-Z]{2}|#{TOP_LEVEL_DOMAINS})\b/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :state_id, presence: true

  after_create :create_child_skeleton_rows


  def name
    "#{first_name} #{last_name}"
  end

  def coach
    CoachStudent.find_by(student_id: id).try(:coach)
  end

  # We do need to decide exactly how users will be accepted
  # into the program and as what roles. For now, it will just
  # see if we added any students in the admin, thus making them
  # a coach, or if not, the applicant type is set if they enrolled
  # thus telling us they aren't a full student yet. (This realistically
  # only separates our seed data from real data - which is fine until
  # we start actually accepting people.)
  def coach?
    students.any?
  end

  def student?
    applicant_type.nil? || applicant_type.empty?
  end

  # This will create the skeletons for assignments, tasks,
  # and submissions based on the definitions. We should run
  # this whenever a user is created or a definition is added.
  #
  # Don't forget to update this code if we add any more has_many
  # relationships with the same skeleton row pattern.
  def create_child_skeleton_rows
    ActiveRecord::Base.transaction do

      AssignmentDefinition.all.each do |a|
        assignment = assignments.find_by_assignment_definition_id(a.id)
        if assignment.nil?
          assignment = Assignment.create(
            assignment_definition_id: a.id,
            state: 'new'
          )
          assignments << assignment
        end

        a.task_definitions.each do |td|
          task = tasks.find_by_task_definition_id(td.id)
          if task.nil?
            task = Task.create(
              task_definition_id: td.id,
              assignment_id: assignment.id,
              state: 'new'
            )
            tasks << task
          end
        end
      end
    end
  end

  def recent_task_activity
    result = []
    tasks.each do |a|
      if a.complete? || a.pending_approval? || (a.comments.any? && !a.complete?)
        result.push(a)
      end
    end
    result = result.sort_by { |h| h[:time_ago] }
    result
  end

  def self.send_reminders
    next_assignment = Assignment.next_due

    User.all.each do |user|
      total_count = 0
      total_done = 0
      next_assignment.todos.each do |todo|
        total_count += 1
        user.user_todos.each do |status|
          if status.todo_id == todo.id && status.completed
            total_done += 1
          end
        end
      end
      if total_count != total_done
        Reminders.assignment_nearly_due(
          user.email,
          user.name,
          next_assignment.title,
          'http://platform.beyondz.org/assignments/' +
          next_assignment.seo_name)
            .deliver
      end
    end
  end
end

class LoginException < Exception
  def initialize(message)
    @message = message
  end

  attr_reader :message
end
