@IframeHandle
Feature: Iframe Handle

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Handling frame
    Given driver 'https://www.globalsqa.com/demo-site/frames-and-windows/#Open%20New%20Tab'
    * driver.maximize()
    * delay(3000)
    * waitForText("//*[@id='Open New Tab']", "Open New Tab")
    * delay(3000)
    * screenshot()
    Then click("//*[@id='iFrame']")
    * delay(4000)
    #takes an integer as the param
    #When switchFrame(0)
    #Or you use a locator that points to the <iframe> element that you need to “switch to”.
    * switchFrame("//iframe[contains(@name,'globalSqa')]")
    * screenshot()
    * def title = text("//h1[contains(.,'Trainings')]")
    * print title
    #To “reset” so that you are back to the “root” page / parent frame, just switch to null (or integer value -1):
    When switchFrame(null)
    * def text = text("//div[@class='page_heading']/h1[contains(.,'Frames')]")
    * print text
