class GamecommentsController < ApplicationController
  def new
    @gamecomment = GameComment.new
  end
    
  def create
    @gamecomment = GameComment.new(gamecomment_params)
    @gamecomment.game_id = game.id
    @gamecomment.user_id = current_user.id
    @gamecomment.save
    redirect_to game_path(@gamecomment.game_id)
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
  end

  private
  def gamecomment_params
    params.require(:gamecomments).permit(:user_id, :game_id ,:comment)
  end
end
