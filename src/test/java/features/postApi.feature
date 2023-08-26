Feature: create user by Post Api

  Background: 
    * def requestBody =
      """
      {
              "name": "Annamalai123",
              "email": "Annamalai14@grimes.example",
              "gender": "male",
              "status": "active"
          }
      """

  Scenario: create user with given data
    Given url baseUrl
    And request requestBody
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    * print response
    * def jsonResponse = response
    Then match jsonResponse.id == '#present'
    Then match jsonResponse.email == '#present'
    Then match jsonResponse.name == 'Annamalai123'
