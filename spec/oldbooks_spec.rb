RSpec.describe Oldbooks do
	it "has a version number" do
		expect(Oldbooks::VERSION).not_to be nil
	end

	it "does something useful" do
		expect(true).to eq(true)
	end

	context '::Scraper' do
		it 'initializes with a url' do
			scraper = Oldbooks::Scraper.new('https://duckduckgo.com/')
			expect(scraper.instance_variable_get('@url')).to eq('https://duckduckgo.com/')			
		end
	end
end
