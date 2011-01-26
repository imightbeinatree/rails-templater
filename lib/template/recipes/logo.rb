post_bundler_strategies << lambda do 
  #why don't we download this to the server and put it in the public folder?
  inject_into_file 'app/views/layouts/application.html.haml', "  %img{:src => \"#{@template_options[:logo_image]}\"}\n",:before => '  %p.notice= notice'
end