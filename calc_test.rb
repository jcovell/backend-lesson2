require 'yaml'

MESSAGES = YAML.load_file("calculator_messages.yml")

number1 ||= 0
number2 ||= 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_f.to_s == number || number.to_i.to_s == number
end

def operation_to_msg(operator)
  case operator
  when 1
    'an addition'
  when 2
    'a substraction'
  when 3
    'a multiplication'
  when 4
    'a division'
  end
end

lang_list = <<-LIST
'EN'  = english
'ES'  = spanish
'DE'  = german
'IT'  = italian
'FR'  = french
'CAT' = catalan
you can choose via the upcase letters, example: 'en' or 'EN' for english
LIST

lang = ''

loop do
  prompt("This is the Calculator scrpit! choose a language:")
  puts lang_list
  lang = Kernel.gets().chomp().downcase
  if %w(en es de it fr cat).include?(lang)
    prompt(MESSAGES[lang]['welcome'])
    break
  else
    prompt("please try again")
  end
end

name = Kernel.gets().chomp()
prompt("#{name}, #{MESSAGES[lang]['say_hi']}")

loop do
  number1 = nil
  loop do
    prompt(MESSAGES[lang]['first_num'])
    check_num = Kernel.gets().chomp()
    number1 = check_num.to_f
    valid_number?(check_num) ? break : prompt(MESSAGES[lang]['validate'])
  end

  prompt(" #{number1} <<")

  loop do
    number2 = nil
    prompt(MESSAGES[lang]['second_num'])
    check_num = Kernel.gets().chomp()
    number2 = check_num.to_f
    valid_number?(check_num) ? break : prompt(MESSAGES[lang]['validate'])
  end

  prompt(" #{number2} <<")

  operations = <<-PARAGRAPH
  #{prompt(MESSAGES[lang]['choose_op'])}
  1) #{number1} + #{number2}
  2) #{number1} - #{number2}
  3) #{number1} * #{number2}
  4) #{number1} / #{number2}
  PARAGRAPH

  prompt(operations)

  operator = ''

  loop do
    operator = Kernel.gets().chomp().to_i
    %w(1 2 3 4).include?(operator.to_s) ? break : prompt(MESSAGES[lang]['validate_op'])
  end

  case operator
  when 1
    result = number1 + number2
  when 2
    result = number1 - number2
  when 3
    result = number1 * number2
  when 4
    result = number1 / number2
  end

  prompt("doing #{operation_to_msg(operator)}...")

  puts("#{MESSAGES[lang]['result']} #{result}")
  puts "-----"

  next_or_break = ''

  loop do
    prompt(MESSAGES[lang]['continue_y_n'])
    next_or_break = gets.chomp.downcase
    break if next_or_break == 'y' || next_or_break == 'n'
    prompt(MESSAGES[lang]['continue_fail'])
  end

  unless next_or_break == 'y'
    prompt(MESSAGES[lang]['bye'])
    break
  end
end
