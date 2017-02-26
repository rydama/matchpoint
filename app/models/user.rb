class User < ApplicationRecord
  include Clearance::User

  has_many :tournaments, foreign_key: :owner_id
  has_many :registrations

  validates :email, uniqueness: true

  def tournaments_playing_in
    Tournament.with_registrations_for(self).current_and_upcoming
  end

  def tournaments_not_playing_in
    Tournament.current_and_upcoming.where.not(owner: self).without_registrations_for(self)
  end

  def tournaments_played_in_or_hosted
    tournaments.past.where(owner: self) + tournaments.past.with_registrations_for(self)
  end

  def registration_for(tournament)
    Registration.find_by(user: self, tournament: tournament)
  end
end
