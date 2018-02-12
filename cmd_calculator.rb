# Colorize the output
def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text)
  colorize(text, 31)
end

def green(text)
  colorize(text, 32)
end

def blue(text)
  colorize(text, 34)
end

def output(expression)
  expression = format(expression)
  if expression.nil?
    puts red("Invalid expression. Remember to use spaces between numbers and operands.")
  else
    puts blue(calculate(expression).to_s)
  end
end

def calculate(expression)
  [:/,:*,:+,:-].each do |operand|
    while expression.length > 1 && expression.include?(operand)
      index = expression.find_index(operand)
      num = expression[index - 1].public_send(expression[index], expression[index + 1])
      expression[index - 1] = num
      expression.slice!(index..index + 1)
    end
  end
  expression.first
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

def valid(expression)
  if expression && expression.chars.all? { |element| element =~ /(\d|[+-\/]|[*])|\s/ }
    true
  else
    false
  end
end


system "clear"
puts green('< ') + blue('CmdCalculator') + green(' >')
puts "Ready to calculate: "
expression = gets.chomp
output(expression)
