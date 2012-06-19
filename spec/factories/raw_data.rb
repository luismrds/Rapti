# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :raw_datum do
    name "MyString"
    value 1.5
    operation_id 1
  end
end
