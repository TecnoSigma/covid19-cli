require_relative 'services/covid19_data'

RSpec.describe 'Version' do
  it "has a version number" do
    expect(Covid19::VERSION).to eq('0.1.0') 
  end
end
