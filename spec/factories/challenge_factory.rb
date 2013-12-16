FactoryGirl.define do
  sequence :rank do |n|
    rand(0..5)
  end
  factory :challenge do
    rank
    description "do crazy stuff"
  end
end
