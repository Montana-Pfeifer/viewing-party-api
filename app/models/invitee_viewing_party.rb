class InviteeViewingParty < ApplicationRecord
    belongs_to :invitee, class_name: "User"
    belongs_to :viewing_party
  end
  