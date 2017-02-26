class User < ApplicationRecord
  include Clearance::User

  has_many :registrations
  has_many :tournaments, foreign_key: :owner_id
  has_many :tournaments_playing_in, through: :registrations, source: :tournament

  validates :email, uniqueness: true

  # def tournaments_playing_in
  #   Tournament.with_registrations_for(self).current_and_upcoming
  # end

  def tournaments_not_playing_in
    Tournament.current_and_upcoming.not_owned_by(self)
      .where.not(id: [tournaments_playing_in.map(&:id)])
  end

  def tournaments_played_in_or_hosted
    (tournaments_playing_in.past + tournaments.past).uniq
  end

  def registration_for(tournament)
    Registration.find_by(user: self, tournament: tournament)
  end
end
