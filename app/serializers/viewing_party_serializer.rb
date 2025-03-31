class ViewingPartySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :start_time, :end_time, :movie_id, :invitees

  def invitees
    object.invitees.map do |invitee|
      {
        id: invitee.id,
        name: invitee.name,
        username: invitee.username
      }
    end
  end
end
