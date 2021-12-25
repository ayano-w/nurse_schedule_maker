module NurseLoginModule
  def nurse_login(nurse)
    visit new_nurse_session_path
    fill_in 'name', with: nurse.name
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end
end