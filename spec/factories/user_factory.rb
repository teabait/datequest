FactoryGirl.define do
  sequence :email do |n|
    "bsassdah#{n}@factory.com"
  end

  factory :user do
    username { Faker::Name.name }
    email
    birthdate "2013-12-14"
    password 'secret'
    password_confirmation { |u| u.password }
    location "Oakland"
  end
end
