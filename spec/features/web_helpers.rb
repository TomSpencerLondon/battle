def sign_in_and_play
  visit('/')
  fill_in("name_1", with: "Tom")
  fill_in("name_2", with: "David")
  click_on("submit")
end

def play_multiple_turns(num)
  num.times do
    click_on 'Attack David'
    click_on 'Attack Tom'
  end
end
