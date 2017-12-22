require_relative 'player'

class Game

  def self.create_new_game(name_1, name_2)
    @game = Game.new({name_1: name_1, name_2: name_2})
  end

  def self.instance
    @game
  end

  attr_reader :player_1, :player_2, :current_turn
  def initialize(args)
    @player_1 = Player.new(args[:name_1])
    @player_2 = Player.new(args[:name_2])
    @current_turn = @player_1
  end

  def attack(player)
    player.reduce_hp(Player::DEFAULT_DAMAGE)
    switch_turns
  end

  def switch_turns
    @current_turn = (current_turn == player_1 ? player_2 : player_1)
  end 

end
