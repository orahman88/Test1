class JcpennyHomePage <GenericBasePage
  page_url "http://www.jcpenney.com/"

  #element(:my_account_link){|b|b.link(xpath:'//*[@id="coldState"]/ul/li[2]/a')}
  element(:my_account_link){|b|b.link(href:'https://www.jcpenney.com:443/dotcom/jsp/profile/secure/login.jsp?isfromMyAccount=true')}



  def click_on_my_account_link
    my_account_link.when_present.click
  end
end