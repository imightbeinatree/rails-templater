gem 'devise'
gem 'hpricot'
gem 'ruby_parser'

stategies << lambda do 
  generate 'devise:install'
  generate 'devise User'
  generate 'devise:views'
  
  inject_into_file 'config/environments/development.rb', 
  	"config.action_mailer.default_url_options = { :host => 'localhost:3000' }", 
  	:after => 'Foobarian::Application.configure do\n'

  inject_into_file 'app/models/user.rb', 
	'attr_accessible :email, :password, :password_confirmation',
	:after => '         :recoverable, :rememberable, :trackable, :validatable\n'

  application_layout_modification = <<-END
  .user_nav
    - if user_signed_in?
      = link_to "Sign out", destroy_user_session_path
    - else
      = link_to "Sign up", new_user_registration_path
      or
      = link_to "sign in", new_user_session_path
  END

  inject_into_file 'app/views/layouts/application.html.haml', application_layout_modification, 
	:after => '%body\n'
end

