def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def float?(string)
  Float(string)
rescue ArgumentError
  nil
end

def y_or_n?(answer)
  %w(y n).include?(answer)
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
    if float?(loan_amount) && loan_amount.to_f > 0
      loan_amount = loan_amount.to_f
      break
    else
      puts "Please enter a positive amount, with no $ or commas."
    end
  end

  prompt("What interest rate do you want?")
  prompt(" ")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
  prompt(" ")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()
    if float?(interest_rate) && interest_rate.to_f >= 0
      interest_rate = interest_rate.to_f
      break
    else
      puts "Please enter a percentage rate. (Ex: For 4% enter 4.0  For 3.5% enter 3.5)"
    end
  end

  prompt("What is the duration of the loan in years?")
  prompt(" ")

  years = ''
  loop do
    years = Kernel.gets().chomp()
    if integer?(years)
      years = years.to_i()
      break
    else
      puts "That is not a valid loan duration. Please enter the number of years:"
    end
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
