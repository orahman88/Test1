Given(/^Navigate to the Jcpenny homepage$/) do
  visit JcpennyHomePage
end

Then(/^User goes to the Jcpenny my account page to create a new account$/) do
  on(JcpennyHomePage).click_on_my_account_link
  on(JcpennySignInAndNewAccountPage).click_create_account
end

And(/^User fills the information to create a new account$/) do
 @browswer.window(title:"sign up for an account")use
    on(JcpennyCreateNewAccount).new_account_create_info
end