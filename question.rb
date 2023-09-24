class Question
  attr_accessor :turn

  def initialize(turn)
    @turn = turn
    @startGame = true
  end

  def start
    first = rand(1..20)
    second = rand(1..20)

    puts "--- NEW TURN ---".invert
    puts "Player #{turn}: What is #{first} + #{second}?"
    print "> "

    answer = $stdin.gets.chomp.to_i

    if answer == first + second
      puts "Correct! Nice job!".green
      sleep(1)
      return true
    else 
      puts "Incorrect! Try harder next time :(".red
      sleep(1)
      return false
    end

    startGame = false 
  end

end