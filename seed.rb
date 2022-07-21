require_relative 'Library'
lib = Library.new
aut = Author.new "Thomas"
reader = Reader.new "Vlad", "Prudnikov@ukr.net", "Kyiv", "Lomon", "4"

book = Book.new "Title", aut
lib.add_reader reader

lib.add_book book

order = Order.new book, reader, Date.parse("10/10/2021")

lib.add_order order

lib.save

puts lib.number_of_readers_of_the_most_popular_books 5


