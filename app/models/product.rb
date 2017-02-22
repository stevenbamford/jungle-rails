class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def avg_rating
    reviews.average(:rating).round
  end

  def total_rating
    reviews.sum(:rating)
  end

  def has_reviews?
    reviews.size > 0
  end

  def sold_out?
    quantity == 0
  end
end
