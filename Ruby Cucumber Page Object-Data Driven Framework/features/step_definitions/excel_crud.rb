When(/^I create the excel worbook "([^"]*)"$/) do |excel_workbook|
  @my_workbook = RubyXL::Workbook.new
  @my_workbook.add_worksheet("Sheet1")
  sheet1 = @my_workbook[0]
  sheet1.insert_cell(0,0,"Username")
  sheet1.insert_cell(0,1,"Password")
  sheet1.insert_cell(0,2,"Application Type")
  sheet1.insert_cell(1,0,"app1453@example.com")
  sheet1.insert_cell(1,1,"Benefit1!")
  sheet1.insert_cell(1,2,"I90 Form")
  @my_workbook.write(excel_workbook)
end

Then(/^I print the data inside the workbook$/) do
  random_xlsx = RubyXL::Parser.parse("Random.xlsx")
  puts "Printing a sample cell..."
  puts "Name -- #{random_xlsx[0].extract_data[1][0]}"
  puts "website -- #{random_xlsx[0].extract_data[1][1]}"
end

When(/^I perform delete operations on a workbook$/) do
  random_workbook = RubyXL::Parser.parse("Random.xlsx")
  sheet1 = random_workbook[0]
  puts "Deleting the first row..."
  sheet1.delete_row(0)
  puts "Printing the first cell...#{random_workbook[0].extract_data[0][0]}"
  puts "Inserting the row back again..."
  sheet1.insert_row(0)
  puts "Populating the cells in the row..."
  sheet1.insert_cell(0,0,"Username")
  sheet1.insert_cell(0,1,"Password")
  sheet1.insert_cell(0,2,"Application Type")
  puts "Printing the first cell again...#{random_workbook[0].extract_data[0][0]}"
  puts "Printing the first cell before deleting column...#{random_workbook[0].extract_data[0][0]}"
  puts "Now deleting the first column..."
  sheet1.delete_column(0)
  puts "Printing the first cell after deleting the column...#{random_workbook[0].extract_data[0][0]}"
  puts "Inserting the first column again..."
  sheet1.insert_column(0)
  puts "Populating the values in first column..."
  sheet1.insert_cell(0,0,"Username")
  sheet1.insert_cell(1,0,"app1453@example.com")
  puts "Printing the first cell after populating the column...#{random_workbook[0].extract_data[0][0]}"
  puts "Printing the first cell before deleting cell contents...#{random_workbook[0].extract_data[0][0]}"
  puts "Now deleting the contents of first cell..."
  sheet1.delete_cell(0,0)
  puts "Printing the first cell afer deleting the cell contents...#{random_workbook[0].extract_data[0][0]}"
  puts "Populating the cell contents back..."
  sheet1.insert_cell(0,0,"Name")
  puts "Printing the first cell after populating...#{random_workbook[0].extract_data[0][0]}"
  puts "Now deleting the workbook...."
  File.delete("Random.xlsx") if File.exists?("Random.xlsx")
end

When(/^I read the excel file "([^"]*)"$/) do |excel_file|
  dir_to_excel = Dir.pwd + '/lib/config/data'
  @read_workbook = RubyXL::Parser.parse("#{dir_to_excel}/#{excel_file}")
  #@read_workbook = RubyXL::Parser.parse("#{dir_to_excel}/ELIS_External_Test_Data.xlsx")
end

Then(/^I access a worksheet$/) do
  puts "Total # of worksheets -- #{@read_workbook.worksheets.size}"
  puts "Names of all Sheets"
  @read_workbook.worksheets.each do |worksheet|
    print "#{worksheet.sheet_name} |"
  end
  puts "Accessing Sheet1..."
  sheet1=@read_workbook['Sheet1']
  puts "Acessing sheet1 cells as rectangular array..."
  puts sheet1.extract_data

end

Then(/^I access the rows and cells$/) do
  sheet1=@read_workbook['Sheet1']
  first_row = sheet1.sheet_data[0]
  second_row = sheet1.sheet_data[1]
  puts "total # of rows -- #{sheet1.sheet_data.size}"
  puts "total # of columms in row 0 -- #{first_row.size}"
  puts "total # of columns in row 1 -- #{second_row.size}"
  puts "Accessing Cells in first row..."
  first_row.size.times do |i|
    print "#{first_row[i].value} |"
  end
  puts "Accessing Cells in second row..."
  second_row.size.times do |i|
    print "#{second_row[i].value}"
  end
  puts "Accessing entire sheet data..."
  sheet1.sheet_data.size.times do |i|
    currentRow = sheet1.sheet_data[i]
    currentRow.size.times do |j|
      print "#{currentRow[j].value} |"
    end
    puts "\n"
  end
end

Then(/^I convert the sheet data into hash with keys as column headers$/) do
  sheet1=@read_workbook['Sheet1']
  table_hash = sheet1.get_table(["username","password","my_status_is","reason_for_application","a_number","lastName","firstName","middleName","in_care_of_name","apt","apt_number"])
  puts table_hash
end

And(/^I fill the form with data from excel$/) do
  sheet1=@read_workbook['Sheet1']
  table_hash = sheet1.get_table(["username","password","my_status_is","reason_for_application","a_number","lastName","firstName","middleName","in_care_of_name","apt","apt_number"])
   array_of_hashmaps = table_hash[:table]
   array_of_hashmaps.length.times do |i|
    currenthash = array_of_hashmaps[i]
    # @browser.text_field(name: 'firstname').set currenthash["firstname"]
    # @browser.text_field(name: 'lastname').set currenthash["lastname"]
    # @browser.radio(value: currenthash["sex"].to_s).set
    # @browser.radio(value: currenthash["yrs"].to_s).set
    # @browser.text_field(id: 'datepicker').set currenthash["date_stopped"]
    # @browser.checkbox(value: currenthash["tea"]).set
    # @browser.checkbox(value: currenthash["excited_about"]).set
    # @browser.select_list(id: 'continents').select currenthash["continent"]
    # @browser.select_list(id: 'selenium_commands').select currenthash["selenium_commands"]

    #--------------------------------------------------------------------------------------------
    @browser.text_field(id:'displayed_j_username').when_present.set currenthash["username"]
    @browser.text_field(id:'j_password').when_present.set currenthash["password"]

    sleep 2
    a=@browser.title
    #  expect(a).to eql('USCIS - home')

    puts 'Title of the Page: ' + a.to_s

    if(@browser.link(id:'deleteDraftCase1').exist? == true)
      puts "Case exist"
      @browser.link(id:'deleteDraftCase1').click

      if @browser.alert.exists?
        alert= @browser.alert
        alert.ok
      end
    end


  end
end

When(/^I open Elis2 website$/) do
  #@browser.goto "https://public-pt-elis2.uscis.dhs.gov/efile/login"
  @browser.goto "https://public-pp-elis2.uscis.dhs.gov/efile/login"
end


And(/^I hit submit button$/) do
  @browser.button(id:'proceed').when_present.click
  sleep 8
end

Then(/^I go back to Welcome page and verify title$/) do
  a=@browser.title
  expect(a).to eql('USCIS - home')

  puts 'Title of the Page: ' + a.to_s

end

