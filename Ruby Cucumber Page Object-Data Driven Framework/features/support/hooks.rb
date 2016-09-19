#Author: MOKLASUR RAHMAN
#Date:07/11/2016
include SauceLabs

Before do


    ENV['BROWSER'] ||= "chrome"
    ENV['WHERE'] ||= "local"

    if(ENV['WHERE']=="remote")
      # @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://mrahman1:55a94ff3-c894-4211-a918-67047d2da2ef@localhost:4444/wd/hub"})
      @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://sgrahman:363648ef-2b14-4e4d-a137-1cb8792bcb0f@ondemand.saucelabs.com:443/wd/hub"})
      #@browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://mrahman1:55a94ff3-c894-4211-a918-67047d2da2ef@ondemand.saucelabs.com:443/wd/hub"})
    else
      # @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym)

      if(ENV['BROWSER']== "chrome")
        @browser = Watir::Browser.new ENV['BROWSER'].to_sym,:switches => %w[--disable-extensions  --ignore-certificate-errors --disable-popup-blocking --disable-translate]
      else
        @browser = Watir::Browser.new ENV['BROWSER'].to_sym
      end
      # @browser = Watir::Browser.new ENV['BROWSER'].to_sym
      # @browser = Watir::Browser.new ENV['BROWSER'].to_sym,:switches => %w[--disable-extensions  --ignore-certificate-errors --disable-popup-blocking --disable-translate]
    end

    @browser.window.maximize
    #@browser.quit
  end











#   ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
#   ENV['WHERE'] = "local" if ENV['WHERE'].nil?
#   if(ENV['WHERE']=="remote")
#   # @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://mrahman1:55a94ff3-c894-4211-a918-67047d2da2ef@localhost:4444/wd/hub"})
#     @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://sgrahman:363648ef-2b14-4e4d-a137-1cb8792bcb0f@ondemand.saucelabs.com:443/wd/hub"})
#     #@browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://mrahman1:55a94ff3-c894-4211-a918-67047d2da2ef@ondemand.saucelabs.com:443/wd/hub"})
#
#
#     if (ENV['BROWSER']=="chrome")
#       @browser = Watir::Browser.new :chrome, :switches => %w[--disable-extensions]
#     end
#   else
#     # @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym)
#     @browser = Watir::Browser.new ENV['BROWSER'].to_sym
#   end
#   @browser.window.maximize
#
#   # Cucumber::Ast::Scenario = Cucumber::Reports::Legacy::Ast::Scenario
# end


After do |scenario|
  if scenario.failed?
      time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
#-------Print all the cookies------------------------------------------------------------------------------------
  # cookies = @browser.cookies.to_a
  #
  # cookies.each do |value|
  #
  #   puts "Cookies Info:#{value}"
  #
  # end
#-----Clear all the cookies----------------------------------------------------------------------------------------
  #@browser.cookies.clear

  #------------Close the browser------------------------------------------------------------------------------------
  # @browser.quit

end




# After do |scenario|
#
#    if scenario.failed?
#    time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
#    filename = "error-#{@current_page.class}-#{time}.png"
#    @current_page.save_screenshot(filename)
#    embed(filename, 'image/png')
#    end
#    @browser.cookies.clear
#   # @browser.close
#  end
#








at_exit do
  ENV['ARCHIVE_RESULTS'] = 'no' if ENV['ARCHIVE_RESULTS'].nil?
  if ENV['ARCHIVE_RESULTS']=="yes"
    Dir.mkdir("resultsarchive") if Dir["resultsarchive"].empty?
    folder = Dir.pwd
    input_filenames = ['results.html']

    zipfile_name = "#{Date.today}_results.zip"

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        zipfile.add(filename, folder + '/' + filename)
      end
    end
    FileUtils.mv(zipfile_name,"resultsarchive/#{zipfile_name}")
  end
end



