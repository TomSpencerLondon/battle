feature 'Switch turns' do
  scenario 'player 1 has a turn after player 2' do
    sign_in_and_play
    click_on 'Attack David'
    expect(page).to have_content("Attack Tom")
  end
end 
