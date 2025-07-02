@ignore
Feature: Retry logic feature

  Background: define url and common steps
    Given url 'https://api.realworld.io/api/'

  Scenario: Retry call
    * configure retry = { count: 10, interval: 5000 }
    Given params { limit: 10, offset: 0}
    Given path 'articles'
    And retry until response.articles[0].favoritesCount == 1
    When method Get
    Then status 200

  Scenario: Sleep call
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    Given params { limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    * eval sleep(10000)
    Then status 200
