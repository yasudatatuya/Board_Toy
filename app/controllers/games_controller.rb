class GamesController < ApplicationController

  def new
    if current_user.management_permissions ==true
    @game = Game.new
    else
    redirect_to root_path
    end
  end

  def index
    if params[:keyword].present?
      @q = Game.where(genre: params[:genre]).ransack(params[:q])
      @games = @q.result(distinct: true).soort(params[:keyword])
    else
      @q = Game.where(genre: params[:genre]).ransack(params[:q])
      @games = @q.result(distinct: true)
    end
  end

  # def index
  #   if params[:keyword].present?
  #     @q = Game.where(genre: params[:genre]).sort(params[:keyword]).ransack(params[:q])
  #   else
  #     @q = Game.where(genre: params[:genre]).ransack(params[:q])
  #   end
  #   @games = @q.result(distinct: true).order("created_at DESC")
  # end

  # def index
  #   @q = Game.where(genre: params[:genre]).ransack(params[:q])
  #   @games = @q.result(distinct: true).order("created_at DESC")
  # end

  def create
    @game = Game.new(game_params)
    if @game.save
    redirect_to games_path
    else
    render 'new'
    end
  end

  def show
    @game =Game.find(params[:id])
  end

  def edit
    if current_user.management_permissions ==true
    @game =Game.find(params[:id])
    else
    redirect_to root_path
    end
  end

  def update
    @game =Game.find(params[:id])
    if @game.update(game_params)
    redirect_to game_path(@game)
    else
      render 'edit'
    end
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
    params.require(:game).permit(:genre, :name, :image, :introduction, :price, :play_timemin, :play_timemax, :number_min, :number_max)
  end
end
