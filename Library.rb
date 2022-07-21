require '/Classes.Author'
require '/Classes.Book'
require '/Classes.Reader'
require '/Classes.Order'
require "./Module/Validation"

require 'yaml'

class Library
  include Validation
  def initialize
    load_data
    @books = []
    @readers = []
    @orders = []
   end

  privat

  def add_book(book)
    is_a_book(book)
    @books << book
  end

  def add_reader(reader)
    is_a_reader(reader)
    @readers << reader
  end

  def add_order(order)
    is_a_order(order)
    @orders << order
  end

end

