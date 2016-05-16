=begin
Rubocop is a static code analyzer. This means that it analyzes your code and offers advice regarding its style format as well as possible logical errors.  In Rubocop parlance, these rules are called cops. Cops are further grouped into departments.

The first department we care about is centered around enforcing good coding style.  In general, Rubyists have standardized on a set of conventions. These conventions are captured into a document called the Ruby Style Guide. The style cops in Rubocop enforce the styles documented in that guide. For example, if your code isn't indented with 2 spaces, the IndentationWidth cop will complain.

Code Linting
The other department we're interested in is around code linting. A code linter is a program that inspects your code for possible logical errors or code smells. This isn't foolproof, but can serve as a first level of defense against obvious problems. Rubocop has some basic code linting functionality built-in. For example, if your code instantiates an unused local variable, the UselessAssignment cop will complain.

Installation and Usage

Rubocop is a gem, so you install it like any other gem.

$ gem install rubocop


Once the gem is installed, you'll have a rubocop command available from the command line. This command takes a Ruby file as an argument. For example, if you have a Ruby file called test.rb, you can run Rubocop on this file by:

$ rubocop test.rb

=end

