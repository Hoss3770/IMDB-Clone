class HomeController < ApplicationController
  def index
  	@movies = Movie.all
  	@actors = Actor.all
  	@directors = Director.all
  	@genres = Genre.all
  	@users = User.all
  	@ratings = Rating.all

  end
end
