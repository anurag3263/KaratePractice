@BrowserFunction
Feature: Launch Safari browser

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Launch safari brwser and login to saucelab
    Given driver 'https://www.saucedemo.com/'
    * driver.maximize()
  #  * driver.fullscreen()  # this will launch the browser in fullsreen (max possible)
    * driver.refresh()
    * driver.back()
    * delay(2000)
    * driver.forward()
    * def dims = driver.dimensions
    * print dims
    And input("//*[@id='user-name']","standard_user")
    And input("//*[@id='password']","secret_sauce")
    When click("//*[@id='login-button']")
    * delay(2000)
    Then match driver.title == 'Swag Labs'
    Then match driver.url == 'https://www.saucedemo.com/inventory.html'
