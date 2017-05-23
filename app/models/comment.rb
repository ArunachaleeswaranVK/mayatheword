class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates :commenter, presence: true, length: { minimum: 3}
  validates :body, presence: true
end
