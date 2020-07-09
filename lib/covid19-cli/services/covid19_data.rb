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
          data(RESOURCES[:continents])
        end

        def all_countries
          data(RESOURCES[:countries])
        end

        def data(resource)
          response = RestClient.get("#{URI}/#{resource}")
 
          JSON.parse(response.body)
        end
      end

      private_class_method :data
    end
  end
end
