@ReadJava
Feature: Read Java class method

  Scenario: Reading the java class and its method
    Given def read = Java.type('pomPages.Sum')
    Then def message = read.loginMessage()
    And print message
    When def sumValue = read.add(10,2)
    Then print sumValue
    When def printMsg = read.print()
