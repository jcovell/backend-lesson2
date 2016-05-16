# The only way to retain information is to pay with time. Debugging an issue for hours and hours will ensure that this problem gets burned into long term memory. You pay for those burns with time but they pay back with interest. If you spend 3 hours debugging, those hours are not wasted - you won't make that mistake again. We want to encourage you to think about debugging from that perspective - embrace your burns and remember their lessons.

# Naming conventions
# When naming things follow Ruby conventions.
# In Ruby, make sure to use snake_case when naming everying, except classes which are CamelCase or constants, which are all UPPERCASE.

# Using Rubocop on your code will help catch some of these issues as well.

# Mutating Constants
# Another common type of mistake is that people tend to change values of constants. For example:
# CARDS = [1, 2, 3]

# Because CARDS is a constant, do not add or remove values from this array. Though Ruby allows it, in general, constants should not be mutated at all.
# CONSTANTS should be immutable.

#Methods
#The instinct to extract code to a method is good. However, make sure that the method does one thing, and that its responsibility is very limited. This implies indirectly that your methods should be short (let's say, around 10 lines or so). If it's more than 15 lines long, it would probably be better to split it to 2 or 3 methods.

# Here are some guidelines on how to write good methods:
# It should not display something to the output as well as return a value.
# Decide whether the method should return something with no side effects or only perform side effects with no return. If you do both, it's likely that you won't remember what it does when you need to use the method. The method name should reflect whether it has side effects or not (for example, many methods in the standard Ruby library end with a ! to signify side effects).
# •In Ruby, we would not say return_total, it would be just total - returning a value is implied. Further, we would not expect a total method to have side effects or print a value out. We would expect a method called total to be defined something like this:

def total(cards) # [1, 2, 3]
end
=> Integer

# From the name total you know this method should return an integer (the value of total). If instead this method mutates cards, it then becomes confusing. You will always have to remember this!
#  If you find yourself always looking at the method implementation, it's a sign that the method is not named appropriately, or that it's doing more than one simple thing.

# Methods should be at the same level of abstraction.
# When working with a method, you should be able to mentally extract the method from the larger program, and just work with the method in isolation. You should be able to feed this method inputs, and expect it to give some outputs. When you have a method like this, you can use it without thinking about its implementation. Working this way helps compartmentalize your focus, an important skill when working on large codebases.
# Pay attention to how your methods are organized, and whether you can look at a list of methods a week later and still understand how to use them without studying their implementation.
# Method names should reflect mutation, example:

def update_total(total, cards)
end

# total is changed
#  Use naming conventions, even in your own code, to signify which types of methods mutate vs which methods return values.
# The more you have to think about the method, the harder is to use it. If it is performing a side effect and at the same time returning a value, this makes debugging and using the method very hard.
# Your goal should be to build small methods that are like LEGO blocks: they should be stand-alone pieces of functionality that you can use to piece together larger structures.
# There are some methods that are convoluted because the logic is complex. It's likely a sign that you don't quite understand the problem well enough to break it down into well-compartmentalized pieces. That's fine. But you will understand the problem better as you dig into the code more and more, and as your understanding becomes more clear, refactor your code to reflect that growing clarity.

# Displaying Output
# Sometimes, you'll have methods that only display things. For example:

def welcome
puts "welcome"
end

#This is fine, but it's not obvious whether a method called welcome returns a string, or outputs strings directly. One way to resolve this is to help yourself remember and prefix all methods that output values with something like print_, say_ or display_. This will require some discipline and it's important that you only output values in these methods. Don't mutate parameters or return values.

# Methods are like black-boxes. It takes some stuff (input) and returns some value (output) to you. They should be very contained and you should know what they do without having to look up the implementation. Coding will be much easier if you follow these general guidelines.

# Remember that code not only has to work properly, but must also be read easily — both by others as well as your future self.

# Miscellaneous Tips
# Don't prematurely exit the program. All your methods should be at the same mental scope and not just randomly exit the program. Your program should probably only have one exit point.
# Watch your indentation. 2 spaces, not tabs. This violation burns Rubyists' eyes. Verify your indentation after you pushed to Github.
# Name your methods from the perspective of using them later. That is, think about how you would like to invoke them. Think about the implementation later. For example, if you have an array of cards, and you want to write a method to find the ace, your method should be called find_ace, and you can use it like this: ace = find_ace(cards). You shouldn't name it find_ace_from_cards, because you'd be invoking it like this: find_ace_from_cards(cards). When Rubyists see a method like that, they think "what else can you find an ace from besides cards? tiles?". The easier your code is to read, the easier it is to debug and maintain.
# Know when to use a "do/while" vs a "while" loop. Here's an example:

while answer.downcase != 'n' do
  puts "Continue? (y/n)"
  answer = gets.chomp
end

# When running this, ruby will throw an exception of "undefined local variable or method 'answer'". To correct this, we have to initialize answer before the while statement, like this:

answer = ''
while answer.downcase != 'n' do
  puts "Continue? (y/n)"
  answer = gets.chomp
end

# That certainly would work, but a slightly better implementation could be to use a "do/while" loop:

loop do
  puts "Continue? (y/n)"
  answer = gets.chomp
  break if answer.downcase == 'n'
end

# Here, the entire code is contained in the loop, and it's slightly easier to reason with. You could even do without the answer variable and use the user's input (i.e. gets.chomp) in the if condition directly, but using answer is fine -- remember, clarity over terseness.

# Truthiness

# In ruby, everything is truthy except nil and false. Because of this, we don't have to compare an expression to true or false, and can rely on the expression's "truthiness" directly. Example:

if user_input == true

# could be just

if user_input

# Sometimes, you're trying to guard against nil value, and you'd write: if user_input != nil. But if your intent is to guard against nil, you can just as well do if user_input, since a nil value will evaluate to false. That is, the "truthiness" of nil is false.

# Approach to learning

# Learning to program takes some focus and attention. It takes a lot of repetition over a long period. One of the surprising aspects about learning to program is that it's not a sequential process. You can't "master Ruby", then "master Rails", then "master testing". You'll likely be revisiting old topics over and over, and, through dramatic experience, certain things will be burned into long term memory.

# The first time you are exposed to a new topic, it's going to be daunting. The second time, it's going to be easier and the third time even easier.

# The tips mentioned here may not make sense now, but that's ok. Over time, hopefully you'll see many of these topics surface again, and it'll make more sense the second time around. Don't be demoralized if you do it once and you can't remember most of it. That's normal. Keep moving forward, and don't be afraid to spend time gaining valuable experience.