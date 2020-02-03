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
	end
end
