class Post < ApplicationRecord

  include Searchable

  belongs_to :category
  belongs_to :user

  has_one_attached :avatar

  acts_as_paranoid
  # Use -> Post.only_deleted ; Post.with_deleted ; Post.restore(id)

  default_scope {order(date: :desc)}
end