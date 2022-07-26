# frozen_string_literal: true

# This is the module for statistic
module Statistic
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
end
