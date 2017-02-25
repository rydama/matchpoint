class Tournament < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :start_at, presence: { message: "is blank or invalid" }
  validates :end_at, presence: { message: "is blank or invalid" }
end
