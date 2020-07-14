require 'text-table'

module Covid19
  module Decorators
    class Table
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

      def self.create(data)
        table = Text::Table.new
        table.head = DEFAULT_HEADER
        table.rows = [align_fields(filter_data(data).values)]

        table.to_s
      end

      def self.align_fields(data)
        data.map { |field| { value: format_number(field), align: :right } }
      end

      def self.filter_data(data)
        data.select { |key, value| DEFAULT_HEADER.include?(key) }
      end

      def self.format_number(number)
        number.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1 ")
      end

      private_class_method :align_fields, :filter_data, :format_number
    end
  end
end
