# frozen_string_literal: true

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

  def add(new_obj)
    case new_obj
    when Order then @orders << new_obj
    when Book then @books << new_obj
    when Reader then @readers << new_obj
    when Author then @authors << new_obj
    end
  end
end
