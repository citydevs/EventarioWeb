FactoryGirl.define do
  sequence :email do |n|
    "email-#{n}@factory.com"
  end

  factory :user do
    email
    password "pa5sword"
    password_confirmation { "pa5sword"}
    admin true
  end
end
