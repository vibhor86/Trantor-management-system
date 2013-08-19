# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :placeholder do
  column_name "column"
  placeholder_name "|{placeholder}|"
  
  end
end
