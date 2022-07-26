# frozen_string_literal: true

# This is the module for validation
module Validation
  def presence(*param)
    param.each { |el| raise LibraryError, 'All fields must be presence' unless el.is_a?(String) && !el.empty? }
  end

  def check_class(obj, need_class)
    raise LibraryError, "Argument #{obj} not a #{need_class.name}" unless obj.is_a? need_class
  end
end
