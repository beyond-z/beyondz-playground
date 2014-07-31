require './test_helper.rb'

class AssignmentTest < ActiveSupport::TestCase

  describe Assignment do   
     let!(:assignment_1) { FactoryGirl.create :assignment_1 }
     let!(:assignment_2) { FactoryGirl.create :assignment_2 }
     let!(:user) { FactoryGirl.create :user }
     let!(:assignment_def1) { FactoryGirl.create :assignment_def1}
     let!(:assignment_def2) { FactoryGirl.create :assignment_def2}
    context 'show only first incomplete assignment' do
      it 'shows first assginment out of list' do
       expect(user.assignments.for_display\
        .need_student_attention.next_available.first).to eq(assignment_1)
      end   
    end
  end

end
