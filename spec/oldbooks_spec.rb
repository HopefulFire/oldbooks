RSpec.describe Oldbooks do
	it "has a version number" do
		expect(Oldbooks::VERSION).not_to be nil
	end

	it "does something useful" do
		expect(true).to eq(true)
	end

	context '::Book' do
		it 'initializes with a title, an author, and a summary' do
			book = Oldbooks::Book.new(title: 'title', author: 'author', summary: 'summary')
			expect(book.title).to eq('title')
			expect(book.author).to eq('author')
			expect(book.summary).to eq('summary')
		end
	end

	context '::Author' do
		it 'initializes with a name' do
			author = Oldbooks::Author.new(name: 'name')
			expect(author.name).to eq('name')
		end
	end
end
