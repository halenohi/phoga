module FeatureMacros
  def login(email, password)
    visit admin_session_path
    within('#new_admin') do
      fill_in 'admin_email', with: email
      fill_in 'admin_password', with: password
    end
    click_button 'Sign in'
  end
end
