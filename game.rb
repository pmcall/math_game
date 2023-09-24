class Game
  attr_accessor :turn, :p1livesleft, :p2livesleft

  def initialize
    @turn = 1
    @p1livesleft = 3
    @p2livesleft = 3
  end 


  def start
    puts "Player 1: #{@p1livesleft}/3 lives.".magenta
    puts "Player 2: #{@p2livesleft}/3 lives.".blue

    question = Question.new(turn)
    if !question.start
      update_lives(turn)
    end

    update_turn(turn)
  end

  def game_over
    if p1livesleft > p2livesleft
      puts "Player 1, you have #{@p1livesleft}/3 lives remaining. You are the winner!".blink
      puts "Player 2, you are out of lives. Better luck next time!"
      puts "--- GAME OVER ---".invert
      puts "Goodbye!"
      exit(0)
    end

      if p1livesleft < p2livesleft
        puts "Player 1, you are out of lives. Better luck next time!"
        puts "Player 2, you have #{@p2livesleft}/3 lives remaining.You are the winner!".blink
        puts "--- GAME OVER ---".invert
        puts "Goodbye!"
        exit(0)
      end
  end

  def update_lives(turn)
    if turn == 1
      @p1livesleft -= 1
    else 
      @p2livesleft -= 1
    end

    if @p1livesleft == 0 || @p2livesleft == 0
      game_over
    end
  end

  def update_turn(turn)
    if turn == 1
      @turn = 2
    else
      @turn = 1
    end

    start
  end

  
end