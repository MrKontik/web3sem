module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
    field :create_company, CompanyType, "Create new Company" do
      argument :name, String
      argument :location, String
    end
    def create_company(name:, location:)
      Company.create(name: name, location: location )
    end
    field :create_job, JobType, "Create new job" do
      argument :name, String
      argument :company, Int
    end
    def create_job(name:, company:)
      Job.create(name: name, company_id: company )
    end
  end
end
