# :diamonds: Classic Ruby Tic-Tac-Toe :hash:

## Motivation :bulb:

This project was born as a main refactor over a rawly implemented tic-tac-toe game. The idea here was to explicitly test and explore over my Ruby programming and general development habilities.

## Main used technologies and ruby gems:technologist:

- Ruby
- [RSpec](https://rspec.info/)
- [Simplecov](https://github.com/simplecov-ruby/simplecov)
- [require_all](https://github.com/jarmo/require_all)
- [Docker](https://www.docker.com/)
- [GitHub Actions](https://github.com/features/actions)

## Achieved Goals :heavy_check_mark:

During the work proccess to refactor the code, my main goals were the following, always remembering to keep the already existent features functional while expanding on the possiblites of the game:

- **Implemented MVPs:**
  - [x] Refactoring of the main code as to make it more extensible, reusable, readable and mantainable;
  - [x] Test coverage of already existent and new functionalities of over 80% (~83%);
  - [x] Implementation of a data and input validation layer as to guarantee proper game experience flow with no unexpected crashes or side-effects (`Validator`);
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

Mainly based on the usage the principles of TDD and BDD, the tests were implemented with RSpec, a largely known and trusted Ruby gem used for test development.

To deliver the best test coverage for the project while being able to properly measure the test coverage, I also used the simplecov gem, which provides a detailed report of the overall percentage coverage of the general code and of each entity (class or module).

Overall, my code achieved a test coverage percentage of 85.71%:

![image](https://github.com/hiqueCa/TicTacToe-Challenge/assets/59069972/00461b38-07da-40bb-9063-faf4c8ef70df)

## How-tos :question:

### Locally with Ruby

To locally run the project using ruby, follow these steps:

- Make sure you have [Ruby installed](https://www.ruby-lang.org/en/downloads/) on your machine;
- Clone this repo to your local machine;
- At the root of your newly created project folder, run `bundle install` to make sure you have all dependencies correctly installed;
- Also at the root of your newly created project folder, run `ruby main.rb` to play the game;
- To execute the specs and get a hold of the coverage report, run `rspec spec`;
- After executing the specs, the test coverage report gets available at the `/coverage/index.html` folder inside the project's root.
  - Open this `index.html` file with your favorite web browser and check on the coverage results.

### Virtually with a Docker machine container

To run the project using a Docker container, follow these steps:

- Make sure you have [Docker engine installed](https://docs.docker.com/engine/install/) on your machine;
- Clone this repo to your local machine;
- At the root of your newly created project folder, run `docker build -t <your-prefered-name-for-the-new-docker-image> .` to build the proper docker image defined by this repo's `Dockerfile`;
- After the image build is completed, run `docker run -it <your-prefered-name-for-the-new-docker-image> ruby main.rb` to run the game;
- To execute the specs, run `docker run -it <your-prefered-name-for-the-new-docker-image> rspec spec`;
- Unfortunately, the test coverage report is not being generated while running the tests suite inside the container. Nevertheless, tests work and the report can still be fetched by following the local run steps above;
- If you want to kill the built docker container and image:
  - Run `docker ps -a` and get the container id of the previously built containers;
  - Run `docker rm <container-id>` using the container-id found in the previous step;
  - Run `docker images` and find the image-id for the docker image previously built;
  - Run `docker rmi <image-id>` to destroy the previously built image;

Conclusion

This project allowed me to improve my skills in refactoring, testing, and using design patterns to make code more maintainable and understandable.
Also, it allowed me to flex my development habilities while studying and discovering new themes and topics!
