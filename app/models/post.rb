class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  has_one_attached :image
  belongs_to :user
  scope :tags_include, -> (tag) {where("tags like ?", "%#{tag}%")}

  # Validations
  validates :caption, :rating, :location, :time, :tags, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0 }

end
