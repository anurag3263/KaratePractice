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
    ## []used for multiple value assertions
    And match response.tags !contains 'cars'
    And match response.tags contains any ['cars','repellat']
    #  And match response.tags contains only ['repellat']
    And match response.tags == "#array"
    And match each response.tags == "#string"

  Scenario: Get 10 Article from the page
    * def isValidTime = read('../../helpers/timeValidator.js')
    Given params { limit: 10,offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
    And print response
    And match response.articles == "#[10]"
    And match response.articlesCount == 251
    And match response.articlesCount != 100
    And match response == {"articles": "#array","articlesCount":251}
    And match response.articles[0].createdAt contains '2024'
    And match response.articles[*].favoritesCount contains 35
    And match response.articles[*].author.bio contains null
    ## or use wild card instead of *  now .. it look all response and find bio contains the value
    And match response..bio contains null
    ## fuzzy matching below
    And match each response..following == false
    And match each response..following == '#boolean'
    And match each response..favoritesCount == '#number'
    And match each response..bio == '##string'
    ## ## is used for fuzzy matching here which will look for bio if it there then it should be either null or string
    ## if in an array there is no bio field then it will not fail
    ## now lets do schema validation
    And match each response.articles ==
      """
          {
              "slug": "#string",
              "title": "#string",
              "description": "#string",
              "body": "#string",
              "tagList": "#array",
              "createdAt": '#? isValidTime(_)',
              "updatedAt": '#? isValidTime(_)',
              "favorited": '#boolean',
              "favoritesCount": '#number',
              "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": '#boolean'
              }
          }
      """
