class UserSerializer < ActiveModel::Serializer
  has_many :notes

  attributes :id, :email
end
