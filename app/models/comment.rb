class Comment < ApplicationRecord
  belongs_to :difference
  belongs_to :user
end
