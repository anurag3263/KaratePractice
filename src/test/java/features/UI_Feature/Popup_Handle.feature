@PopupHandle
Feature: Popup Handle

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Alerts Popup handling
    Given driver 'https://demoqa.com/alerts'
    * driver.maximize()
    * delay(3000)
    * waitForText("//*[@id='alertButton']", "Click me")
    * delay(3000)
    * screenshot()
    * click("//*[@id='alertButton']")
    * delay(3000)
    # cancel
    * dialog(false)
    * delay(2000)
    * click("//*[@id='alertButton']")
    # enter text and accept
    #* dialog(true, 'some text')
    * delay(3000)
    * dialog(true)