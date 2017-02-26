FactoryGirl.define do
  factory :tournament do
    name { "#{Faker::University.name} Classic" }
    description { Faker::Lorem.paragraph }
    start_at { 2.days.from_now }
    end_at { 4.days.from_now }

    association :owner, factory: :user
  end
end
