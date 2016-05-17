require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

def float?(input)
  input.to_f.to_s == input
end

def integer?(input)
  input.to_i.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def y_or_n?(answer)
  %w(y n).include?(answer)
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

prompt(" ")
prompt("Welcome to Calculator! Please enter your name?")

name = ''
loop do
  name = gets.chomp

  break unless name.empty?
  prompt("Make sure to use a valid name.")
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = gets.chomp

    break if number?(number1)
    prompt("That doesn't look like a valid number.")
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = gets.chomp

    break if number?(number2)
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
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt("Must choose 1, 2, 3 or 4")
  end

  prompt("#{operation_to_message(operator)} the two numbers....")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")

  answer = ''
  prompt("Would you like to try a different amount? (Y or N)")
  loop do
    answer = gets.chomp
    break if y_or_n?(answer)
    prompt("That doesn't look like a valid answer. Pleas enter Y or N.")
  end

  break unless answer.casecmp('y') == 0
end
prompt("Thanks for using Calculator! Good Bye!")
