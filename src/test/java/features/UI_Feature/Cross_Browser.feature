@safari
Feature: Launch Safari browser

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  #* configure driver = { type: 'safaridriver'}
  # to launch anyother browser than chrome and msedge you have to download exe file for that
  # particular browser and then you have to specify the path of that exe file here
  # configure driver = { type: 'chrome', executable: "absolute path"}
  Scenario: Launch safari brwser and login to saucelab
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']","standard_user")
    And input("//*[@id='password']","secret_sauce")
    When click("//*[@id='login-button']")
    Then match driver.title == 'Swag Labs'
