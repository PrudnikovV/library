# frozen_string_literal: true

require_relative 'library'

lib = Library.new

aut = Author.new 'Thomas'
reader = Reader.new 'Vlad', 'Prudnikov@ukr.net', 'Kyiv', 'Lomon', '4'
book = Book.new 'Title', aut

lib.add_reader reader

lib.add_book book

lib.add_author aut

order = Order.new book, reader, Date.parse('10/10/2021')

lib.add_order order

lib.save

puts lib.most_popular_books

puts lib.top_reader 3

puts lib.number_of_readers_of_the_most_popular_books 3
