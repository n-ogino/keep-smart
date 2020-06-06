class Chart < ApplicationRecord
  validates :weight, presence: true, numericality: {only_integer: true}
  validates :user_id, presence: true
  
  belongs_to :user
end
