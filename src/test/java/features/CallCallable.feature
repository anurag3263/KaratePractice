@callable
Feature: Get Api feature with Auth Token
  
  * configure headers = {Content-Type: 'application/json', Connection: 'Keep-Alive', Accecpt: 'application/json', Accept-Encoding: 'gzip, deflate, br'}

  Scenario: Get user details
    * def res = call read('Callable.feature')
    * print res
    * print res.tokenID
    * print res.baseUrl
    Given header Autorization = 'Bearer ' + res.tokenID
    When url res.baseUrl
    And path '/6946964'
    When method Get
    Then status 200
    * print response
