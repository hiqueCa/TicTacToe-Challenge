# :diamonds: Classic Ruby Tic-Tac-Toe :hash:

## Motivation :bulb:

This project was born as a main refactor over a rawly implemented tic-tac-toe game. The idea here was to explicitly test and prove my Ruby programming and development habilities.

## Defined Responsabilities (basic and extras):

During the work proccess to refactor the code, my main responsibilities were the following, always remembering to keep the already existent features functional while expanding on the possiblites of the game:

- asdf

To achieve this, I divided the scope of a Tic Tac Toe game into several main entities: the game, the board, the players, and the moves of each player. The idea behind my refactoring was to extract responsibilities for each of the classes, in order to remove complexity from the single file that was provided by the challenge.

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