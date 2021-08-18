feature "requesting to book a listing" do
  scenario "user wants to request to book a space" do
    
    visit ('/listings')
    click_button("Request to Book")

    expect(page).to have_content('which dates would you like to request?')
  end

  scenario "user requests a check in and check out date" do
    
    visit('/listings')
    click_button("Request to Book")
    fill_in('check_in', with: "22/08/2021")
    fill_in("check_out", with: "25/08/2021")
    click_button("Submit")

    expect(page).to have_content('Your request to book this space for 22/08/2021 - 25/08/2021 has been submitted and is now awaiting confirmation by the owner.')
  end
end


