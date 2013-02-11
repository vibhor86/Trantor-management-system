# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :leavemanagement do
    user 1
    start_date "2013-02-05"
    end_date "2013-02-05"
    reason "MyString"
    type ""
    approved false
  end
end
