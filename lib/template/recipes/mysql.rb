#should really specify -d=mysql when creating the rails application
#but that includes the mysql2 gem, which i can't see to get to work on my system today
gem 'mysql'

post_bundler_strategies << lambda do
  create_file 'config/database.yml', load_template('config/database.yml', 'mysql')
  gsub_file 'config/database.yml', 'project_name', "#{application_name}"
  run 'cp config/database.yml config/database.yml.example'
end

#TODO: figure out what to do about making the most general purpose yml file possible, how do we make this work when people have so many different setups
#TODO: how do we bubble down the project name from the cli.rb file so we can gsub it