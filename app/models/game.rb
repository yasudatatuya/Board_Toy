class Game < ApplicationRecord
  attachment :image

  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, numericality:{only_integer: true, greater_than: 0}
  validates :play_timemin, numericality:{only_integer: true, greater_than: 0}
  validates :play_timemax, numericality:{only_integer: true, greater_than: 0}
  validates :number_min, numericality:{only_integer: true, greater_than: 0}
  validates :number_max, numericality:{only_integer: true, greater_than: 0}

  enum genre: { １０歳未満でも楽しめる: 0, お手軽に楽しめる: 1, じっくり楽しめる: 2 }

  has_many :game_comments, dependent: :destroy

  #scope

  def average_score
    self.game_comments.sum(:rate) / self.game_comments.length
  end

  def self.soort(selection)
    case selection
    when 'pricehige'
      return all.order(price: :DESC)
    when 'playhige'
      return all.order(number_max: :DESC)
    when 'playtimecheap'
      return all.order(play_timemin: :ASC)
    when 'evaluationhige'
      h = {}
      Game.all.map{|v| h["#{v.average_score}"] = v}
      return h.sort.reverse.to_h.map{|v| v[1]}
    else 'pricecheap'
      return all.order(price: :ASC)
    end
  end
end
