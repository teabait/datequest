FactoryGirl.define do
  sequence :email do |n|
    "bsassdah#{n}@factory.com"
  end

  factory :user do
    username { Faker::Name.name }
    email
    birthdate "1990-10-14"
    password 'secret'
    password_confirmation { |u| u.password }
    location "Oakland"
    phone 9252342369
  end
end
