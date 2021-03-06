require 'thor'
require_relative 'services/covid19_data'
require_relative 'decorators/table'
require_relative 'decorators/chart'

module Covid19
  class Client < Thor
    def self.exit_on_failure?
      true
    end

    desc 'all_continents', 'List all continents data'
    option :table, aliases: '-t', required: false
    option :chart, aliases: '-c', required: false
    option :colored, required: false
    def all_continents
      locality  = Covid19::Decorators::Table::LOCALITY[:continent]
      result = Covid19::Services::Covid19Data.all_continents

      puts result if options.empty?
      render_table(data: result, locality: locality) if options[:table]
      render_chart(data: result,
                   type: Covid19::Decorators::Chart::TYPES[:all_continent_general_data],
                   colored: options[:colored]) if options[:chart]
    end

    desc 'all countries', 'List all countries data'
    option :table, aliases: '-t', required: false
    def all_countries
      locality  = Covid19::Decorators::Table::LOCALITY[:country]
      result = Covid19::Services::Covid19Data.all_countries
      
      puts result if options.empty?
      render_table(data: result, locality: locality) if options[:table]
    end

    desc 'continent CONTINENT_NAME', 'List continent data'
    option :table, aliases: '-t', required: false
    option :chart, aliases: '-c', required: false
    option :colored, required: false
    def continent(continent_name)
      result = Covid19::Services::Covid19Data.continent(continent_name)

      puts result if options.empty?
      render_table(data: result) if options[:table]
      
      if options[:chart]
        render_chart(data: result,
                     type: Covid19::Decorators::Chart::TYPES[:continent_general_data],
                     colored: options[:colored])
        render_chart(data: result,
                     type: Covid19::Decorators::Chart::TYPES[:continent_diary_data],
                     colored: options[:colored])
      end
    end

    desc 'country COUNTRY_NAME', 'List country data'
    option :table, required: false
    option :table, aliases: '-t', required: false
    option :chart, aliases: '-c', required: false
    option :colored, required: false
    def country(country_name)
      result = Covid19::Services::Covid19Data.country(country_name)

      puts result if options.empty?
      
      render_table(data: result) if options[:table]
      
      if options[:chart]
        render_chart(data: result,
                     type: Covid19::Decorators::Chart::TYPES[:country_general_data],
                     colored: options[:colored])
        render_chart(data: result,
                     type: Covid19::Decorators::Chart::TYPES[:country_diary_data],
                     colored: options[:colored])
      end
    end
    
    private
    
      def render_table(data:, locality: nil)
        puts Covid19::Decorators::Table.create(data: data, locality: locality)
      end
    
      def render_chart(data:, type:, colored:) 
        puts Covid19::Decorators::Chart
               .create_pie(data: data, type: type, colored: options[:colored])
      end
  end
end
