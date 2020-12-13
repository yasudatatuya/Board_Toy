class Game < ApplicationRecord
  attachment :image

  validates :name, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, numericality:{only_integer: true, greater_than: 100}
  validates :play_timemin, numericality:{only_integer: true, greater_than: 0}
  validates :play_timemax, numericality:{only_integer: true, greater_than: 0}
  validates :number_min, numericality:{only_integer: true, greater_than: 0}
  validates :number_max, numericality:{only_integer: true, greater_than: 0}

  enum genre: { １０歳未満でも楽しめる: 0, お手軽に楽しめる: 1, じっくり楽しめる: 2 }
end
