class User < ApplicationRecord
  include Clearance::User

  validates :email, uniqueness: true

  has_many :tournaments, foreign_key: :owner_id
end
