class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :body, presence: {message: "%{value} no puede estar en blanco"}
  validates :body, length: {minimum: 250, message: "%{value} es demasiado corto (250 caracteres mínimo)"}
end
