require 'tty-pie'

module Covid19
  module Decorators
    class Chart
      TYPES = { all_continent_general_data: 'all_continent_general_data',
                continent_general_data: 'continent_general_data',
                continent_diary_data: 'continent_diary_data',
                country_general_data: 'country_general_data',
                country_diary_data: 'country_diary_data' }
      DEFAULT_FILL = 'Ø'
      SIZE = 15
      FILLS = %w(* x @ + % #)
      COLORS = %i(bright_yellow
                  bright_green
                  bright_magenta
                  bright_cyan
                  bright_red
                  bright_white)
      GENERAL_TOTALS = %w(deaths
                          recovered
                          active)
      DIARY_TOTALS = %w(todayCases
                        todayDeaths
                        todayRecovered)

      def self.create_pie(data:, type:, colored: nil)
        pie_data = case type
                   when TYPES[:all_continent_general_data]
                     mount_all_continent_general_data(data)
                   when TYPES[:continent_general_data]
                     mount_continent_general_data(data)
                   when TYPES[:continent_diary_data]
                     mount_continent_diary_data(data)
                   when TYPES[:country_general_data]
                     mount_country_general_data(data)
                   when TYPES[:country_diary_data]
                     mount_country_diary_data(data)
                   else
                     raise ArgumentError.new('Error in chart plot!')
                   end

        formatted_chart = colored ? add_color(pie_data) : add_fill(pie_data)
 
        TTY::Pie.new(data: formatted_chart, radius: SIZE)
      end

      def self.add_color(pie_data)
        pie_data.each_with_index {|hash, index| hash.merge!({fill: DEFAULT_FILL, color: COLORS[index]})}
      end

      def self.add_fill(pie_data)
        pie_data.each_with_index {|hash, index| hash.merge!({fill: FILLS[index]})}
      end

      def self.mount_all_continent_general_data(data)
        data.map {|occurrency| {name: occurrency['continent'], value: occurrency['cases']}}
      end

      def self.mount_continent_general_data(data)
        data
          .select { |key, value| GENERAL_TOTALS.include?(key) }
          .map { |occurrency| {name: occurrency.first, value: occurrency.last} }
      end

      def self.mount_continent_diary_data(data)
        data
          .select { |key, value| DIARY_TOTALS.include?(key) }
          .map { |occurrency| {name: occurrency.first, value: occurrency.last} }
      end

      def self.mount_country_general_data(data)
        data
          .select { |key, value| GENERAL_TOTALS.include?(key) }
          .map { |occurrency| {name: occurrency.first, value: occurrency.last} }
      end 

      def self.mount_country_diary_data(data)
        data
          .select { |key, value| DIARY_TOTALS.include?(key) }
          .map { |occurrency| {name: occurrency.first, value: occurrency.last} }
      end 
    end
  end
end
