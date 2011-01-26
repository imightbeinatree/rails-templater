require 'thor/group'

module RailsTemplater
  class Cli < Thor::Group
    argument :application_name, :type => :string, :desc => "The name of the rails application"
    desc "Generates a new Rails application with templater'"

    def run_templater
      #this is what they want it to be if you use mongodb
      #system("rails new #{application_name} -JOT -m #{RailsTemplater::template_path}")

      system("rails new #{application_name} -d=mysql -J -m #{RailsTemplater::template_path}")
    end

  end
end
