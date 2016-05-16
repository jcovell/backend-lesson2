#Really like this code for the mortgage calculator and will study.

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num != 0
end

def valid_number
  loop do
    number = Kernel.gets().chomp().to_f
    return number if valid_number?(number)
    prompt("Please re-enter a valid number")
  end
end

def calculation_output(monthly_payment, monthly_int_rate, loan_duration_months)
  <<-"RESULT"
The details of your mortgage are:
     Monthly payments: $#{monthly_payment.round(2)}
     Monthly interest rate: #{monthly_int_rate.round(2)}%
     Loan duration: #{loan_duration_months} months
  RESULT
end

loop do
  prompt("Please enter the loan amount.")
  loan_amt = valid_number

  prompt("Please enter the Annual Percentage Rate (APR).")
  apr = valid_number

  prompt("Please enter the duration of the loan in years.")
  loan_duration_years = valid_number.to_i

  monthly_int_rate = apr.to_f / 12
  loan_duration_months = loan_duration_years * 12
  monthly_payment = loan_amt * (monthly_int_rate / 100 *
                    (1 + monthly_int_rate / 100)**loan_duration_months) /
                    ((1 + monthly_int_rate / 100)**loan_duration_months - 1)

  prompt(calculation_output(monthly_payment, monthly_int_rate, loan_duration_months))

  prompt("Another calculation? (y/n)")
  continue = Kernel.gets().chomp().downcase
  break unless continue == 'y'
end

Kernel.puts("Thank you for using the Mortgage Calculator.")


