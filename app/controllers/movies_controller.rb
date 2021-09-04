class MoviesController < ApplicationController
   before_action :set_movie, only: %i[show update destroy]

   # GET /users.json
  def index
  @movies = Movie.all

  end

  # GET /users/1.json
  def show;end

  # POST /users.json
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end


  # PUT /users/1.json
  def update
    if @movie.update(movie_params)
      render :show, status: :ok, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1.json
  def destroy
    @movie.destroy
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not found' }, status: :not_found
  end

  def movie_params
    params.require(:movie).permit(
      :name, :picture, :release_date, :description, :rating
    )
  end
end
