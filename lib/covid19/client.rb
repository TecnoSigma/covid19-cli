require 'thor'
require_relative 'services/covid19_data'
require_relative 'decorators/table'

module Covid19
  class Client < Thor
    def self.exit_on_failure?
      true
    end

    desc 'all_continents', 'List all continents data'
    option :table, required: false
    def all_continents
      locality  = Covid19::Decorators::Table::LOCALITY[:continent]
      result = Covid19::Services::Covid19Data.all_continents

      puts options[:table] ?
        Covid19::Decorators::Table.create(data: result, locality: locality) :
        result
    end

    desc 'all countries', 'List all countries data'
    option :table, required: false
    def all_countries
      locality  = Covid19::Decorators::Table::LOCALITY[:country]
      result = Covid19::Services::Covid19Data.all_countries

      puts options[:table] ?
        Covid19::Decorators::Table.create(data: result, locality: locality):
        result
    end

    desc 'continent CONTINENT_NAME', 'List continent data'
    option :table, required: false
    def continent(continent_name)
      result = Covid19::Services::Covid19Data.continent(continent_name)

      puts options[:table] ? Covid19::Decorators::Table.create(data: result) : result
    end

    desc 'country COUNTRY_NAME', 'List country data'
    option :table, required: false
    def country(country_name)
      result = Covid19::Services::Covid19Data.country(country_name)

      puts options[:table] ? Covid19::Decorators::Table.create(data: result) : result
    end
  end
end
