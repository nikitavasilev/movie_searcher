require 'themoviedb'

class SearchMovie
   
  def initialize(query)
    Tmdb::Api.key(Rails.application.credentials[:movie_db_key])
    @query = query
    @result = Hash.new
  end

  def perform
    @movies = Tmdb::Movie.find(@query)
    
    @movies.each_with_index do |movie, index|
      if index == 20
        break
      end

      credits = Tmdb::Movie.credits(movie.id)
      director = credits['crew'].select{ |crew| crew['department'] == 'Directing'}
      unless director.empty?
        director = director[0]['name']
      end

      @result[movie.id] = {
        name: movie.title,
        release_date: movie.release_date,
        poster_path: movie.poster_path,
        director: director
      }

    end
    return @result
  end
end