require 'text-table'

module Covid19
  module Decorators
    class Table
      LOCALITY = { country: 'country', continent: 'continent' }
      DEFAULT_HEADER = %w(cases
                          todayCases
                          deaths
                          todayDeaths
                          recovered
                          todayRecovered
                          active
                          critical
                          tests
                          testsPerOneMillion
                          population)

      def self.create(data:, locality: nil)
        table = Text::Table.new

        # Specific data
        if data.is_a?(Hash)
          table.head = DEFAULT_HEADER
          table.rows = [align_fields(filter_data(data).values)]
        end

        # Data lists
        if data.is_a?(Array) && !locality.empty?
          table.head = DEFAULT_HEADER.unshift(locality)

          data.each { |line| table.rows << align_fields(filter_data(line).values) }
        end

        table.to_s
      end

      def self.align_fields(data)
        data.map { |field| { value: format_number(field), align: :right } }
      end

      def self.filter_data(data)
        organize_fields(data).select { |key, value| DEFAULT_HEADER.include?(key) }
      end

      def self.format_number(number)
        number.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1 ")
      end

      def self.organize_fields(data)
        if DEFAULT_HEADER.include?(LOCALITY[:continent])
          continent = data.slice(LOCALITY[:continent])
          data.delete(LOCALITY[:continent])

          return continent.merge(data)
        end

        data
      end

      private_class_method :align_fields, :filter_data, :format_number, :organize_fields
    end
  end
end
