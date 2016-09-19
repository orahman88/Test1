class FacebookLoginSignUpPage < GenericBasePage

  page_url "https://www.facebook.com/"


  #-------Sign Up ----------------------------------------------------------------------------------
  element(:first_name_text_box){|b|b.text_field(id:'u_0_1')}
  # element(:first_name_text_box){|b|b.text_field(class:'inputtext _58mg _5dba _2ph-')}
  # element(:first_name_text_box){|b|b.text_field(name:'firstname')}
  # element(:first_name_text_box){|b|b.text_field(xpath:'//*[@id="u_0_1"]')}
  element(:last_name_text_box){|b|b.text_field(id:'u_0_3')}
  element(:mobil_number_text_box){|b|b.text_field(id:'u_0_6')}
  element(:reenter_mobile_number_text_box){|b|b.text_field(id:'u_0_9')}
  element(:password_box){|b|b.text_field(id:'u_0_b')}
  element(:dob_month_select){|b|b.select(id:'month')}
  element(:dob_day_select){|b|b.select(id:'day')}
  element(:dob_year_select){|b|b.select(id:'year')}
  element(:female_radio_button){|b|b.radio(id:'u_0_e')}
  element(:male_radio_button){|b|b.radio(id:'u_0_f')}
  element(:signup_button){|b|b.button(id:'u_0_j')}


  def fillup_info
    first_name_text_box.when_present.set('Omee')
    last_name_text_box.when_present.set('Nahar')
    mobil_number_text_box.when_present.set('2222222222')
    reenter_mobile_number_text_box.when_present.set('2222222222')
    password_box.when_present.set('Omee@123')
    dob_month_select.when_present.select('Jan')
    dob_day_select.when_present.select('12')
    dob_year_select.when_present.select('1985')
  end

  def click_on_male_radio
    male_radio_button.when_present.click
  end

  def click_on_female_radio
    male_radio_button.when_present.click
  end

  def click_on_signup
    signup_button.when_present.click
  end





#-------------Sign In-------------------------------------------------

  element(:username_text_box){|b|b.text_field(id:'email')}
  element(:password_text_box){|b|b.text_field(id:'pass')}
  element(:login_button){|b|b.button(id:'u_0_o')}




end