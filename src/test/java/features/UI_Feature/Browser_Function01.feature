@driverFunction
Feature: Launch Safari browser

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Launch safari brwser and login to saucelab
    Given driver 'https://www.saucedemo.com/'
    And driver.dimensions = {x: 0, y: 0, width: 800, height: 500}
    * def dims = driver.dimensions
    * print dims
    And input("//*[@id='user-name']","standard_user")
    And input("//*[@id='password']","secret_sauce")
    When click("//*[@id='login-button']")
    Then match driver.title == 'Swag Labs'
    Then match driver.url == 'https://www.saucedemo.com/inventory.html'
