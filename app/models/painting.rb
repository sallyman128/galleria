class Painting < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments

  scope :search, -> (query) { where("title LIKE ?", "%" + query + "%") }

end
