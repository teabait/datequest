FactoryGirl.define do
  factory :quest do
    location { Faker::Address.city }
    creator 2
    acceptor 1
    accepted false
    description "pizza rolls"
    rejected false
    quest_date "2013-12-18 15:36:00"
  end
end
