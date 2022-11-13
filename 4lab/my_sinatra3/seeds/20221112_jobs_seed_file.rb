Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    puts 'run seed jobs'
    dataset = DB[:jobs]
    dataset.insert( :name => 'Developer', :place => 'Remote', :company_id => 1)
    dataset.insert( :name => 'Analyz', :place => 'Contract', :company_id => 2)
    dataset.insert( :name => 'QA', :place => 'Remote', :company_id => 3)
    dataset.insert( :name => 'TA', :place => 'Permanent', :company_id => 1)
    dataset.insert( :name => 'Product Manager', :place => 'Remote', :company_id => 4)
    dataset.insert( :name => 'Devops', :place => 'Permanent', :company_id => 4)
    dataset.insert( :name => 'Front-end developer', :place => 'Permanent', :company_id => 4)
  end
end