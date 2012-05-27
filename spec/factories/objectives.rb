# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :objective do
    name "MyString"
    weight 1.5
    score 1.5
    perspective_id 1
  end
end
