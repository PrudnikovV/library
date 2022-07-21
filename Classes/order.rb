# frozen_string_literal: true

require_relative 'book'
require_relative 'reader'
require_relative '../Module/validation'
require 'date'

# This class for order
class Order
  include Validation

  attr_accessor :reader, :book

  def initialize(book, reader, date = Date.today)
    check_class(book, Book)
    check_class(reader, Reader)
    check_class(date, Date)
    @book = book
    @reader = reader
    @date = date
  end
end
