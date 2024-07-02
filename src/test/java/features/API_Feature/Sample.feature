@sample
Feature: Print hello world

  Scenario: Hello world Scenario
    * print 'Hello World'
    * print 'hello Guys welcome to YT karate tutorials'
    
    Scenario: declare and print variables
     * def total = 200
     * def tax = 20
     * def fee = 10
     * print 'total amount --->' + (total+tax+fee)
     
     Scenario: calculator scenario
     * def a = 10
     * def b = 2
     * print 'total after multiply ---->'  + (a * b)
