@conduit
Feature: convert string to Number and Nember to String

  Scenario: Number to string
    * def foo = 10
    * def json = {"bar": #(foo+'')}
    * match json == {"bar": '10' }

  Scenario: String to number
    * def foo = '10'
    * def json = {"bar": #(foo*1)}
    * def json2 = {"bar": #(~~parseInt(foo))}
    * match json == {"bar": 10 }
    * match json2 == {"bar": 10 }
