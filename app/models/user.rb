class User < ApplicationRecord
  validates :name, :password, presence: true, uniqueness: true
  
  has_many :charts
end

