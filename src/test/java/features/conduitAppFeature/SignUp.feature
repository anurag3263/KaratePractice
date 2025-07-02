Feature: Sign Up new User

  Background: Preconditions
    * def isValidTime = read('../../helpers/timeValidator.js')
    * def dataGenerator = Java.type('helpers.DataGenarator')
    * def randomEmail = dataGenerator.GetRandomEmail()
    * def randomUsername = dataGenerator.GetRandomUsername()
    * print randomEmail , randomUsername
    Given url 'https://api.realworld.io/api/'

  Scenario: New User sign up
    Given def userData = {"email": "KarateUser13564@test.com","username":"KarateUsers9978"}
    # if you want to read non- static method of java class
    * def jsFunction =
      """
      function () {
      var dataGenerator2 = Java.type('helpers.DataGenarator')
      var generator = new dataGenerator2()
      return generator.GetRandomUsername2()
      }
      """
    * def randomUsername2 = call jsFunction
    * print 'randomUsername2 == ' +randomUsername2
    Given path 'users'
    And def request1 =
      """
      {
      "user":{
      //"email": #('Test'+userData.email),
      // "username":#('user'+userData.password),
      "email": #(randomEmail),
      "password": "123Karate123",
      "username": #(randomUsername)
      }
      }

      """
    * print request1
    And request request1
    When method Post
    Then status 201
    Then print response
    And match response ==
      """
      {
      "user":{
      "id": "#number",
      "email": "#string",
      "username": "#string",
      "bio": null,
      "image": "#string",,
      "token": "#string"
      }

      }

      """

  Scenario Outline: Validate Sign Up error messages
    Given path 'users'
    And request
      """
      {
        "user": {
          "email": "<email>",
          "password": "<password>",
          "username": "<username>"
        }
      }
      """
    When method Post
    Then status 422
    And print response
    And match response == <errorResponse>

    Examples:
      | email                | password  | username          | errorResponse                                      |
      | #(randomEmail)       | Karate123 | KarateUser123     | {"errors":{"username":["has already been taken"]}} |
      | KarateUser1@test.com | Karate123 | #(randomUsername) | {"errors":{"email":["has already been taken"]}}    |
      | KarateUser1          | Karate123 | #(randomUsername) | {"errors":{"email":["has already been taken"]}}    |
      |                      | Karate123 | #(randomUsername) | {"errors":{"email":["can't be blank"]}}            |
      | #(randomEmail)       |           | #(randomUsername) | {"errors":{"password":["can't be blank"]}}         |
      | #(randomEmail)       | Karate123 |                   | {"errors":{"username":["can't be blank"]}}         |
#       | #(randomEmail)       | Karate123 | KarateUser123123123123 | {"errors":{"username":["is too long (maximum is 20 characters)"]}}                 |
#        | #(randomEmail)       | K         | #(randomUsername)      | {"errors":{"password":["is too short (minimum is 8 characters)"]}}                 |
