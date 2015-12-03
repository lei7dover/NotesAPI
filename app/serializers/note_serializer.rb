class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body

  has_many :tags
end
