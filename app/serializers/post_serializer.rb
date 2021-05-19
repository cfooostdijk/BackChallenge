class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :avatar, :category_id
  # belongs_to :category

  def avatar
    rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end

end