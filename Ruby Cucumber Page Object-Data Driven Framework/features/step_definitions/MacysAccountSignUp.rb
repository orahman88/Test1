Given(/^User navigate to the Macys home page$/) do
  visit MacysHomePage

end

And(/^Then navigate to the Sign In page and create a profile$/) do
  on(MacysHomePage).click_on_signin_link
  on(MacysSignInPageAndProfileCreate).click_create
end


Then(/^New User fills up the information$/) do
  on(MacysCreateProfilePage).fill_up_profile_info
end