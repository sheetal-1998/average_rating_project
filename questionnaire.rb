require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

# TODO: FULLY IMPLEMENT
def do_prompt
  # Ask each question and get an answer from the user's input.
  answers = []
  QUESTIONS.each_key do |question_key|
    print QUESTIONS[question_key]
    #Get the users input in case insensitive format
    ans = gets.chomp.downcase
    answers << ans
  end
  answers
end

def do_report(store)
  #count of yes answers from user and calculate the rating
  yes_count = do_prompt.count { |ans| ["yes", "y"].include? ans }

  #calculate the rating for each run based on the yes count
  rating = calculate_ratings(yes_count)

  #output the rating of each round
  puts "You scored #{rating}% for this round"

  #store the rating in the store
  persist_rating(store, rating)

  #fetch the ratings from the store and calculate the average rating
  calculate_average_rating(store)
end


def calculate_average_rating(store)
  store.transaction do
    ratings = store[:ratings]
    puts "your average rating is #{ratings.sum()/ratings.size}"
  end
end

def calculate_ratings(yes_count)
  yes_count * 100 / QUESTIONS.size
end

def persist_rating(store, rating)
  #storing the rating of each run instead of answers to calculate average rating
  store.transaction do
    store[:ratings] ||= []
    store[:ratings] << rating
  end
end

#calling the method do_report to start the questionnaire
do_report(store)

