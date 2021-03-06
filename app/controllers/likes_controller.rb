class LikesController < ApplicationController
before_action :authenticate_user!

  def create
    game = Game.find(params[:game_id])
    like = Like.new(game_id: game.id, user_id: current_user.id)
    like.save!
    redirect_to game_path(game)
  end

  def destroy
    game = Game.find(params[:game_id])
    like = Like.find_by(game_id: game.id, user_id: current_user.id)
    like.destroy!
    redirect_to game_path(game)
  end

end
