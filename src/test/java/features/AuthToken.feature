Feature: Get Api feature with Auth Token

  Scenario: Get user details
    * print tokenID
    Given header Autorization = 'Bearer ' + tokenID
    When url baseUrl
    And path '/4711768'
    When method Get
    Then status 200
    * print response
