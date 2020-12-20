class GameCommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @gamecomment = GameComment.new
  end

  def create
    @gamecomment = GameComment.new(gamecomment_params)
    @gamecomment.user_id = current_user.id
    @gamecomment.game_id = Game.find(params[:game_id]).id
    #@gamecomment.comment = params[:game_comment][:comment]
    if @gamecomment.save
      redirect_to game_path(@gamecomment.game_id)
    else
      render 'new'
    end
  end

  def edit
    @gamecomment = GameComment.find(params[:id])
  end

  def update
    @gamecomment = GameComment.find(params[:id])
    if @gamecomment.update(gamecomment_params)
    redirect_to game_path(@gamecomment.game.id)
    else
      render 'edit'
    end
  end

  def destroy
    @gamecomment = GameComment.find(params[:id])
    game = @gamecomment.game.id
    @gamecomment.destroy
    redirect_to game_path(game)
  end

  private
  def gamecomment_params
    params.require(:game_comment).permit(:title, :comment, :rate, :user_id, :game_id)
  end

end
