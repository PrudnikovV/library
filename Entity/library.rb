# frozen_string_literal: true

require_relative '../Module/storage'
require_relative '../Module/statistic'
# class for library
class Library
  include Statistic
  include Storage

  attr_accessor :books, :readers, :orders

  def initialize
    @books = []
    @authors = []
    @readers = []
    @orders = []
    load
  end

  def add(new_el)
    case new_el.class
    when Order
      add_order new_el
    when Book
      add_book new_el
    when Reader
      add_reader new_el
    when Author
      add_author new_el
    end
  end

  private

  def add_order(_order)
    new_order.book = fined_or_add(new_order.book)
    new_order.reader = fined_or_add(new_order.reader)
    @orders << new_order
  end

  def add_book(book)
    book.author = fined_or_add(book.author)
    @books << book until @books.include?(book)
  end

  def add_reader(reader)
    @readers << reader until @readers.include?(reader)
  end

  def add_author(author)
    @authors << author until @authors.include?(author)
  end

  def find(el_library)
    case el_library.class
    when Book
      found_el_library = @books.find { |el| el == el_library }
    when Reader
      found_el_library = @readers.find { |el| el == el_library }
    when Author
      found_el_library = @authors.find { |el| el == el_library }
    end
    found_el_library
  end

  def fined_or_add(el_library)
    found_el_library = find el_library
    found_el_library.nil? ? add(el_library) : found_el_library
  end
end
