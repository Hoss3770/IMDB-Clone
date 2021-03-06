class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json

  #use nested forms for all other models

  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    prepare_movie(true)
     

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update


    prepare_movie(false)

    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def prepare_movie(create)
      #use find_or_create_by
       paramss = movie_params
      genre  = Genre.new(name: paramss[:genre] ,description:"please add")
      director = Director.new(name: paramss[:director],bio:"please add")
      @movie = Movie.new(paramss.except(:genre,:director,:actors_attributes)) if (create)
      if !(genre.save)
        genre = Genre.find_by(name:paramss[:genre])
        #genre.save
      end
      if !(director.save)
        director =  Director.find_by(name:paramss[:director])
        # director.save
      end
      paramss[:actors_attributes].each do|actor,val| 
       act = Actor.find_by(name: val[:name] )
        if !act
          act = Actor.new(name: val[:name],bio: val[:bio])
        end

      end
      @movie.genre, @movie.director = genre,director
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
       params.require(:movie).permit(:name, :description, :trailer, :genre, :director,actors_attributes:[:id,:name,:bio,:_destroy])
    end
end