class Oldbooks::CLI

	URLS =
	{
		fiction_books: '/en-us/category/fiction-books',
		non_fiction_books: '/en-us/category/non-fiction-books',
		childrens_books: '/en-us/category/childrens-books',
		rare_books: '/en-us/category/rare-books'
	}

	def choose_url
		puts 'Enter 1 for fiction, 2 for non-fiction, 3 for childrens, and 4 for rare books:'
		
		case gets.strip
		when '1'
			URLS[:fiction_books]
		when '2'
			URLS[:non_fiction_books]
		when '3'
			URLS[:childrens_books]
		when '4'
			URLS[:rare_books]
		else
			choose_url
		end
	end
end