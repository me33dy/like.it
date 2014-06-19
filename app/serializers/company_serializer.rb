class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :url, :mission
  has_many :products
end
