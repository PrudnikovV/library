require "./Module/Validation"
Class Order
  include Validation
  def initialize(book, reader, date)
    is_a_book(book)
    is_a_reader(reader)
    is_a_date(date)
    @book = book
    @reader = reader
    @date = date
  end
end
