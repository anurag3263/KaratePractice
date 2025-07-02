Feature: Create Token

  Scenario: Create token for reuse
    Given url 'https://api.realworld.io/api/'
    Given path 'users/login'
    ## use this {"user": {"email": "anurag@test.com","password": "Karate123"}} if you dont want to parameterised
    ## use like below if you want to make it parameterised
    And request {"user": {"email": "#(email)","password": "#(password)"}}
    When method post
    Then status 200
    * def authToken = response.user.token
