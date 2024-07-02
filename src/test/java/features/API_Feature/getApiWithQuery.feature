Feature: Get Api with Query Parameter

  Scenario: Get User Details with active status
    Given url baseUrl
    * def query = {status:'active'}
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: Get User Details with active status that are male
    Given url baseUrl
    * def query = {status:'active',gender:'male'}
    And params query
    When method GET
    Then status 200
    * print response
    
    Scenario: Get User Details size that have active status and are male 
    Given url baseUrl
    * def query = {status:'active',gender:'male'}
    And params query
    When method GET
    Then status 200
    * print response.length
    * print response
