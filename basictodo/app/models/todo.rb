class Todo < ApplicationRecord
  belongs_to :user
  scope :by_user,  lambda{ |user| where(:user_id => user.id)}

  validates :title , presence: true

  has_rich_text :content


end
