FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :age do
    rand(13...43)
  end

  factory :user do
    username { Faker::Name.name }
    email
    age
    password 'secret'
    password_confirmation { |u| u.password }
    location "Oakland"
  end
end
