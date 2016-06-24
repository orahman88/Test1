

Before do

  @browser = Watir::Browser.new :chrome

end


After do
  @browser.quit
end



