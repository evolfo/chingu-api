class NoteSerializer < ActiveModel::Serializer
  belongs_to :user

  attributes :id, :content, :title
end
