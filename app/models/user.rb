class User < ApplicationRecord
  validates :name, :password, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15}
  validates :height, presence: true, length: {minimum: 3, maximum: 3 }
  has_many :charts
end

