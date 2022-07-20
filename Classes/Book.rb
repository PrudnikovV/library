class Book
  include ActiveModel::Validations
  validates :title , presence: true
  def initialize(title, author)
    @title = title
    @author = author
  end
end