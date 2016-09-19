class MacysCreateProfilePage < GenericBasePage

  element(:first_name){|b|b.text_field(id:'firstName')}
  element(:last_name){|b|b.text_field(id:'lastName')}
  element(:mailing_address){|b|b.text_field(id:"addressLine1")}
  element(:city){|b|b.text_field(id:'city')}
  element(:state){|b|b.select(id:'state')}
  element(:zip_code){|b|b.text_field(id:'zipcode')}
  element(:dob_month_select){|b|b.select(id:'month')}
  element(:dob_date_select){|b|b.select(id:'date')}
  element(:dob_year_select){|b|b.select(id:'year')}
  element(:gender_select){|b|b.select(id:'gender')}
  element(:email){|b|b.text_field(id:'email')}
  element(:verify_email){|b|b.text_field(id:'createConfirmEmail')}
  element(:password){|b|b.text_field(id:'password')}
  element(:verify_password){|b|b.text_field(id:'confirmPassword')}
  element(:security_question){|b|b.select(id:'SecurityQna')}
  element(:answer_security_question){|b|b.text_field(id:'securityAns')}



  #---------This is a method/function--------------------------------------------------------
  def fill_up_profile_info
    dir_to_excel = Dir.pwd + '/lib/config/data'
    read_workbook = RubyXL::Parser.parse("#{dir_to_excel}/Macys_Test_Data.xlsx")
    worksheet = read_workbook['Mcys_profile_info']
    first_name.when_present.set worksheet[1][0].value
    last_name.when_present.set('Rahman')
    mailing_address.when_present.set('1472 43RD STREET')
    city.when_present.set('BROOKLYN')
    state.when_present.select('New York')
    zip_code.when_present.set('11219')
    dob_month_select.when_present.select('January')
    dob_date_select.when_present.select('16')
    dob_year_select.when_present.select('1998')
    gender_select.when_present.select('Female')
    email.when_present.set('omee.rahman@gmail.com')
    verify_email.when_present.set('omee.rahman@gmail.com')
    password.when_present.set('Shajibrahman88')
    verify_password.when_present.set('Shajibrahman88')
    security_question.when_present.select('What was the name of your first pet?')
    answer_security_question.when_present.set('Pinky')
  end










end