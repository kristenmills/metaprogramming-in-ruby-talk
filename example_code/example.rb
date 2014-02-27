require 'quiz'
module MyQuiz
  extend Quiz

  quiz do
    question 'What is the runtime of the world?' do
      wrong 'java'
      right 'John Renner'
      right 'Javascript'
      wrong 'ruby'
	  right 'objective-c'
    end

    question "What is Derek's middle name?" do
      right 'Wolfgang'
      right 'William'
      right 'Wimbly'
      wrong 'Walter'
    end

    question 'What is FANTA' do
      wrong 'Orange Drank'
      right 'Females are now technologically advanced'
      wrong 'Fun activites, no turning around'
      wrong 'Follow all new tribes always'
    end
  end
end

MyQuiz.start
