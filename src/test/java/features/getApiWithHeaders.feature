@sample
Feature: Get Api with headers

  Scenario: pass the user request with headers Part-1
    Given header Connection = 'keep-alive'
    When url baseUrl
    * def query = {status:'active'}
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers Part-2
    * def request_head = {Connection: 'keep-alive', Content-Type: 'text/xml;charset=ISO-8859-1'}
    Given headers request_head
    When url baseUrl
    * def query = {status:'active'}
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers Part-3
    * configure headers = {Connection: 'keep-alive', Content-Type: 'text/xml;charset=ISO-8859-1'}
    When url baseUrl
    * def query = {status:'active'}
    And params query
    When method GET
    Then status 200
    * print response
