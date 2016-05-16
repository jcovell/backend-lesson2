require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def valid_number?(num)
  num.to_i() != 0
end

def y_or_n?(answer)
  answer.casecmp('y') == 0 || answer.casecmp('n') == 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(" ")
prompt("Welcome to Calculator! Please enter your name?")

name = ''
loop do
  name = Kernel.gets().chomp()

  break unless name.empty?()
  prompt("Make sure to use a valid name.")
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = Kernel.gets().chomp()

    break if valid_number?(number1)
    prompt("That doesn't look like a valid number.")
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = Kernel.gets().chomp()

    break if valid_number?(number2)
    prompt("That doesn't look like a valid number.")
  end

  prompt("What operation would you like to perform?")
  operator_prompt = <<-GFC
    1) add
       2) subtract
       3) multiply
       4) divide
  GFC
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operator)
    prompt("Must choose 1, 2, 3 or 4")
  end

  prompt("#{operation_to_message(operator)} the two numbers....")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i
           when '2'
             number1.to_i() - number2.to_i
           when '3'
             number1.to_i() * number2.to_i
           when '4'
             number1.to_f() / number2.to_f
           end

  prompt("The result is #{result}")

  answer = ''
  prompt("Would you like to try a different amount? (Y or N)")
  loop do
    answer = Kernel.gets.chomp()
    break if y_or_n?(answer)
    prompt("That doesn't look like a valid answer. Pleas enter Y or N.")
  end

  break unless answer.casecmp('y') == 0
end
prompt("Thanks for using Calculator! Good Bye!")
