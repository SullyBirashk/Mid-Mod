class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
    @movie = @actor.movie
  end

end
