# Mortgage and/or Car Loan Calculator, short form.:

puts("Hello welcome to Mortgage and/or Car Loan Calculator!")

puts("What is your loan amount?")
loan = gets.chomp.to_i

puts("How many months do you want to pay it back?")
time = gets.chomp.to_i

puts("What interest rate would you like?")
rate = gets.chomp.to_f/100

i = (1+rate/12)**(12/12)-1
annuity = (1-(1/(1+i))**time)/i

payment = loan/annuity

puts "\n$%.2f per month" % [payment]
