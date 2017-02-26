FactoryGirl.define do
  factory :registration do
    association :user
    association :tournament
  end
end
