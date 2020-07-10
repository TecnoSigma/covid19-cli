require 'rest-client'
require 'json'

module Covid19
  module Services
    class Covid19Data
      URI = 'https://corona.lmao.ninja/v3/covid-19'
      RESOURCES = { continents: 'continents',
                    countries: 'countries' }

      class << self
        def all_continents
          data(resource: RESOURCES[:continents])
        end

        def all_countries
          data(resource: RESOURCES[:countries])
        end

        def continent(continent_name)
          data(resource: RESOURCES[:continents], query: titleize(continent_name))
        end

        def country(country_name)
          data(resource: RESOURCES[:countries], query: titleize(country_name))
        end

        def data(resource:, query: nil)
          response = RestClient.get("#{URI}/#{resource}/#{query}")
 
          JSON.parse(response.body)
        end

        def titleize(string)
          string
            .split('_')
            .map { |str| str.capitalize }
            .join('%20')
        end
      end

      private_class_method :data, :titleize
    end
  end
end
