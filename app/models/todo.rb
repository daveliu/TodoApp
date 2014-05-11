class Todo < ActiveRecord::Base
  belongs_to :user

  acts_as_list scope: :user, column: :priority, add_new_at: :top

  validates :content, presence: true, length: {maximum: 255}
  validates :user, presence: true
end
