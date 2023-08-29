@MouseOperation
Feature: Mouse Operation

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Perform Mouse Operation
    Given driver 'https://demoqa.com/menu/'
    * driver.maximize()
    * delay(3000)
    #Make sure you call go() at the end - if the last method in the chain is not click() or up().
    #* mouse().move(100, 200).go()
    #* mouse().move('#eg02RightDivId').click()
    # this is a "click and drag" action
    #* mouse().down().move('#eg02LeftDivId').up()
    #* mouse().move("//a[text()='Main Item 2']").click()
    * mouse().move("//a[text()='Main Item 2']").go()
    * waitForText("//a[text()='SUB SUB LIST »']", "SUB SUB LIST »")
    Then screenshot()
    * def text = driver.text("//a[text()='SUB SUB LIST »']")
    * print text
    * delay(3000)
