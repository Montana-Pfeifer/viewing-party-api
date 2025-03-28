class Api::V1::MoviesController < ApplicationController
    def index
        top_movies = MovieGateway.fetch_top_movies

        formatted_movies = MovieSerializer.format_movies(top_movies)

        render json: formatted_movies
    end
end