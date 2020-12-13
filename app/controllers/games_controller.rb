class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def index
    @games = Game.all
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to games_path
  end

  def show
    @game =Game.find(params[:id])
  end

  def edit
    @game =Game.find(params[:id])
  end

  def update
    @game =Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game =Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  def genres
  end

  private
  def game_params
    params.require(:game).permit(:name, :image, :introduction, :price, :play_timemin, :play_timemax, :number_min, :number_max)
  end
end
