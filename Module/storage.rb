# frozen_string_literal: true

# This is the module for load save data
module Storage
  def load
    file = File.open('Data/data.yml', 'r')
    data = YAML.load(file, aliases: true, permitted_classes: [Library, Book, Reader, Order, Author, Date])
    self.books = data.books
    self.readers = data.readers
    self.orders = data.orders
    file.close
  end

  def save
    file = File.open('Data/data.yml', 'w')
    YAML.dump(self, file)
    file.close
  end
end
