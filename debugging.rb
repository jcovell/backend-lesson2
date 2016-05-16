=begin

TEMPERMENT:.................................................
When thinking about what attributes make a good programmer, one thing comes to mind: temperament. If the key to programming is debugging, then the key to debugging is having a patient and logical temperament. Remember to keep even keeled and be systematic.  
Dealing with feelings of frustration is the first critical aspect of learning to program.
When you run into an error, you'll likely be hit with a wall of text that looks like gibberish. This wall of gibberish is called the stack trace and is critical in helping you figure out where to start your debugging. 
The trick is to train your eye to look for the relevant parts of the stack trace, and over time, you'll be able to spot the error faster and faster. Every language and library has a certain pattern to their stack trace, so the longer you work with a language or library, the easier it will become. When you see a large stack trace for the first time, don't despair. Study it carefully, and try to extract the meaningful bits.

ONLINE RESOURCES:.........................................
1. SEARCH ENGINES:
Search results will likely pick up generic search terms, so make sure you don't simply copy and paste the entire stack trace. If you see a lot of results in a different programming language, you may want to preface "Ruby" in front of the search phrase. 
2. STACK OVERFLOW:
Stack Overflow is a rich treasure trove of answers for common problems. Many of their answers rank highly in search engines, but sometimes it's worth searching on SO directly.
3. DOCUMENTATION:
Finally, don't hesitate to consult the official Ruby documentation site: Ruby Docs. Make sure you're looking at documentation for pure Ruby, and not a library or framework specific documentation. That's very important, as some frameworks (i.e., Rails) add a lot of functionality to core classes that's not available in pure Ruby.

STEPS TO DEBUGGING:.......................................
1. REPRODUCE THE ERROR:
The first step in debugging any problem is usually reproducing the problem. Programmers need a deterministic way to consistently reproduce the problem, and only then can we start to isolate the root cause.
This will become more important as you build more sophisticated applications with various external dependencies and moving parts. Reproducing the exact error will often end up being more than half the battle in many tricky situations.
2. DETERMINE THE BOUNDRIES OF THE ERROR:
Once you can consistently reproduce the problem, it's time to tweak the data that caused the error.  How does modifying the data affect the program behavior? Do we get expected errors, or does a new error occur that sheds light on the underlying problem?

What we're trying to do is modify the data or code to get an idea of the scope of the error and determine the boundaries of the problem. This will lead to a deeper understanding of the problem, and allow us to implement a better solution. Most problems can be solved in many ways, and the deeper you understand the problem, the more holistic solution you can come up with.

3. TRACE THE CODE:
Once you understand the boundaries of the problem, it's time to trace the code. Trace the code backwords to expose the problem. This is called trapping the error.

4. UNDERSTAND THE PROBLEMS WELL:
Working carefully line by line, and inspecting the variable values each step of the way, you may notice for example, that the initial setting of the values doesn't seem to take hold.

5. IMPLEMENT A FIX:
There are often multiple ways and multiple layers in which you can make the fix. Sometimes, you're using a library or code that you can't modify. In those situations, you have no choice but to deal with edge cases in your own code.
One very important note is to fix one problem at a time. It's common to notice additional edge cases or problems as you're implementing a fix. Resist the urge to fix multiple problems at once.

6. TEST THE FIX:
Finally, after implementing a fix, make sure to verify that the code fixed the problem by using a similar set of tests from step #2. After you learn about automated testing, you'll want to add an additional automated test to prevent regression. For now, you can test manually.

TECHNIQUES FOR DEBUGGING:.....................................

1. LINE BY LINE:
Your best debugging tool is your patience, which is why we mentioned temperament first in this article. Most bugs in your code will be from overlooking a detail, rather than a complete misunderstanding of a concept. Being careful, patient and developing a habit of reading code line-by-line, word-by-word, character-by-character is your most powerful ability as a programmer. If you are naturally impatient, or like to gloss over details, you must train yourself to behave differently when programming. All other debugging tips and tools won't matter if you aren't detail oriented.

2. RUBBER DUCK:
Rubber Duck Debugging sounds crazy, but its effectiveness is so well known that it has its own Wikipedia page. The process centers around using some object, like a rubber duck, as a sounding board when faced with a hard problem. The idea is that when you are forced to explain the problem to a rubber duck, you are actually forcing yourself to articulate the problem, detail by detail. This often leads to discovering the root of the problem. Of course, the object doesn't have to be a rubber duck -- it can be anything, including another human being. The point is to focus your mind on walking through the code, line by line, and in that process, noticing a small detail that may reveal a deeper problem. If you've never experienced this phenomenon, we encourage you to try this out yourself next time you're stuck on a bug.

3. WALKING AWAY:
Another interesting debugging technique is to go for a walk. Some have claimed a swim, jog or even a shower helps too. Some claim this technique works because it activates a different part of your brain, and even when you walk away from the computer, your brain is still working on the problem in the background. Note that this is only effective if you first spend time loading the problem in your brain. You cannot just walk away when you first encounter a problem and expect this technique to work. Once you've loaded the problem in your brain, your brain may work on the problem even while you're sleeping! Also, our brains get tired too, so it's ok to step away and come back to it with fresh eyes and a refreshed brain.

4. USING pry:
Pry is a powerful Ruby REPL that can replace IRB. We don't recommend that you do that just yet, and just use pry for simple debugging. To use it, first install it like any other gem.

$ gem install pry

 In order to use pry, we have to require it first. Once we've required pry, we can then insert a binding.pry anywhere in our code, and when Ruby gets to that line, execution will stop and we'll be able to inspect the state of our program at that point.

Example:
require 'pry'       # <= add this to use pry

class Car
  attr_accessor :brand, :model

  def initialize(new_car)
    brand = new_car.split(' ').first
    model = new_car.split(' ').last
    binding.pry     # <= execution will stop here
  end

end

betty = Car.new('Ford Mustang')
betty.model.start_with?('M')

Suppose the above code is saved into a file called "car.rb", then we should see the below.

    $ ruby car.rb
    From: /Users/temp/car.rb @ line 9 Car#initialize:

     6: def initialize(new_car)
     7:   brand = new_car.split(' ').first
     8:   model = new_car.split(' ').last
 =>  9:   binding.pry
    10: end

    [1] pry(#<Car>)> self.brand
    => nil
    [2] pry(#<Car>)> brand
    => "Ford"
    [3] pry(#<Car>)>

Pry stops execution at the line where binding.pry is declared and gives us a prompt to allow us to see what brand or self.brand is. We could also change variable values if we wanted to. This is an incredibly helpful way to systematically debug our program, without spraying our entire program full of "puts". To continue execution of the program, type Ctrl+D.

5. USING A DEBUGGER:
Pry can also be used as a real debugger, which gives us the mechanism to step into functions and more systematically walk over code. We won't be covering that yet, so for now we just want to introduce the concept of a debugger program. It's a little more advanced, so we encourage you to just use pry in the manner we showed above.

SUMMARY:
In summary, debugging is arguably the most important skill you need to learn as a programmer. Focus on developing a patient, systematic temperament; carefully read error messages; use all the wonderful resources at your disposal; approach debugging in sequential steps; and use the techniques we covered above -- especially pry. If you haven't yet, go install pry now and play around with it a little bit.
=end