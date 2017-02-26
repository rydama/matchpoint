class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  validates :user, presence: true
  validates :tournament, presence: true
end
