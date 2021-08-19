feature 'Homepage test' do 
  scenario 'visiting the homepage' do 
    visit ('/')
    expect(page).to have_content ('Feel at home, anywhere')
  end 

  feature
    scenario 'inputs email address, password and password confirmation' do 
      visit('/')
      fill_in('email', with: 'user@gmail.com') 
      fill_in('password', with: 'password')
      fill_in('confirm_password', with: 'password')
      click_button('Submit')
    
      expect(page).to have_content('Login to MakersBnB')
    end 

  scenario 'homepage has a sign in button' do
    visit('/')
    click_link('Sign In')
    expect(current_path).to eq '/login'
  end
end 

  