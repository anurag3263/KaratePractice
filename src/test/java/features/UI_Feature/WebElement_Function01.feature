@WebElementFunction
Feature: Web Element Function 1

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Web Element function in Karate 1
    Given driver 'https://www.saucedemo.com/'
    * driver.maximize()
    * highlightAll('input')
    And input("//*[@id='user-name']","standard_user")
    * clear("//*[@id='user-name']")
    * delay(3000)
    And input("//*[@id='user-name']","standard_user")
    And input("//*[@id='password']","secret_sauce")
    * clear("//*[@id='password']")
    * delay(3000)
    * focus("//*[@id='password']")
    And input("//*[@id='password']","secret_sauce")
    * highlight("//*[@id='login-button']")
    * delay(3000)
    * screenshot()
    When click("//*[@id='login-button']")
    * delay(2000)
    Then match driver.title == 'Swag Labs'
    * screenshot()
    Then match driver.url == 'https://www.saucedemo.com/inventory.html'
