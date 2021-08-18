feature "requesting to book a listing" do
  scenario "user wants to request to book a space" do
    
    visit ('/listings')
    click_button("Request to Book")

    expect(page).to have_content('which dates would you like to request?')
  end
end