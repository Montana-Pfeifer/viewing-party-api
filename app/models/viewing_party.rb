class ViewingParty < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    has_many :invitee_viewing_parties
    has_many :invitees, through: :invitee_viewing_parties
  end
  