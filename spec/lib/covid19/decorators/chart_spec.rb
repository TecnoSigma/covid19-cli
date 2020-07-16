require_relative '../../../../lib/covid19/decorators/chart'

RSpec.describe 'Covid19::Decorators::Chart' do
  describe '.create_pie' do
    it 'returns continent general data in chart format' do
      data = {"updated"=>1594917732234, "cases"=>3186881, "todayCases"=>55997, "deaths"=>75141, "todayDeaths"=>1254, "recovered"=>2232648, "todayRecovered"=>30503, "active"=>879092, "critical"=>19976, "casesPerOneMillion"=>691.15, "deathsPerOneMillion"=>16.3, "tests"=>136692398, "testsPerOneMillion"=>29645.11, "population"=>4610959075, "continent"=>"Asia", "activePerOneMillion"=>190.65, "recoveredPerOneMillion"=>484.2, "criticalPerOneMillion"=>4.33, "continentInfo"=>{"lat"=>23.7027273, "long"=>62.3750637}, "countries"=>["Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "Cyprus", "Georgia", "Hong Kong", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic", "Lebanon", "Macao", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "Oman", "Pakistan", "Palestine", "Philippines", "Qatar", "S. Korea", "Saudi Arabia", "Singapore", "Sri Lanka", "Syrian Arab Republic", "Taiwan", "Tajikistan", "Thailand", "Timor-Leste", "Turkey", "UAE", "Uzbekistan", "Vietnam", "Yemen"]}

      result = Covid19::Decorators::Chart.create_pie(data: data, type: 'continent_general_data', colored: 'colored')

      expect(result).not_to be_nil
    end

    it 'returns country general data in chart format' do
      data = {"updated"=>1594917731967, "country"=>"Brazil", "countryInfo"=>{"_id"=>76, "iso2"=>"BR", "iso3"=>"BRA", "lat"=>-10, "long"=>-55, "flag"=>"https://disease.sh/assets/img/flags/br.png"}, "cases"=>1978236, "todayCases"=>7327, "deaths"=>75697, "todayDeaths"=>174, "recovered"=>1366775, "todayRecovered"=>111211, "active"=>535764, "critical"=>8318, "casesPerOneMillion"=>9304, "deathsPerOneMillion"=>356, "tests"=>4911063, "testsPerOneMillion"=>23098, "population"=>212620008, "continent"=>"South America", "oneCasePerPeople"=>107, "oneDeathPerPeople"=>2809, "oneTestPerPeople"=>43, "activePerOneMillion"=>2519.82, "recoveredPerOneMillion"=>6428.25, "criticalPerOneMillion"=>39.12}

      result = Covid19::Decorators::Chart.create_pie(data: data, type: 'country_general_data', colored: 'colored')

      expect(result).not_to be_nil
    end
    
    it 'returns continent diary data in chart format' do
      data = {"updated"=>1594917732234, "cases"=>3186881, "todayCases"=>55997, "deaths"=>75141, "todayDeaths"=>1254, "recovered"=>2232648, "todayRecovered"=>30503, "active"=>879092, "critical"=>19976, "casesPerOneMillion"=>691.15, "deathsPerOneMillion"=>16.3, "tests"=>136692398, "testsPerOneMillion"=>29645.11, "population"=>4610959075, "continent"=>"Asia", "activePerOneMillion"=>190.65, "recoveredPerOneMillion"=>484.2, "criticalPerOneMillion"=>4.33, "continentInfo"=>{"lat"=>23.7027273, "long"=>62.3750637}, "countries"=>["Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "Cyprus", "Georgia", "Hong Kong", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic", "Lebanon", "Macao", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "Oman", "Pakistan", "Palestine", "Philippines", "Qatar", "S. Korea", "Saudi Arabia", "Singapore", "Sri Lanka", "Syrian Arab Republic", "Taiwan", "Tajikistan", "Thailand", "Timor-Leste", "Turkey", "UAE", "Uzbekistan", "Vietnam", "Yemen"]}

      result = Covid19::Decorators::Chart.create_pie(data: data, type: 'continent_diary_data', colored: 'colored')

      expect(result).not_to be_nil
    end
    
    it 'returns country diary data in chart format' do
      data = {"updated"=>1594917731967, "country"=>"Brazil", "countryInfo"=>{"_id"=>76, "iso2"=>"BR", "iso3"=>"BRA", "lat"=>-10, "long"=>-55, "flag"=>"https://disease.sh/assets/img/flags/br.png"}, "cases"=>1978236, "todayCases"=>7327, "deaths"=>75697, "todayDeaths"=>174, "recovered"=>1366775, "todayRecovered"=>111211, "active"=>535764, "critical"=>8318, "casesPerOneMillion"=>9304, "deathsPerOneMillion"=>356, "tests"=>4911063, "testsPerOneMillion"=>23098, "population"=>212620008, "continent"=>"South America", "oneCasePerPeople"=>107, "oneDeathPerPeople"=>2809, "oneTestPerPeople"=>43, "activePerOneMillion"=>2519.82, "recoveredPerOneMillion"=>6428.25, "criticalPerOneMillion"=>39.12}

      result = Covid19::Decorators::Chart.create_pie(data: data, type: 'country_diary_data', colored: 'colored')

      expect(result).not_to be_nil
    end
    
    it 'returns all continent general data in chart format' do
      data = [{"updated"=>1594917732234, "cases"=>3186881, "todayCases"=>55997, "deaths"=>75141, "todayDeaths"=>1254, "recovered"=>2232648, "todayRecovered"=>30503, "active"=>879092, "critical"=>19976, "casesPerOneMillion"=>691.15, "deathsPerOneMillion"=>16.3, "tests"=>136692398, "testsPerOneMillion"=>29645.11, "population"=>4610959075, "continent"=>"Asia", "activePerOneMillion"=>190.65, "recoveredPerOneMillion"=>484.2, "criticalPerOneMillion"=>4.33, "continentInfo"=>{"lat"=>23.7027273, "long"=>62.3750637}, "countries"=>["Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "Cyprus", "Georgia", "Hong Kong", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic", "Lebanon", "Macao", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "Oman", "Pakistan", "Palestine", "Philippines", "Qatar", "S. Korea", "Saudi Arabia", "Singapore", "Sri Lanka", "Syrian Arab Republic", "Taiwan", "Tajikistan", "Thailand", "Timor-Leste", "Turkey", "UAE", "Uzbekistan", "Vietnam", "Yemen"]}]

      result = Covid19::Decorators::Chart.create_pie(data: data, type: 'all_continent_general_data', colored: 'colored')

      expect(result).not_to be_nil
    end
  end
end
