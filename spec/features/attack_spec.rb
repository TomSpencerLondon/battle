feature 'Attack player' do
  scenario 'A player can attack another player and reduce their hitpoints' do
    sign_in_and_play
    click_on "Attack #{Game.instance.player_2.name}"
    expect(page).to have_content("#{Game.instance.player_2.name} has been attacked")
  end
end
