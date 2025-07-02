Feature: Hooks

  # to avoid scenario or feature to run on parallel mode use @parallel=false
  # to ignore feature or scenario use @ignore tag
  Background: hooks
    # * def result = callonce read('classpath:helpers/Dummy.feature')
    # * def username = result.username
    #after hooks
    # afterScenario and afterFeature are keyword used to to define like @after hooks
    #and background work like Before scenario
    * configure afterScenario = function(){ karate.call('../../helpers/Dummy.feature') }
    * configure afterFeature =
      """
          function(){
              karate.log('After Feature Text');
          }
      """

  Scenario: First scenario
    # * print username
    * print 'This is first scenario'

  Scenario: Second Scenario
    # * print username
    * print 'This is second scenario'
