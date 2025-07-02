Feature: Articles

  Background: define url and common steps
    Given url 'https://api.realworld.io/api/'
    # Given path 'users/login'
    # And request {"user": {"email": "anurag@test.com","password": "Karate123"}}
    # When method post
    # Then status 200
    # * def token = response.user.token
    ## use callonce if you want to call the feature only once and utilise it throughout the feature
    ## other wise use call then for every scenario the feature will be called like below
    ## def tokenResponse = call read('../../helpers/CreateToken.feature')
    * def tokenResponse = callonce read('../../helpers/CreateToken.feature') {"email": "anurag@test.com","password": "Karate123"}
    * def token = tokenResponse.authToken

  @conduit1
  Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": [],"title": "Bla bla111","description": "test test","body":"body"}}
    When method post
    Then status 201
    And match response.article.title == 'Bla bla111'

  Scenario: Create and delete article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": [],"title": "Bla blab1111","description": "test test","body":"body"}}
    When method post
    Then status 201
    * print response
    * def articleId = response.article.slug
    * print articleId
    # Given params {limit: 10, offset: 0}
    # Given path 'articles'
    # When method Get
    # Then status 200
    # * print response
    # And match response.articles[0].title == 'Bla blab1111'
    Given header Authorization = 'Token ' + token
    Given path 'articles','Bla-blab1111-38553'
    When method Delete
    Then status 204
    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    * print response
    And match response.articles[0].title != 'Bla blab1111'
