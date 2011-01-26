if template_options[:design] == :compass
  gem 'compass'

  # TODO: support more than one framework from compass
  compass_sass_dir = "app/stylesheets"
  compass_css_dir = "public/stylesheets/compiled"

  compass_command = "compass init rails . --using blueprint/semantic --css-dir=#{compass_css_dir} --sass-dir=#{compass_sass_dir} "

  post_bundler_strategies << lambda do
    puts "Beginning Compass setup"
    run compass_command
    application_layout_modification = <<-END    

  = stylesheet_link_tag 'compiled/screen.css', :media => 'screen, projection'
  = stylesheet_link_tag 'compiled/print.css', :media => 'print'
  /[if lt IE 8]
  = stylesheet_link_tag 'compiled/ie.css', :media => 'screen, projection'
END
    inject_into_file 'app/views/layouts/application.html.haml', application_layout_modification, :after => '%head'
    puts "Compass has been setup"    
  end
  
end
