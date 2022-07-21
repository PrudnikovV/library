require_relative 'Classes/Author'
require_relative 'Classes/Book'
require_relative 'Classes/Reader'
require_relative 'Classes/Order'
require_relative "Module/Validation"
require 'yaml'
require 'date'

class Library
  include Validation
  attr_reader :books, :readers, :orders

  @books = []
  @readers = []
  @orders = []

  def initialize
    load
   end

  def add_book(book)
    is_a_class(book, Book)
    @books << book
  end

  def add_reader(reader)
    is_a_class(reader, Reader)
    @readers << reader
  end

  def add_order(order)
    is_a_class(order, Order)
    @orders << order
  end

  def load
    file = File.open("Data/data.yml", "r")
    data = YAML.load(file, aliases: true,permitted_classes: [Library, Book, Reader, Order, Author, Date])
    @books = data.books
    @readers = data.readers
    @orders = data.orders
    file.close
  end

  def save
    file = File.open("Data/data.yml", "w")
    YAML.dump(self, file)
    file.close
  end

  def top_reader count=1
    @orders.map(&:reader).
      reduce(Hash.new(0)){|counts, el| counts[el] += 1; counts}.
      sort_by { |key, count| -count}.
      to_h.
      keys.
      first(count)
  end

  def most_popular_books count=1
    @orders.map(&:book).
      reduce(Hash.new(0)){|counts, el| counts[el] += 1; counts}.
      sort_by { |key, count| -count}.
      to_h.
      keys.
      first(count)
  end

  def number_of_readers_of_the_most_popular_books some_quantity=3
    books = most_popular_books some_quantity
    @orders.select{|n| books.include?(n.book)}.
      map(&:reader).
      uniq.
      size
  end
end
