# Tendable Coding Assessment

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Requirements

Possible question answers are: "Yes", "No", "Y", or "N" case insensitively to answer each question prompt.

The answers will need to be **persisted** so they can be used in calculations for subsequent runs >> it is proposed you use the pstore for this, already included in the Gemfile

After _each_ run the program should calculate and print a rating. The calculation for the rating is: `100 * number of yes answers / number of questions`.

The program should also print an average rating for all runs.

The questions can be found in questionnaire.rb

Ensure we can run your exercise

## Bonus Points

Updated readme with an explanation of your approach

Unit Tests

Code Comments

Dockerfile / Bash script if needed for us to run the exercise

## Submission

**Approach followed**: 
- I have created a class `Questionnaire` which has the following methods:
  - `do_prompt`: It prompts the user with the questions and takes the answers in lowercase.
  - `do_report`: It calculates the rating for each run and the average rating for all runs.
  - `calculate_rating`: It calculates the rating for each run.
  - `calculate_average_rating`: It calculates the average rating for all runs.
  - `persist_ratings`: It persists the ratings in a file `ratings.pstore` using the `PStore` class.
