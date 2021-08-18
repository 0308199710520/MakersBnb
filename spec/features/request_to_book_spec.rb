feature "requesting to book a listing" do
  scenario "user wants to request to book a space" do
    
    visit ('/listings')
    click_button("request to book")

    expect(page).to have_content('which dates do you want to request to book?')
  end
end