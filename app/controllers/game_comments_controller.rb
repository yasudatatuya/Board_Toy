class GameCommentsController < ApplicationController
  def new
    @gamecomment = GameComment.new
  end

  def create
    @gamecomment = GameComment.new
    @gamecomment.user_id = current_user.id
    @gamecomment.game_id = Game.find(params[:game_id]).id
    if @gamecomment.save
      redirect_to game_path(@gamecomment.game_id)
    else
      render 'edit'
    end
  end

  def show
    @gamecomment = GameComment.find(params[:id])
  end

  def edit
    @gamecomment = GameComment.find(params[:id])
  end

  def update
    @gamecomment = GameComment.find(params[:gamecomment_id])
    if @gamecomment.update(gamecomment_params)
    redirect_to game_game_comment_path(@gamecomment)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def gamecomment_params
    params.require(:game_comments).permit(:comment, :user_id, :game_id)
  end

end
