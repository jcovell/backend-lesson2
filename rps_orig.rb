# Original rock paper scissors after rubocop.

VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_screen
  system('clear') || system('cls')
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt("Computer won!")
  end
end

loop do
  user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = Kernel.gets().chomp()

    break if VALID_CHOICES.include?(user_choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{user_choice}; Computer chose: #{computer_choice}")

  display_results(user_choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
