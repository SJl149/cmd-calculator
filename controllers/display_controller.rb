require_relative "../models/calculation"

class DisplayController
  attr_reader :calculation

  def initialize
    @calculation = Calculation.new
  end

  def get_input
    puts "Ready to calculate: "
    gets.chomp
  end

  def produce_output(expression)
    expression = calculation.format(expression)
    if expression.nil?
      puts red("Invalid expression. Remember to use spaces between numbers and operands.")
    else
      puts blue(calculation.calculate(expression).to_s)
    end
  end

  def calculator
    input = get_input
    if input == "exit"
      puts " "
      puts blue('Thanks for using ') + green('< ') + blue('CmdCalculator') + green(' >')
    else
      if input == "clear"
        system "clear"
      else
        produce_output(input)
      end
      puts " "
      calculator
    end
  end

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

end
