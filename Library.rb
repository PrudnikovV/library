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
  def initialize
    load
    @books = []
    @readers = []
    @orders = []
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

end
