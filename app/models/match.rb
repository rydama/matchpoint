class Match < ApplicationRecord
  belongs_to :tournament
  belongs_to :home_player, class_name: "User"
  belongs_to :away_player, class_name: "User"

  validates :tournament, presence: true
  validates :home_player, presence: true
  validates :away_player, presence: true
  validates :start_at, presence: { message: "is blank or invalid" }
end
