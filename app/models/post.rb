class Post < ApplicationRecord
  belongs_to :user
  has_one :post_info
  has_many :comments
end
