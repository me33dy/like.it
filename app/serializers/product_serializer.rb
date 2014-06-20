class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :company_id, :reward, :requirement, :description
 
end
