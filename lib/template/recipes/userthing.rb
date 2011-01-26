#TODO: accept user input to define the scaffold for the user thing
post_bundler_strategies << lambda do
  generate 'scaffold UserThing name:string size:integer user_id:integer'
end

#TODO: lock down the things to the users for editing, deleting
#TODO: add option to let it be a private thing, no public index of all the things