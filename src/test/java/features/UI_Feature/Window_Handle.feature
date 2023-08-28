@WindowHandle
Feature: Window Handle

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Switching window
    Given driver 'https://opensource-demo.orangehrmlive.com/web/index.php/auth/login'
    * driver.maximize()
    * delay(3000)
    * waitForText("//h5[contains(.,'Login')]", "Login")
    * delay(3000)
    * screenshot()
    When click("//a[contains(@href,'facebook')]")
    * delay(2000)
    When click("//a[contains(@href,'linkedin')]")
    * delay(2000)
    When click("//a[contains(@href,'twitter')]")
    * delay(2000)
    When click("//a[contains(@href,'youtube')]")
    #switch to one based on page title or URL. this will be using contains function internally to match the title or url
    * delay(3000)
    * switchPage("Most Popular Opensource HRIS | Secaucus NJ | Facebook")
    * delay(2000)
    * screenshot()
    #by page index if you know it:
    * switchPage(2)
    * delay(2000)
    * screenshot()
    * delay(3000)
    # by page url
    * switchPage('youtube')
    * delay(2000)
    * screenshot()
    * delay(3000)
