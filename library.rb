# frozen_string_literal: true

require_relative 'Classes/author'
require_relative 'Classes/book'
require_relative 'Classes/reader'
require_relative 'Classes/order'
require_relative 'Module/validation'
require 'yaml'
require 'date'

# class for library
class Library
  include Validation
  attr_reader :books, :readers, :orders

  def initialize
    @books = []
    @authors = []
    @readers = []
    @orders = []
    load
  end

  def add_book(book)
    check_class(book, Book)
    book.author = fined_or_add_author(book.author)
    @books << book until @books.include?(book)
  end

  def add_reader(reader)
    check_class(reader, Reader)
    @readers << reader until @readers.include?(reader)
  end

  def add_author(author)
    check_class(author, Author)
    @authors << author until @authors.include?(author)
  end

  def add_order(order)
    check_class(order, Order)
    order.book = fined_or_add_book(order.book)
    order.reader = fined_or_add_reader(order.reader)
    @orders << order
  end

  def load
    file = File.open('Data/data.yml', 'r')
    data = YAML.load(file, aliases: true, permitted_classes: [Library, Book, Reader, Order, Author, Date])
    @books = data.books
    @readers = data.readers
    @orders = data.orders
    file.close
  end

  def save
    file = File.open('Data/data.yml', 'w')
    YAML.dump(self, file)
    file.close
  end

  def top_reader(count = 1)
    @orders.map(&:reader)
           .each_with_object(Hash.new(0)) { |el, counts| counts[el] += 1 }
           .sort_by { |_key, q| -q }
           .to_h
           .keys
           .first(count)
  end

  def most_popular_books(count = 1)
    @orders.map(&:book)
           .each_with_object(Hash.new(0)) { |el, counts| counts[el] += 1 }
           .sort_by { |_key, q| -q }
           .to_h
           .keys
           .first(count)
  end

  def number_of_readers_of_the_most_popular_books(some_quantity = 3)
    books = most_popular_books some_quantity
    @orders.select { |n| books.include?(n.book) }
           .map(&:reader)
           .uniq
           .size
  end

  private

  def fined_or_add_author(author)
    author_new = @authors.find { |el| el == author }
    author_new.nil? ? add_author(author) : author_new
  end

  def fined_or_add_book(book)
    book_new = @books.find { |el| el == book }
    book_new.nil? ? add_book(book) : book_new
  end

  def fined_or_add_reader(reader)
    reader_new = @readers.find { |el| el == reader }
    reader_new.nil? ? add_reader(reader) : reader_new
  end
end
