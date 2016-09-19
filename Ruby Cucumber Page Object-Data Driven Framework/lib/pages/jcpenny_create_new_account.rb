class JcpennyCreateNewAccount < GenericBasePage

  #element(:first_name){|b|b.text_field(id:'firstname')}
  element(:first_name){|b|b.text_field(xpath:'//*[@id="firstname"]')}

  element(:last_name){|b|b.text_field(id:'lastname')}
  element(:email_address){|b|b.text_field(id:'emailidReg')}
  element(:password){|b|b.text_field(id:'mypasswdReg')}
  element(:confirm_password){|b|b.text_field(id:'myconfpasswd')}



  def new_account_create_info
    first_name.when_present.set('Omee')
    last_name.when_present.set('Rahman')
    email_address.when_present.set('omee.rahman@gmail.com')
    password.when_present.set('Shajibrahman88')
    confirm_password.when_present.set('Shajibrahman88')
  end



  end