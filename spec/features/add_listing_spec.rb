require 'pg'

feature 'Add listing test' do 
  scenario 'adding a listing' do 

    
    visit ('/listings/new')
    
    fill_in('name', with: 'zagora') 
    fill_in('description', with: 'desert oasis') 

    click_button('Submit')
    

     
    expect(page).to have_content('zagora')
    expect(page).to have_content('desert oasis')
    
    # expect(page).to have_content('10')
    # expect(page).to have_content('10/10/2021')
    # expect(page).to have_content('20/10/2021')

  end
end


        
    
   
    
     

