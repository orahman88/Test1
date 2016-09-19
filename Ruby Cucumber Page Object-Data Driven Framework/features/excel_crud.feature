Feature: Demonstrate CRUD operations with Excel

  Scenario: Create or update excel workbook and add data
    When I create the excel worbook "Random.xlsx"
    Then I print the data inside the workbook

  Scenario: Delete cell, column and row
    When I perform delete operations on a workbook

  Scenario: Read excel file and access worksheet
    When I read the excel file "ELIS_Test_Data.xlsx"
    Then I access a worksheet

  Scenario: Read excel worksheet and access rows and cells
    When I read the excel file "ELIS_Test_Data.xlsx"
    Then I access the rows and cells

  Scenario: Read excel worksheet and convert data to hash by using column headers
    When I read the excel file "ELIS_Test_Data.xlsx"
    Then I convert the sheet data into hash with keys as column headers

  Scenario: Accessing a workbook and its data into a web application
    When I open Elis2 website
    And I read the excel file "ELIS_Test_Data1.xlsx"
    And I fill the form with data from excel
    And I hit submit button
    Then I go back to Welcome page and verify title