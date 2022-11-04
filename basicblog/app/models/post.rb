class Post < ApplicationRecord

  extend FriendlyId


  has_one_attached :main_image
  validates :main_image , presence: true
  has_rich_text :content

  friendly_id :title, use: :slugged


  def optimized_image(image, x, y)
    image.variant(resize_to_fill: [x, y]).processed
  end


end
