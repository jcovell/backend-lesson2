Kernel.puts("hello world")

=begin Run $ rubocop hello.rb
•the first line tells you how many files were inspected. In this case, there's just 1 file. This should tell you that Rubocop is pretty powerful, and can inspect multiple files at once. In fact, you could use it to inspect your entire project. We'll stick to working with 1 file at a time for now.
•the C stands for Convention, which means a convention was broken. Other possible offenses are W (warning), E (error), and F (fatal error).
•the list of offenses appears next; we only have one. The first part tells you where the offense occurred: the file name, the line number, and the column number. Then C again for convention, then the offense message. After that, it even shows you actual piece of code where the offense occurred. Very nice!

You can see in this case, something is complaining about our use of double quotes. To find out which cop complained, we can do this.

$ rubocop --format offenses

$ rubocop --format offenses

1  Style/StringLiterals
--
1  Total
12345

This output shows us total offenses per cop, and the total offenses in our code. It also shows us that the StringLiterals cop in the Style department was the one who complained about our hello.rb.

Configuring Rubocop
The previous offense seems overly strict for our project. We want to not enforce that particular rule -- how do we tell Rubocop to ignore the Style/StringLiterals cop? The answer is through a configuration file.

In practice, having nested .rubocop.yml files is confusing, so best to just use one in your project's root directory. In our case, we'll just create one in the same directory as our hello.rb file.

Notice the Enabled: false -- that's the setting that will tell Rubocop to ignore the Style/StringLiterals cop.
=end

# .rubocop.yml

Style/StringLiterals:
  Enabled: false
  EnforcedStyle: single_quotes
  SupportedStyles:
  - single_quotes
  - double_quotes
  
# Note: Most suggestions by Rubocop are valid, so if you have code that contains lots of offenses, it's best to give your code a second look.

# ROBOCOP CONFIG FILE TO COPY FOR NEXT LESSON:

Style/MethodCallParentheses:
  Enabled: false
  Description: 'Do not use parentheses for method calls with no arguments.'
  StyleGuide: 'https://github.com/bbatsov/ruby-style-guide#no-args-no-parens'

Style/BracesAroundHashParameters:
  Enabled: false
  EnforcedStyle: no_braces
  SupportedStyles:
  # The `braces` style enforces braces around all method parameters that are
  # hashes.
  - braces
  # The `no_braces` style checks that the last parameter doesn't have braces
  # around it.
  - no_braces
  # The `context_dependent` style checks that the last parameter doesn't have
  # braces around it, but requires braces if the second to last parameter is
  # also a hash literal.
  - context_dependent

Style/CommentAnnotation:
  Description: >-
    Checks formatting of special comments
    (TODO, FIXME, OPTIMIZE, HACK, REVIEW).
  StyleGuide: 'https://github.com/bbatsov/ruby-style-guide#annotate-keywords'
  Enabled: false

Style/StringLiterals:
  Enabled: false
  EnforcedStyle: single_quotes
  SupportedStyles:
  - single_quotes
  - double_quotes

Metrics/LineLength:
  Enabled: false
