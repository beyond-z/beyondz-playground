# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'User'
    email 'test@beyondz.org'
    password 'test'
    city 'Smallville'
    state 'NY'
    
    trait :professional do
      applicant_type 'professional'
      applicant_details 'Testing'
    end
  end
end
