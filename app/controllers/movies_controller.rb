class MoviesController < ApplicationController
  def search
  end

  def index
    if params[:movie_name].empty?
      flash[:danger] = "Please fill in the field"
      redirect_to '/'
    else 
      @movies = SearchMovie.new(params[:movie_name]).perform

      render 'search'
    end
  end
end
