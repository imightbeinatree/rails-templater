#should really specify -d=mysql when creating the rails application
#but that includes the mysql2 gem, which i can't see to get to work on my system today
gem 'mysql'

post_bundler_strategies << lambda do
  create_file 'config/database.yml', load_template('config/database.yml', 'mysql')
  gsub_file 'config/application.rb', 'require "rails/test_unit/railtie"', '# require "rails/test_unit/railtie"'  
  run 'cp config/database.yml config/database.yml.example'
end
