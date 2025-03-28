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

    # def show
    #     query = params[:query]

    #     searched_movies = MovieGateway.find_movie(query)

    #     formatted_movies = MovieSerializer.format_movies(searched_movies)

    #     render json: formatted_movies
    # end
end