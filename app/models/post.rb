class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  has_one_attached :image
  belongs_to :user
  scope :tags_include, -> (tag) {where("tags like ?", "%#{tag}%")}

end
