#TODO: accept user input to define the scaffold for the thing
post_bundler_strategies << lambda do
  generate 'scaffold Thing name:string size:integer'
end
