class MacysHomePage < GenericBasePage
  page_url "http://www.macys.com/"

  element(:sign_in_link){|b|b.link(id:'globalMastheadSignIn')}

  #---------This is a method/function
def click_on_signin_link
  sign_in_link.when_present.click

end
#--------------------------------------------------------------














end