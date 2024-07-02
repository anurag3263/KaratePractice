@conduit
Feature: Home page feature

Background: define url and common steps
    Given url 'https://api.realworld.io/api/'

Scenario: Get All tags
    Given path 'tags'
    When method Get
    Then status 200 
    And print response
    And match response.tags contains ['repellat','facilis']
    And match response.tags !contains ['cars']
    And match response.tags == "#array"
    And match each response.tags == "#string"

Scenario: Get 10 Article from the page
    Given params { limit: 10,offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
    And print response
    And match response.articles == "#[10]"
    And match response.articlesCount == 251