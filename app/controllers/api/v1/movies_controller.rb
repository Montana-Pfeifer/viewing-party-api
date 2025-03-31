class Api::V1::MoviesController < ApplicationController
    def index
        if params[:query].present?

            searched_movies = MovieGateway.find_movie(params[:query])
        else
            searched_movies = MovieGateway.fetch_top_movies
        end

        formatted_movies = MovieSerializer.format_movies(searched_movies)

        render json: formatted_movies
    end

    def create_viewing_party

    viewing_party_params = params.require(:viewing_party).permit(:name, :start_time, :end_time, :movie_id, invitees: [])

    @viewing_party = ViewingParty.create(
        name: viewing_party_params[:name],
        start_time: viewing_party_params[:start_time],
        end_time: viewing_party_params[:end_time],
        movie_id: viewing_party_params[:movie_id]
    )

    viewing_party_params[:invitees].each do |invitee_id|
        invitee = User.find_by(id: invitee_id)
        if invitee
            InviteeViewingParty.create(viewing_party_id: @viewing_party.id, invitee_id: invitee.id)
        end
    end

    render json: @viewing_party, status: :created
    end
end