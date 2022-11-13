module Types
  class CompanyType < Types::BaseObject
    graphql_name 'Company'
    description 'Description company'
    field :id, GraphQL::Types::ID
    field :name, GraphQL::Types::String
    field :location, GraphQL::Types::String
    field :jobs, [::Types::JobType]do # types declaration for collection
      argument :size, Int, default_value: 15
    end
    def jobs(size:)
      object.jobs.limit(size).order(id: :asc) # :desc
    end
  end
end