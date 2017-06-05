class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    add_random_color
    while game_over == false
      take_turn
    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
    add_random_color


  end

  def show_sequence
    puts "#{seq}"
    sleep(3)
    system "clear"

  end

  def require_sequence
    i = 0
    until i == @sequence_length || @game_over == true
      puts "what is the #{i+1} number is the sequence?"
      answer = gets.chomp
      @game_over = true if answer != @seq[i]
      i += 1
    end


  end

  def add_random_color
    @seq << COLORS.shuffle[0]

  end

  def round_success_message
    "you win the round"

  end

  def game_over_message
    puts "you lose good day sir"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
