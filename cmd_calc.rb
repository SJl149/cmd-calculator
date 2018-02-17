require_relative 'controllers/display_controller'

display = DisplayController.new

system "clear"
puts display.green('< ') + display.blue('CmdCalculator') + display.green(' >')
puts " "
puts display.green('Operations: ') + display.red('+, -, *, /, %')
puts display.green('Type: ') + display.blue('clear ') + display.green('to clear the screen')
puts display.green('Type: ') + display.blue('exit ') + display.green('when finished')
puts " "

display.calculator
