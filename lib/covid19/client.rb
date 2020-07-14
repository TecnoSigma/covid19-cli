require 'thor'
#require_relative 'services/covid19_data'

module Covid19
  class Client < Thor
    def self.exit_on_failure?
      true
    end

    desc 'all_continents', 'List all continents data'
    def all_continents
      puts true #Covid19::Services::Covid19Data.all_continents
    end

    desc 'all countries', 'List all countries data'
    def all_countries
      puts #Covid19::Services::Covid19Data.all_countries
    end

    desc 'continent CONTINENT_NAME', 'List continent data'
    def continent(continent_name)
      puts #Covid19::Services::Covid19Data.continent(continent_name)
    end

    desc 'country COUNTRY_NAME', 'List country data'
    def country(country_name)
      puts #Covid19::Services::Covid19Data.country(country_name)
    end
  end
end
