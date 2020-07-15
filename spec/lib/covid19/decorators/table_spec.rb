require_relative '../../../../lib/covid19/decorators/table'

RSpec.describe 'Covid19::Decorators::Table' do
  describe '.create' do
    it 'returns specific data in table format' do
      data = {"updated"=>1594706997629, "country"=>"Brazil", "countryInfo"=>{"_id"=>76, "iso2"=>"BR", "iso3"=>"BRA", "lat"=>-10, "long"=>-55, "flag"=>"https://disease.sh/assets/img/flags/br.png"}, "cases"=>1887959, "todayCases"=>0, "deaths"=>72921, "todayDeaths"=>0, "recovered"=>1213512, "todayRecovered"=>0, "active"=>601526, "critical"=>8318, "casesPerOneMillion"=>8880, "deathsPerOneMillion"=>343, "tests"=>4572796, "testsPerOneMillion"=>21508, "population"=>212611764, "continent"=>"South America", "oneCasePerPeople"=>113, "oneDeathPerPeople"=>2916, "oneTestPerPeople"=>46, "activePerOneMillion"=>2829.22, "recoveredPerOneMillion"=>5707.64, "criticalPerOneMillion"=>39.12}

      expected_result = "+-----------+------------+--------+-------------+-----------+----------------+---------+----------+-----------+--------------------+-------------+\n|   cases   | todayCases | deaths | todayDeaths | recovered | todayRecovered | active  | critical |   tests   | testsPerOneMillion | population  |\n+-----------+------------+--------+-------------+-----------+----------------+---------+----------+-----------+--------------------+-------------+\n| 1 887 959 |          0 | 72 921 |           0 | 1 213 512 |              0 | 601 526 |    8 318 | 4 572 796 |             21 508 | 212 611 764 |\n+-----------+------------+--------+-------------+-----------+----------------+---------+----------+-----------+--------------------+-------------+\n"

      result = Covid19::Decorators::Table.create(data: data)

      expect(result).to eq(expected_result)
    end

    it 'returns general list in table format' do
      data = [{"updated"=>1594779763760, "cases"=>4152507, "todayCases"=>7057, "deaths"=>188977, "todayDeaths"=>837, "recovered"=>1939661, "todayRecovered"=>4932, "active"=>2023869, "critical"=>19737, "casesPerOneMillion"=>7046.81, "deathsPerOneMillion"=>320.69, "tests"=>49174748, "testsPerOneMillion"=>83449.65, "population"=>589274482, "continent"=>"North America", "activePerOneMillion"=>3434.51, "recoveredPerOneMillion"=>3291.61, "criticalPerOneMillion"=>33.49, "continentInfo"=>{"lat"=>31.6768272, "long"=>-146.4707474}, "countries"=>["Anguilla", "Antigua and Barbuda", "Aruba", "Bahamas", "Barbados", "Belize", "Bermuda", "British Virgin Islands", "Canada", "Caribbean Netherlands", "Cayman Islands", "Costa Rica", "Cuba", "Curaçao", "Dominica", "Dominican Republic", "El Salvador", "Greenland", "Grenada", "Guadeloupe", "Guatemala", "Haiti", "Honduras", "Jamaica", "Martinique", "Mexico", "Montserrat", "Nicaragua", "Panama", "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin", "Saint Pierre Miquelon", "Saint Vincent and the Grenadines", "Sint Maarten", "St. Barth", "Trinidad and Tobago", "Turks and Caicos Islands", "USA"]}]

      expected_result = "+---------------+-----------+------------+---------+-------------+-----------+----------------+-----------+----------+------------+--------------------+-------------+\n|   continent   |   cases   | todayCases | deaths  | todayDeaths | recovered | todayRecovered |  active   | critical |   tests    | testsPerOneMillion | population  |\n+---------------+-----------+------------+---------+-------------+-----------+----------------+-----------+----------+------------+--------------------+-------------+\n| North America | 4 152 507 |      7 057 | 188 977 |         837 | 1 939 661 |          4 932 | 2 023 869 |   19 737 | 49 174 748 |          83 449.65 | 589 274 482 |\n+---------------+-----------+------------+---------+-------------+-----------+----------------+-----------+----------+------------+--------------------+-------------+\n"

      result = Covid19::Decorators::Table.create(data: data, locality: 'continent')

      expect(result).to eq(expected_result)
    end
  end
end
