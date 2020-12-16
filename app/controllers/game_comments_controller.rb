class GameCommentsController < ApplicationController
  def new
    @gamecomment = GameComment.new
  end

  def create
    @gamecomment = GameComment.new
    @gamecomment.user_id = current_user.id
    @gamecomment.game_id = Game.find(params[:game_id]).id
    @gamecomment.comment = params[:game_comment][:comment]
    if @gamecomment.save
      redirect_to game_path(@gamecomment.game_id)
    else
      render 'new'
    end
  end

  def show
    @gamecomment = GameComment.find(params[:id])
  end

  def edit
    @gamecomment = GameComment.find(params[:id])
  end

  def update
    @gamecomment = GameComment.find(params[:id])
    @gamecomment.comment = params[:comment]
    if @gamecomment.update
    redirect_to game_game_comment_path(@gamecomment)
    else
      render 'edit'
    end
  end

  def destroy
    game = Game.find(params[:id])
    @gamecomment = GameComment.find(params[:id])
    @gamecomment.destroy
    redirect_to game_path(game.id)
  end

  private
  def gamecomment_params
    params.require(:game_comments).permit(:comment, :user_id, :game_id)
  end

end
