class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  
  def self.first_move_wins?(move1, move2)
    (move1 == move2) or 
    (move1 == 'S' and move2 == 'P') or
    (move1 == 'P' and move2 == 'R') or 
    (move1 == 'R' and move2 == 'S')
  end
  
  def self.invalid_move?(move)
  	move != 'S' and move != 'R' and move != 'P'
  end

  def self.winner(player1, player2)
  	p1Move, p2Move = player1[1], player2[1]
  	raise NoSuchStrategyError, "Strategy must be one of R,P,S" if invalid_move?(p1Move) or invalid_move?(p2Move)
    return player1 if first_move_wins?(p1Move, p2Move)
    player2
  end

  def self.player_contest?(contest)
  	contest[0][1].class == String
  end

  def self.tournament_winner(tournament)
    return winner(tournament[0], tournament[1]) if player_contest? tournament
    winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
  end

end
