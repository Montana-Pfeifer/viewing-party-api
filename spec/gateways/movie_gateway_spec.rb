require "rails_helper"
require "pry"

RSpec.describe MovieGateway do
    describe "fetch top movies" do
        it "should return top 20 movies from TMDB" do
            top_movies = MovieGateway.fetch_top_movies
        
            first_movie = top_movies[0]

            expect(top_movies).to be_a(Array)
            expect(top_movies.length).to eq(20)

            expect(first_movie).to have_key(:id)
            expect(first_movie).to have_key(:title)
            expect(first_movie).to have_key(:vote_average)
        end
    end
end