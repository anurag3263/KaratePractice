Feature: Dummy

  Scenario: Dummy
    * def dataGenerator = Java.type('helpers.DataGenarator')
    * def username = dataGenerator.GetRandomUsername()
    * print 'AfterScenario : '+username
