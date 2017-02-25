class User < ApplicationRecord
  include Clearance::User

  validates :email, uniqueness: true

  has_many :tournaments, foreign_key: :owner_id

  def tournaments_playing_in
    []
  end

  def tournaments_not_playing_in
    Tournament.current_and_upcoming.where.not(owner: self)
  end

  def tournaments_played_in_or_hosted
    tournaments.past
  end
end
