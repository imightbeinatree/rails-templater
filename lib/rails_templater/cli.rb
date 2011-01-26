require 'thor/group'

module RailsTemplater
  class Cli < Thor::Group
    argument :application_name, :type => :string, :desc => "The name of the rails application"
    desc "Generates a new Rails application with templater'"

    def run_templater
      #TODO: how do we determine whether they want mongodb or mysql before we run this so we can create it correctly
      #this is what they want it to be if you use mongodb
      system("rails new #{application_name} -JOT -m #{RailsTemplater::template_path}")
      
      #system("rails new #{application_name} -J -m #{RailsTemplater::template_path}")
    end

  end
end
