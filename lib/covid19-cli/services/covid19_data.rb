require 'rest-client'
require 'json'

module Covid19
  module Services
    class Covid19Data
      class << self
        def all_continents
          data('continents')
        end

        def data(resource)
          response = RestClient.get("https://corona.lmao.ninja/v3/covid-19/#{resource}")
 
          JSON.parse(response.body)
        end
      end

      private_class_method :data
    end
  end
end
