class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  has_one_attached :image
  scope :tags_include, -> (tag) {where("tags like ?", "%#{tag}%")}

end
