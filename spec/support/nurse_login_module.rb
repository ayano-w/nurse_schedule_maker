module NurseLoginModule
  def nurse_login(nurse)
    visit new_nurse_session_path
    fill_in 'nurse[name]', with: nurse.name
    fill_in 'nurse[password]', with: nurse.password
    click_button 'ログイン'
  end
end 