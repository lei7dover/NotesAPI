class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at, :tags

  has_many :tags
  has_one :user
end
