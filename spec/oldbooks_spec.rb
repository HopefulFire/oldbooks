RSpec.describe Oldbooks do
	it "has a version number" do
		expect(Oldbooks::VERSION).not_to be nil
	end

	it "does something useful" do
		expect(true).to eq(true)
	end

	context '::Book' do
		it 'initializes with a title, an author, an info, a date, and an url' do
			book = Oldbooks::Book.new(title: 'title', author: 'author', info: 'info', date: 'date', url: "url")
			expect(book.title).to eq('title')
			expect(book.author).to eq('author')
			expect(book.info).to eq('info')
			expect(book.date).to eq('date')
			expect(book.url).to eq('url')
		end
		it '.create initializes a book and saves it' do
			book1 = Oldbooks::Book.create
			book2 = Oldbooks::Book.create
			expect(Oldbooks::Book::ALL).to include(book1)
			expect(Oldbooks::Book::ALL).to include(book2)
		end
		it '.clear_all deletes all books' do
			book = Oldbooks::Book.create
			Oldbooks::Book.clear_all
			expect(Oldbooks::Book::ALL).to eq([])
		end
	end

	context '::Scraper' do
		it 'initializes with a url' do
			scraper = Oldbooks::Scraper.new('https://duckduckgo.com/')
			expect(scraper.instance_variable_get('@url')).to eq('https://duckduckgo.com/')			
		end
	end
end
