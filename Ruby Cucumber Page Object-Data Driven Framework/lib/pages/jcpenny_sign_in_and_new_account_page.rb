class JcpennySignInAndNewAccountPage < GenericBasePage

  element(:create_my_account_button){|b|b.link(id:'newUser_Signup')}

  def click_create_account
    create_my_account_button.when_present.click
  end






















end