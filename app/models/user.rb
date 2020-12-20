class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :nickname, presence: true

         attachment :profile_image

         has_many :game_comments, dependent: :destroy
         has_many :usefuls, dependent: :destroy
         has_many :posts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_games, through: :likes, source: :game


end
