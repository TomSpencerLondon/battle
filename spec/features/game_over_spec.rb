feature 'end game' do
  scenario 'ends game when a player dies' do
    sign_in_and_play
    play_multiple_turns(9)
    click_on 'Attack David'
    expect(page).to have_content('GAME OVER')
  end

  scenario 'shows the winning player once game is over' do
    sign_in_and_play
    play_multiple_turns(9)
    click_on 'Attack David'
    expect(page).to have_content 'Tom wins'
  end
end
