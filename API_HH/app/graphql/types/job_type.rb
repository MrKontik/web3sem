module Types
  class JobType < Types::BaseObject
    graphql_name 'Job'
    description 'Description job'
    field :id, GraphQL::Types::ID
    field :name, GraphQL::Types::String
    field :company, ::Types::CompanyType
    def company()
      object.company
    end
  end
end