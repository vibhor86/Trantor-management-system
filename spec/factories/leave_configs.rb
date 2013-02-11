# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :leave_config do
    emptype "MyString"
    sl 1
    cl 1
    el 1
  end
end
