require "rails_helper"

RSpec.describe "Movies API", type: :request do
  describe "Create Viewing Party Endpoint" do
    let(:user) { create(:user) }
    let(:movie) { create(:movie) }

    let(:viewing_party_params) do
      {
        viewing_party: {
          name: "Juliet's Bday Movie Bash!",
          start_time: "2025-02-01 10:00:00",
          end_time: "2025-02-01 14:30:00",
          movie_id: movie.id,
          invitees: [user.id]
        }
      }
    end

    context "request is valid" do
      it "returns 201 Created and provides expected fields" do
        post '/api/v1/movies/create_viewing_party', params: viewing_party_params, as: :json

        expect(response).to have_http_status(:created)
        json = JSON.parse(response.body, symbolize_names: true)
        
        expect(json[:data][:attributes][:movie_id]).to eq(movie.id)
        expect(json[:data][:attributes][:name]).to eq(viewing_party_params[:viewing_party][:name])
        expect(json[:data][:attributes][:invitees].size).to eq(1)
        expect(json[:data][:attributes][:invitees].first[:id]).to eq(user.id)

        expect(json[:data][:attributes][:movie_id]).to eq(movie.id)

        expect(movie.title).to eq("The Shawshank Redemption")
        expect(movie.vote_average).to eq(9.3)
      end
    end
  end
end
