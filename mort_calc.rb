def prompt(message)
  Kernel.puts("=> #{message}")
end

def float_check(number)
  until number.to_i > 0
    prompt('Please enter a positive number.')
    number = Kernel.gets().chomp().to_f
  end
  number
end

def y_or_n?(answer)
  answer.casecmp('y') == 0 || answer.casecmp('n') == 0
end

def clear_screen
  system('clear') || system('cls')
end

loop do
  prompt("Welcome to Mortgage or Car Loan Caculator!")
  prompt(" ")
  prompt("What is you loan amount? Please numbers only, no commas or decimal points.")
  prompt(" ")

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    loan_amount = float_check(loan_amount)
    break unless loan_amount.empty?() || loan_amount.to_f() < 0
  end

  prompt("What interest rate do you want?")
  prompt(" ")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
  prompt(" ")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()
    interest_rate = float_check(interest_rate)
    break unless interest_rate.empty?() || interest_rate.to_f() < 0
  end

  prompt("What is the duration of the loan in years?")
  prompt(" ")
  years = ''
  loop do
    years = Kernel.gets().chomp()
    years = float_check(years)
    break unless years.empty?() || years.to_i() < 0
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  answer = ''
  prompt("Would you like to do another calculation? (Y or N)")
  loop do
    answer = Kernel.gets.chomp()
    break if y_or_n?(answer)
    prompt("That doesn't look like a valid answer. Pleas enter Y or N.")
  end

  break unless answer.casecmp('y') == 0
end

prompt("Thank you for using Mortgage Calculator!")
