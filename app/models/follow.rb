class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :followee, class_name: 'User', foreign_key: 'followee_id'

  validates :follower_id, uniqueness: { scope: :followee_id }

  # Add any additional validations or methods as needed
end
