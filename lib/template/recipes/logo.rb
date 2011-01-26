post_bundler_strategies << lambda do 
  #why don't we download this to the server and put it in the public folder?
  
  
  
  
  application_layout_modification = <<-END

  %img{:src => @template_options[:logo_image]}

END

  inject_into_file 'app/views/layouts/application.html.haml', application_layout_modification,:before => '%p.notice= notice'
end