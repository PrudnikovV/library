module Validation
  def presence(*param)
    param.each{ |el| raise Exception.new("All fields must be presence") unless el.is_a?(String) && !el.empty?}
  end

  def is_a_class(obj, need_class)
    raise Exception.new("Argument " + obj + " not a " + need_class.name) unless obj.is_a? need_class
  end
end
