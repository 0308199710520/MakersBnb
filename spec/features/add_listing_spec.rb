feature 'Add listing test' do 
  scenario 'adding a listing' do 
    visit ('/listings/new')
    fill_in('name', with: 'zagora') 
    fill_in('description', with: 'desert oasis')
    fill_in('price', with: '10')
    fill_in('date_from', with: '10/10/21')
    fill_in('date_to', with: '20/10/21')
    click_button('Submit')

    expect(page).to have_content('Listing created')
  end 

end 
