require 'pg'

feature 'Add listing test' do 
  scenario 'adding a listing' do 

    connection = PG.connect(dbname: 'makers_bnb_test')
    connection.exec("INSERT INTO listings (name) VALUES ('zagora');")
    connection.exec("INSERT INTO listings (name) VALUES ('arogaz');")

    visit ('/listings/new')
    fill_in('name', with: 'zagora') 
    fill_in('name', with: 'arogaz') 


    fill_in('description', with: 'desert oasis')
    fill_in('price', with: '10')
    fill_in('date_from', with: '10/10/2021')
    fill_in('date_to', with: '20/10/2021')
    click_button('Submit')

     
    expect(page).to have_content('zagora')
    expect(page).to have_content('arogaz')
    # expect(page).to have_content('desert oasis')
    # expect(page).to have_content('10')
    # expect(page).to have_content('10/10/2021')
    # expect(page).to have_content('20/10/2021')

  end
end


        
    
   
    
     

