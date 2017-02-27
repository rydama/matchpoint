class Match < ApplicationRecord
   belongs_to :tournament
   belongs_to :home_player, class_name: "User"
   belongs_to :away_player, class_name: "User", optional: true

   validates :home_player, presence: true
   # away_player can be nil if this is a bye
end
