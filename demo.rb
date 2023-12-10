require_relative 'libs'
require 'benchmark'

# Виміряємо час виконання
time_elapsed = Benchmark.realtime do
    app = Music_parser_tool::MainApplication.new()
    app.run
end

# Виводимо інформацію про час виконання
puts "Program executed successfully.\n Execution time: #{time_elapsed.round(2)} seconds."
