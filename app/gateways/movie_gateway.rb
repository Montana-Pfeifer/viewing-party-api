class MovieGateway
    def self.fetch_top_movies
        response = conn.get("/3/movie/top_rated?api_key=#{Rails.application.credentials.tmdb[:key]}")

        json = JSON.parse(response.body, symbolize_names: true)
        json[:results]
    end

    def self.find_movie(movie)
        response = conn.get("/3/search/movie?api_key=#{Rails.application.credentials.tmdb[:key]}&query=#{URI.encode_www_form_component(movie)}")

        json = JSON.parse(response.body, symbolize_names: true)
        json[:results]
    end
    private

    def self.conn
        Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
        end
    end
end