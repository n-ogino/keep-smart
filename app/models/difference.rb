class Difference < ApplicationRecord
  has_many :charts
  has_many :comments
  belongs_to :user

  def total_weight(new_data)
    require 'data'
    sum = Difference.where(session[:user_id]).where(sunday: false)
    new_total = sum + new_data
    if Date.today == sunday
      new_total[:sunday] = true
      new_total.update
    else
      new_total.update
    end
  end

end
