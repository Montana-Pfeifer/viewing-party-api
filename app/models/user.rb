class User < ApplicationRecord
  has_many :viewing_parties, foreign_key: :user_id
  has_many :invitee_viewing_parties, foreign_key: :invitee_id
  has_many :viewing_parties_as_invitee, through: :invitee_viewing_parties, source: :viewing_party

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: { require: true }
  has_secure_password
  has_secure_token :api_key

end