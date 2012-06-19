# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :operation do
    name "MyString"
    operator ""
    firstoperand 1
    secondoperand 1
  end
end
