class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: {message: "%{value} no puede estar en blanco"}
end
