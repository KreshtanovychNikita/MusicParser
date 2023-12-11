class InputReader
  def read(welcome_message: nil, process: nil, validator: nil, error_message: nil)
    puts welcome_message if welcome_message

    loop do
      print "Enter input: "
      input = gets.chomp

      if validator.nil? || validator.call(input)
        result = process.nil? ? input : process.call(input)
        return result
      else
        puts error_message if error_message
      end
    end
  end
end

# Example usage:
reader = InputReader.new

input = reader.read(
  welcome_message: "Welcome to the input reader!",
  validator: lambda { |input| input.to_i.to_s == input },
  error_message: "Invalid input. Please enter an integer."
)

puts "You entered: #{input}"
