class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true
  include ImageUploader[:image]

end
