class UserSerializer < ActiveModel::Serializer
  # attributes :id, :username, :email, :password_digest
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :password
end
