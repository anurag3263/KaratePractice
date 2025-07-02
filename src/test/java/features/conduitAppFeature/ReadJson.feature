Feature: Read json and set json file

  Background: Preconditions
    * def isValidTime = read('../../helpers/timeValidator.js')
    * def dataGenerator = Java.type('helpers.DataGenarator')
    * def randomEmail = dataGenerator.GetRandomEmail()
    * def randomUsername = dataGenerator.GetRandomUsername()
    * print randomEmail , randomUsername
    Given url 'https://api.realworld.io/api/'

  Scenario: Read Json Data
    * def jsonBody = read('../../jsonTestData/newArticleRequest.json')
    * print jsonBody

  Scenario: Set json with new data
    * def jsonBody = read('../../jsonTestData/newArticleRequest.json')
    * set jsonBody.article.title = dataGenerator.getRandomArticlesValues().title
    * set jsonBody.article.description = dataGenerator.getRandomArticlesValues().description
    * set jsonBody.article.body = dataGenerator.getRandomArticlesValues().body
    * print jsonBody
