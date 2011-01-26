gem 'mysql'

post_bundler_strategies << lambda do
  run 'cp config/database.yml config/database.yml.example'
end
