class Registration < ApplicationRecord
  belongs_to :player, class_name: "User"
  belongs_to :tournament

  validates :player, presence: true
  validates :tournament, presence: true
end
