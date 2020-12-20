class Like < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def self.like_method(game, user)
    Like.find_by(game_id: game.id, user_id: user.id)
  end
end
