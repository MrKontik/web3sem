Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    puts 'run seed companies'
    dataset = DB[:companies]
    dataset.insert(:name => 'Lary', :location => 'Moskow')
    dataset.insert(:name => 'Ozon', :location => 'Saint-Petersburg')
    dataset.insert(:name => 'Puma', :location => 'Rostov')
    dataset.insert(:name => 'Amazon', :location => 'London')
  end
end