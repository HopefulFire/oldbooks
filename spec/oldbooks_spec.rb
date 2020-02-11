RSpec.describe Oldbooks do
	it "has a version number" do
		expect(Oldbooks::VERSION).not_to be nil
	end

	it "does something useful" do
		expect(true).to eq(true)
	end

	context '::CLI' do
		it '::URLS is a hash of urls' do
			expect(Oldbooks::CLI::URLS.class).to be(Hash)
		end
		it '#choose_url chooses a url' do
			expect(Oldbooks::CLI::URLS.values).to include(Oldbooks::CLI.new.choose_url)
		end
	end

	context '::Book' do
		it 'initializes with a title, an author, a publisher, a condition, a price, and a url' do
			book = Oldbooks::Book.new(title: 'title', author: 'author', publisher: 'publisher', condition: 'condition', price: 'price', url: 'url')
			expect(book.title).to eq('title')
			expect(book.author).to eq('author')
			expect(book.publisher).to eq('publisher')
			expect(book.condition).to eq('condition')
			expect(book.price).to eq('price')
			expect(book.url).to eq('url')
		end
		it '.create initializes a book and saves it' do
			book = Oldbooks::Book.create
			expect(Oldbooks::Book::ALL).to include(book)
		end
		it '.clear_all clears all books' do
			Oldbooks::Book.clear_all
			expect(Oldbooks::Book::ALL).to eq([])
		end
	end

	context '::Scraper' do
		it 'initializes with a url' do
			scraper = Oldbooks::Scraper.new('')
			expect(scraper.instance_variable_get('@url')).to eq('https://www.worldofbooks.com')			
		end
		it '#scrape_booklist scrapes a list of books' do
			scraper = Oldbooks::Scraper.new(Oldbooks::CLI::URLS[:fiction_books])
			scraper.scrape_booklist
			expect(Oldbooks::Book::ALL.length).to eq(48)
		end
		it '#scrape_book scrapes a book given a book with a url' do
			book = Oldbooks::Book::ALL.first
			expect(book.title).not_to be(nil)
		end
	end
end
