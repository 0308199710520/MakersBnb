feature 'Homepage test' do 
  scenario 'visiting the homepage' do 
    visit ('/')
    expect(page).to have_content ('Homepage')
  end 

  scenario 'inputs email address, password and password confirmation' do 
    visit('/')
    fill_in('email', with: 'user@gmail.com') 
    fill_in('password', with: 'password')
    fill_in('confirm password', with: 'password')
    click_button('Submit')

    expect(page).to have_content('Account created')
  end 

end 

  