Module Validation
  def presence?(*param)
    param.each{ |el| raise Exeptinon.new("All fields must be presence") unless el.is_a? String && !String.empty?}
  end

  def is_a_book?(obj)
    raise Exception.new("Argument " + obj + " not a Book") unless obj.is_a? Book
  end

  def is_a_reader?(obj)
   raise Exception.new("Argument " + obj + " not a Reader") unless obj.is_a? Reader
  end

  def is_a_Author?(obj)
   raise Exception.new("Argument " + obj + " not a Author") unless obj.is_a? Author
  end

end
