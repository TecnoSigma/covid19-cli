require 'thor'
require_relative 'services/covid19_data'

module Covid19
  class Cli < Thor
    def self.exit_on_failure?
      true
    end

    desc 'all_continents', 'List all continents data'

    def all_continents
      puts Covid19::Services::Covid19Data.all_continents
    end
  end
end
