class GameComment < ApplicationRecord
  validates :title, presence: true
  validates :rate, presence: true


  belongs_to :user
  belongs_to :game
  has_many :usefuls, dependent: :destroy

  def useful_by(user)
    usefuls.where(user_id: user_id).exists?
  end
end
