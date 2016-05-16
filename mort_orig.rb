def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Welcome to Mortgage or Car Caculator!")

  prompt("What is you loan amount?")

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()

    if loan_amount.empty?() || loan_amount.to_f() < 0  
      prompt("You must enter a positive number.")
    else
      break
    end
  end

  prompt("What interest rate do you want?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f() < 0  # Need a guard clause here.
      prompt("You must inter a positive number.")
    else
      break
    end
  end

  prompt("What is the duration of the loan in years?")

  years = ''
  loop do
    years = Kernel.gets().chomp()

    if years.empty?() || years.to_i() < 0  # Need a guard clause here.
      prompt("Please enter a valid number.")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt("Do you want to do another calculation?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Mortgage Calculator!")
