class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  
  validates :user_id, presence: true
  validates :content, presence: true
end
