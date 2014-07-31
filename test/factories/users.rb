# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id 1
    first_name 'Test'
    last_name 'User'
    email 'person@place.net'
    password 'test'
  end
end
