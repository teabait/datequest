FactoryGirl.define do
  factory :quest do
    location { Faker::Address.city }
    creator 2
    acceptor 1
    accepted false
    description "pizza rolls"
    rejected false
    quest_date "2013-12-16"
    quest_time "14:56:50"
  end
end
