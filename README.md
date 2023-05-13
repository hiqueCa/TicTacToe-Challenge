# :diamonds: Classic Ruby Tic-Tac-Toe :hash:

## Motivation :bulb:

This project was born as a main refactor over a rawly implemented tic-tac-toe game. The idea here was to explicitly test and explore over my Ruby programming and general development habilities.

## Achieved Goals :heavy_check_mark:

During the work proccess to refactor the code, my main goals were the following, always remembering to keep the already existent features functional while expanding on the possiblites of the game:

- **Implemented MVPs:**
  - [x] Refactoring of the main code as to make it more extensible, reusable, readable and mantainable;
  - [x] Test coverage of already existent and new functionalities of over 80% (~83%);
  - [x] Implementation of a data and input validation layer as to guarantee proper game experience flow with no unexpected crashes or side-effects;
  - [x] Proper entities separations between classes and modules;
  - [x] Proper usage of the Ruby main API along with some of its gems;
- **Implemented extras**:
  - [x] Implementation of 3 types of games for the user to choose from (Human vs Human, Human vs Computer, Computer vs Computer) based on the user's desired input;
  - [x] Allowing the user to choose whether or not to play again based on desired input, removing the need to go through the boring step of running some verbose code on the terminal;
  - [x] Making it possible for the game to differ between ties and victories when dealing with end-games;
  - [x] Identification and proper output of the game winner if the game ends because of a victory;
  - [x] Allowing the game to be run inside a Docker Container to standardize, centralize and ease the process of running the game without worrying about local incompatibilities;
  - [x] Addition of a Github Action to run the tests switch on every main branch update detected, either by pull requests or by straight pushes;

## Refactoring thought process :brain:

To achieve the desired refactor result, my main thought process was to divide the abstract scope of a Tic Tac Toe game into several main entities: the `Game`, the `Board`, the `Player`(s), the `Move`(s) of each player and, finally, the user interacting interface of a `GameRunner`. Two things that helped a lot on defining the right entities to build were thinking about this game in a relational database kind of way along with some pinches of the [React thinking way](https://react.dev/learn/thinking-in-react) regardimg facing each new entity as a imaginary component with its own individual behaviours:

- The user interacts initially with the `GameRunner`, as if the `GameRunner` was our user interface;
- The `GameRunner` has one `Game` in a 1-1 relationship;
- The `Game` has one `Board` in a 1-1 relationship;
- The `Board` has many `Player`(s) in a 1-* relationship;
- A `Player` can have many moves associated to it in a 1-* relationship;

The idea behind this whole process was to take advantage of the main OOP paradigm strategies and code patterns to extract responsibilities for each of the classes in order to reduce complexity from the initial single `tictactoe.rb` file.

After this initial separation process was done with, I could go forward with further developin the games functionalities with reduced worries over side-effects of code modifications an so on.

## Test coverage :test_tube:

In addition, I paid close attention to the test coverage given to the game's features. To do this, I used the rspec gem to implement the tests following the principles of TDD, and also used the simplecov gem, which provides a detailed report of the overall percentage coverage and each class in terms of tests. Overall, my code achieved a test coverage percentage of 84%.
Technologies used

    Ruby
    RSpec
    Simplecov

Refactoring Thought Process

I started the refactoring process by analyzing the original code and identifying areas that needed improvement. I then divided the game into separate entities, each with its own responsibility, and created classes for each entity. This approach helped to simplify the code and make it more maintainable.

I also implemented a system for validating user inputs using a Validator class that uses Ruby metaprogramming to abstract the validations present in the game.
Extra features

In addition to refactoring the original game, I added several extra features:

    Implementation of 3 types of games for the user to choose from (Human vs Human, Human vs Computer, Computer vs Computer)
    Allow the user to play again at the end of the game without having to rerun the initialization commands in the terminal
    Distinguish between when a game ends in a tie or in a victory
    Identify which player was the victorious one at the end of the game
    Allow the game to be run inside a Docker container to make the project portable and centralized
    Addition of a CI flow with the use of GitHub Actions so that the set of tests is run every time a change is detected in the main branch.

Conclusion

This project allowed me to improve my skills in refactoring, testing, and using design patterns to make code more maintainable and understandable. I hope this project serves as an example of how these practices can be used to improve existing codebases.