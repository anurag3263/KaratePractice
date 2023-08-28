@DropdownFunction
Feature: Dropdown Selection

  Background: 
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: Select the dropdown
    Given driver 'https://demoqa.com/select-menu'
    * driver.maximize()
    # select by displayed text
    * delay(3000)
    * scroll("//select[@id='oldSelectMenu']")
    * screenshot()
    And select("//select[@id='oldSelectMenu']", '{}Blue')
    * delay(3000)
    * screenshot()
    # select by partial displayed text
    And select("//select[@id='oldSelectMenu']", '{^}Yel')
    * delay(3000)
    * screenshot()
    # select by `value`
    And select("//select[@id='oldSelectMenu']", '5')
    * delay(3000)
    * screenshot()
    # select by index
    And select("//select[@id='oldSelectMenu']", 0)
    * delay(3000)
    * screenshot()
