namespace '/api/v1' do

  get '/jobs' do
    logger.info "Logger In get /gobs"
    jobs = Job.all
    [:place, :name].each do |filter|
      jobs = jobs.send(filter, params[filter]) if params[filter]
    end
    collection_to_api(jobs)
  end

  get '/job/:id' do
    job = Job.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
    puts "job id = #{job.id.inspect} "
    puts "job = #{job.values.inspect} "
    job.values.to_json # serialization
  end

  get '/jobs_company/:name' do
    company = Company.where(name: params[:name]).first
    halt(404, { message:'Company Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
    company_id = company.id
    puts "company id = #{company_id.inspect}"

    jobs = Job.where(company_id: company_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless jobs

    collection_to_api(jobs)
  end

end