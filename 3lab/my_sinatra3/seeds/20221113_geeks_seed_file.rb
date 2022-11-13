Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    puts 'run seed geeks'
    dataset = DB[:geeks]
    dataset.insert( :name => 'Alekandr Pupkin', :stack => 'Developer, RubyOnRails, JS', :resume => true)
    dataset.insert( :name => 'Vasiliy Korkin', :stack => 'Developer, Node, JS', :resume => false)
    dataset.insert( :name => 'Michail Dolov', :stack => 'Developer, Php, HTML', :resume => true)
    dataset.insert( :name => 'Maria Anra', :stack => 'Frond-end developer', :resume => true)
    dataset.insert( :name => 'Sergey Tarasov', :stack => 'managering', :resume => true)
    dataset.insert( :name => 'Egor Voronin', :stack => 'testirovanie', :resume => false)
    dataset.insert( :name => 'Irina Medvedeva', :stack => 'cloud, azure', :resume => true)
    dataset.insert( :name => 'Nadia Oblomova', :stack => 'Test Automation', :resume => false)
  end
end