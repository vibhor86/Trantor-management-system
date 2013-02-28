# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'suresh.kumar@trantorinc.com'
    password 'trantor'
    password_confirmation 'trantor'
    admin false
  end
  
end
