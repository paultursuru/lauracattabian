class Article < ApplicationRecord
  has_one_attached :photo
  has_rich_text :content
  validates :title, :subtitle, :category, :photo, presence: true
end
