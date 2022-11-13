module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :allCompany, [CompanyType], 'All Company everywhere'do
      argument :size, Int, required: false, default_value: 15
    end
    def allCompany(size:)
      Company.all.limit(size).order(id: :asc)
    end
    field :company, CompanyType, 'One Company by its ID'do
      argument :id, Int, required: true
    end
    def company(id:)
      Company.find(id)
    end
    field :allJob, [JobType], 'All Job everywhere'do
      argument :size, Int, required: false, default_value: 15
    end
    def allJob(size:)
      Job.all.limit(size).order(id: :asc)
    end
    field :job, JobType, 'One Job by its ID'do
      argument :id, Int, required: true
    end
    def job(id:)
      Job.find(id)
    end
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
