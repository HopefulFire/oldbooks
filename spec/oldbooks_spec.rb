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

	context '::Author' do
		it 'initializes with a name, gender, nationality, born, died, and age' do
			author = Oldbooks::Author.new(name: 'name', gender: 'gender', nationality: 'nationality', born: 'born', died: 'died', age: 'age')
			expect(author.name).to eq('name')
			expect(author.gender).to eq('gender')
			expect(author.nationality).to eq('nationality')
			expect(author.born).to eq('born')			
			expect(author.died).to eq('died')
			expect(author.age).to eq('age')
		end
		it 'has_many books' do
			author = Oldbooks::Author.new
			expect(author.books.class).to be(Array)
		end
		it '#add_book can add a book' do
			author = Oldbooks::Author.new
			book = Oldbooks::Book.new
			author.add_book(book)
			expect(author.books).to include(book)
		end
		it '.create initializes an author and saves it' do
			author1 = Oldbooks::Author.create
			author2 = Oldbooks::Author.create
			expect(Oldbooks::Author::ALL).to include(author1)
			expect(Oldbooks::Author::ALL).to include(author2)
		end
		it '.clear_all deletes all authors' do
			author = Oldbooks::Author.create
			Oldbooks::Author.clear_all
			expect(Oldbooks::Author::ALL).to eq([])
		end
	end

	context '::Scraper' do
		it 'initializes with a url' do
			scraper = Oldbooks::Scraper.new('https://duckduckgo.com/')
			expect(scraper.instance_variable_get('@url')).to eq('https://duckduckgo.com/')			
		end
		it 'can scrape an author and his/her books' do
			scraper = Oldbooks::Scraper.new('http://www.authorandbookinfo.com/cgi-bin/auth.pl?L001601')
			scraper.scrape_author_and_books
			expect(Oldbooks::Author::ALL.first.name).to eq('(Nelle) Harper LEE')
			expect(Oldbooks::Book::ALL.first.title).to eq('To Kill A Mockingbird')
		end
	end
end
