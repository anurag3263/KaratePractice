Feature: create user by Post Api

  Background: 
    * def random_string =
      """
      function(s){
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for(var i=0 ; i<s ; i++)
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;
      }
      """
    * def randomEmail = random_string(10)
    * print randomEmail
    * def requestBody =
      """
      {
              "name": "Annamalai123",
              "gender": "male",
              "status": "active"
          }
      """
    * requestBody.email = randomEmail + "@gmail.com"
    * print  requestBody

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
