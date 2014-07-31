# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :assignment_1, class: Assignment do
    assignment_definition_id 1
    user_id 1
    created_at DateTime.now
    updated_at DateTime.now
    state 'new'
    completed_at nil
    tasks_complete false
  end

  factory :complete_assignment_1, class: Assignment do
    assignment_definition_id 1
    user_id 1
    created_at DateTime.now
    updated_at DateTime.now
    state 'completed'
    completed_at DateTime.now
    tasks_complete true
  end

  factory :assignment_2, class: Assignment do
    assignment_definition_id 2
    user_id 1
    created_at DateTime.now
    updated_at DateTime.now
    state 'new'
    completed_at nil
    tasks_complete false
  end

end
