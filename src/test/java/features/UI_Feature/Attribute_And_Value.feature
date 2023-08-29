@Attribute
Feature: Attribute and Value Operation

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Getting Attribute from html
    Given driver 'https://training.rcvacademy.com/'
    And driver.maximize()
    And delay(3000)
    When def Attribute_value = attribute("//*[text()='Get Access']", "data-submithref")
    Then print Attribute_value

  @SetValue
  Scenario: Getting value from html and setting the value in html
    Given driver 'https://training.rcvacademy.com/'
    And driver.maximize()
    And delay(3000)
    When def initian_value = value("//*[@placeholder='Your name']")
    Then print initian_value
    #  And delay(3000)
    And value("//*[@placeholder='Your name']","Anurag")
    #  And delay(3000)
    Then def new_value = value("//*[@placeholder='Your name']")
    And print new_value
