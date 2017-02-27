FactoryGirl.define do
  factory :registration do
    association :player, factory: :user
    association :tournament
  end
end
