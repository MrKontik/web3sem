class CompanySerializer < ActiveModel::Serializer
  attributes  :id, :name, :location, :created_at, :updated_at
end
