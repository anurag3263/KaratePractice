@Login11
Feature: Login feature using POM page

  Background: 

  # * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
  Scenario: Login to open Hrm using pom Class
    #Given driver 'https://opensource-demo.orangehrmlive.com/web/index.php/auth/login'
    #And driver.maximize()
    #And delay(3000)
    #* waitForText("//*[text()='Login']", "Login")
    * def readLogin = Java.type('pomPages.LoginMethod')
    * def results = readLogin.loginRetro('username','password')
    * waitForText("//*[contains(@class,'alert-content-text')]", "Invalid credentials")
    * def text = text("//*[contains(@class,'alert-content-text')]")
    * print text
