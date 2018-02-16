class Calculation
  attr_accessor :result

  def initialize
    @result = 0
  end

  def valid(expression)
    if expression && expression.chars.all? { |element| element =~ /(\d|[%+-\/]|[*])|\s/ }
      true
    else
      false
    end
  end

  def format(expression)
    error = false
    if valid(expression)
      expression = expression.split(" ")
      expression.map!.with_index do |element, i|
        if i.even?
          error = true unless element.to_i.to_s == element
          element.to_i
        elsif element =~ /\D/
          element.to_sym
        else
          error = true
        end
      end
    else
      error = true
    end
    if error == true
      nil
    else
      expression
    end
  end

  def calculate(expression)
    [:/, :*, :%, :+, :-].each do |operand|
      while expression.length > 1 && expression.include?(operand)
        index = expression.find_index(operand)
        num = expression[index - 1].public_send(expression[index], expression[index + 1])
        expression[index - 1] = num
        expression.slice!(index..index + 1)
      end
    end
    result = expression.first
    result
  end

end
