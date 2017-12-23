require 'game'

describe Game do
  subject(:game) { described_class.new({name_1: "Tom", name_2: "David"}) }
  it "should let players receive an attack" do
    expect(subject.player_1).to receive(:reduce_hp).with Player::DEFAULT_DAMAGE
    subject.attack(subject.player_1)
  end

  it 'should switch turns' do
    subject.switch_turns
    expect(subject.current_turn).to eq(subject.player_2)
  end

  describe '#game_over' do
    it 'should confirm game is over when player dies' do
      10.times{ |i| subject.attack(subject.player_1)}
      expect(subject.game_over).to be(true)
    end
    it 'should confirm game is not over when neither player has died' do
      expect(subject.game_over).to be(false)
    end
  end
end
