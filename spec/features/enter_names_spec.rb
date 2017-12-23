feature "Enter names" do
  scenario "let players fill in their names in a form and submit" do
    sign_in_and_play
    expect(page).to have_content "Tom 100 David 100"
  end
end
