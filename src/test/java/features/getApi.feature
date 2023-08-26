Feature: Get Api feature

  Scenario: Get user details
    Given url baseUrl
    And path '/4711768'
    When method Get
    Then status 200

  Scenario: Get user details - user not found
    Given url baseUrl
    And path '/1'
    When method Get
    Then status 404

  Scenario: Get user details and validate email
    Given url 'https://gorest.co.in/public/v2/users'
    And path '/4711768'
    When method Get
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * print jsonResponse.name
    * match jsonResponse.id == 4711768
