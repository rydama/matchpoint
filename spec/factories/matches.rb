FactoryGirl.define do
  factory :match do
    association :tournament 
    association :home_player, factory: :user
    association :away_player, factory: :user
    start_at { 2.days.from_now }
  end
end
