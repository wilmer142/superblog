# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :body, presence: {message: "%{value} no puede estar en blanco"}
  validates :body, length: {minimum: 250, message: "%{value} es demasiado corto (250 caracteres mínimo)"}
end
