Given(/^User navigate to the facebook sign up page$/) do
visit FacebookLoginSignUpPage
end

Then(/^User fill up the sign up information$/) do
#on(FacebookLoginSignUpPage).first_name_text_box.when_present.set ("Omee")
  on(FacebookLoginSignUpPage).fillup_info
  on(FacebookLoginSignUpPage).click_on_male_radio

end
#
# And(/^Click on the Sign Up button$/) do
#   #on(FacebookLoginSignUpPage).click_on_signup
# end