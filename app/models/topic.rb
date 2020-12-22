class Topic < ApplicationRecord
  has_many :post, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
end
