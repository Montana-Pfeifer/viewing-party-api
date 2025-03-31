class Movie < ApplicationRecord
    has_many :viewing_parties
    
    validates :title, presence: true
    
  end
  