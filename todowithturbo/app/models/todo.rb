class Todo < ApplicationRecord

  after_update_commit { broadcast_append_to "todos"}
  enum status: {complete: 1 , incomplete: 0}
  validates :title , presence: true
end
