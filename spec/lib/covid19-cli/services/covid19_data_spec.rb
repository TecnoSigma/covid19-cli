require_relative '../../../../lib/covid19-cli/services/covid19_data'

RSpec.describe 'Covid19::Services::Covid19Data' do
  describe '.all_continents' do
    it 'returns all continents in JSON format' do
      result = Covid19::Services::Covid19Data.all_continents

      expect(result).not_to be_empty
    end
  end

  describe '.all_countries' do
    it 'returns all countries in JSON format' do
      result = Covid19::Services::Covid19Data.all_countries

      expect(result).not_to be_empty
    end 
  end

  describe '.continent' do
    it 'returns country data in JSON format' do
      continent_name = 'asia'
      result = Covid19::Services::Covid19Data.continent(continent_name)

      expect(result).not_to be_empty
    end
  end
end
