VALID_CHOICES = { rock: "r",
                  paper: "p",
                  scissors: "s",
                  lizard: "l",
                  spock: "sp" }.freeze

WINNING_RULES = { scissors: [:paper, :lizard],
                  paper: [:rock, :spock],
                  rock: [:lizard, :scissors],
                  lizard: [:spock, :paper],
                  spock: [:scissors, :rock] }.freeze

FINAL_SCORE = 5

def win?(first, second)
  WINNING_RULES[first].include?(second)
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("Your point!")
  elsif win?(computer, player)
    prompt("Computers point!")
  else
    prompt("It's a tie!")
  end
end

def clear_screen
  system('clear') || system('cls')
end
prompt(" ")
prompt("Welome to Rock, Paper, Scissors, Lizard, Spock.")
prompt(" ")
prompt("The winner of each round gets a point and the first one to reach #{FINAL_SCORE} points, wins the game!")
prompt(" ")

loop do
  player_score = 0
  computer_score = 0
  loop do
    user_choice = ''
    loop do
      prompt("Current Score: Player: #{player_score}  Computer: #{computer_score}")
      prompt("Choose One: R => Rock, P => Paper, S => Scissors, L => Lizard, Sp => Spock")
      user_choice = gets.chomp.downcase

      if VALID_CHOICES.value?(user_choice)
        user_choice = VALID_CHOICES.key(user_choice)
        break
      else
        prompt("Huh....., that's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.keys.sample
    prompt("You chose: #{user_choice}; Computer chose: #{computer_choice}")
    display_results(user_choice, computer_choice)

    if win?(user_choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, user_choice)
      computer_score += 1
    end

    break if player_score >= FINAL_SCORE || computer_score >= FINAL_SCORE
    prompt("--------------------------------------------------------------")
    prompt("Hit enter for another round.")
    gets
    clear_screen
  end

  if player_score >= FINAL_SCORE
    prompt(" ")
    prompt("**********___________************")
    prompt("YOU WIN THE GAME!")
    prompt(" ")
  elsif computer_score >= FINAL_SCORE
    prompt(" ")
    prompt("**********___________************")
    prompt("COMPUTER WINS THE GAME!.")
    prompt(" ")
  end

  answer = ""
  prompt("Do you want to play again? Please enter (y/n)")
  loop do
    answer = gets.chomp.downcase
    break if answer == "y" || answer == "n"
    prompt("Please enter 'y' to play again or 'n' to quit, thank you.")
  end
  break unless answer == "y"
  clear_screen
end

prompt("Thank you for playing. Good bye!")
