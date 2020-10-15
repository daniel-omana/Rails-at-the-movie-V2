class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).order('average_vote DESC')
  end
  # The #movies variable will be shared with:
  # app/views/movies/index.html.erb

  def show
    @movie = Movie.find(params[:id])
  end
  # The #movies variable will be shared with:
  # app/views/movies/show.html.erb
end
