class UsefulController < ApplicationController
  before_action :authenticate_user!
  def create
    game_comment = GameComment.find(params[:game_comment_id])
    useful = Useful.new(user_id: current_user.id, game_comment_id: game_comment.id)
    useful.save
    redirect_to game_path(game_comment.game_id)
  end
end
