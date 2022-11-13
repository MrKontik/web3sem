class Company < Sequel::Model
  one_to_many  :jobs
  def to_api # Not for array!!
    {
      id: id.to_s,
      name: name,
      location: location,
    }
  end
  def self.company_jobs(name)
    company = Company.by_name(name)#[:id]
    company_id = company.map(:id)[0]
    company_id.nil? ? [].to_json : company_id.to_json
    company_jobs = Job.company_jobs(company_id)
    company_jobs.empty? ? [].to_json : collection_to_api(company_jobs)
  end

  def self.by_name(name)
    res = []
    res = where(name: /#{name}/i) if name
    puts "In by_name dataset mod: res = #{res.inspect}"
    # res.empty? ? [].to_json : collection_to_api(res)
    res.empty? ? [] : res
  end

  dataset_module do
    def by_location(location)
      where(location: /#{location}/i) if location
    end
  end

end
