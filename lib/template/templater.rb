require File.join(File.dirname(__FILE__), 'core_extensions.rb')

initialize_templater
load_options
apply recipe('default')

apply recipe('mysql') if @template_options[:db] == "mysql"
apply recipe('mongoid') if @template_options[:db] == "mongodb"

required_recipes = %w(jquery haml rspec factory_girl  cucumber design)
required_recipes.each {|required_recipe| apply recipe(required_recipe)}

apply recipe('remarkable') if @template_options[:db] == "mongodb"

say("\nInitial generation complete\n", Thor::Shell::Color::YELLOW)

run 'bundle install'

execute_post_bundler_strategies

environment load_snippet('generators', 'rails')

directory File.join(File.dirname(__FILE__),'generators'), 'lib/generators'

git :add => "."
git :commit => "-m 'Initial commit'"  