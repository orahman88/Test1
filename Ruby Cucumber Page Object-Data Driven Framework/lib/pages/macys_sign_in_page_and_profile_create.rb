class MacysSignInPageAndProfileCreate < GenericBasePage

  element(:create_profile_button){|b|b.link(id:'createProfileContainer')}

def click_create
  create_profile_button.when_present.click

end










end