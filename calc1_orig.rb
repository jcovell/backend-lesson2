# Calculator
=begin 
1. greeting
2. ask for two numbers
3. ask for type of operation to perform
4. perform the operation on the two numbers
5. display result

When we invoke a method in Ruby, visually it doesn't look any different than a variable. This is because in Ruby "()" are optional when invoking a method call. Also: The method like gets or puts are actually  in a "module" called Kernel.  Example:

answer = Kernel.gets() - Kernel.puts(answer) - is the same as: answer = gets - puts answer
=end

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What is the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What is the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation do you want to perform? 1) add 2) subtract 3) mulitply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i
elsif operator == '2'
  result = number1.to_i() - number2.to_i
elsif operator == '3'
  result = number1.to_i() * number2.to_i
else
  result = number1.to_f() / number2.to_f
end

Kernel.puts("The result is #{result}")
  