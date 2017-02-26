class User < ApplicationRecord
  include Clearance::User

  has_many :registrations
  has_many :tournaments_hosting, class_name: "Tournament", foreign_key: :owner_id
  has_many :tournaments_playing_in, through: :registrations, source: :tournament

  validates :email, uniqueness: true

  def tournaments_not_playing_in
    Tournament.upcoming
      .not_hosted_by(self)
      .where.not(id: [tournaments_playing_in.map(&:id)])
  end

  def registration_for(tournament)
    Registration.find_by(user: self, tournament: tournament)
  end
end
