require_relative '../../../../lib/covid19/decorators/table'

RSpec.describe 'Covid19::Decorators::Table' do
  describe '.create' do
    it 'retuns data in table format' do
      data = {"updated"=>1594706997629, "country"=>"Brazil", "countryInfo"=>{"_id"=>76, "iso2"=>"BR", "iso3"=>"BRA", "lat"=>-10, "long"=>-55, "flag"=>"https://disease.sh/assets/img/flags/br.png"}, "cases"=>1887959, "todayCases"=>0, "deaths"=>72921, "todayDeaths"=>0, "recovered"=>1213512, "todayRecovered"=>0, "active"=>601526, "critical"=>8318, "casesPerOneMillion"=>8880, "deathsPerOneMillion"=>343, "tests"=>4572796, "testsPerOneMillion"=>21508, "population"=>212611764, "continent"=>"South America", "oneCasePerPeople"=>113, "oneDeathPerPeople"=>2916, "oneTestPerPeople"=>46, "activePerOneMillion"=>2829.22, "recoveredPerOneMillion"=>5707.64, "criticalPerOneMillion"=>39.12}

      expected_result = "+-----------+------------+--------+-------------+-----------+----------------+---------+----------+-----------+--------------------+-------------+\n|   cases   | todayCases | deaths | todayDeaths | recovered | todayRecovered | active  | critical |   tests   | testsPerOneMillion | population  |\n+-----------+------------+--------+-------------+-----------+----------------+---------+----------+-----------+--------------------+-------------+\n| 1 887 959 |          0 | 72 921 |           0 | 1 213 512 |              0 | 601 526 |    8 318 | 4 572 796 |             21 508 | 212 611 764 |\n+-----------+------------+--------+-------------+-----------+----------------+---------+----------+-----------+--------------------+-------------+\n"

      result = Covid19::Decorators::Table.create(data)

      expect(result).to eq(expected_result)
    end
  end
end
