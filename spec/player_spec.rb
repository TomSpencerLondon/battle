require 'player'

describe Player do
  subject(:player_1) { described_class.new("Tom") }
  subject(:player_2) { described_class.new("Lyn") }

  it "should return the player's name" do
    expect(player_1.name).to eq "Tom"
  end

  it "should return the player's hp" do
    expect(subject.hp).to eq 100
  end

  it "should reduce the player's hp by 10" do
    expect{ subject.reduce_hp(10) }.to change{ subject.hp }.by(-10)
  end

end
