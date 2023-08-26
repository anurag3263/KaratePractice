  function fn(){
    
    var env = karate.env; // get java system property 'karate.envData' from TestRunner.java
    
   //   karate.log('karate.envData system property was:', env);
    
    if (!env) {
        env = 'dev'; // a custom 'intelligent' default
      }
    
    var config = { // base config JSON
    env: env,
    myVarName: 'hello karate'
 //       requestBodyIs:'{"title": "Welcome To Karate","body": "Karate Automation Framework","userId": 20}'
        , baseUrl: 'https://gorest.co.in/public/v2/users',
         tokenID: 'c9a854545133d968961d92f34907d3596062edf3a99dd81c60ce286dafd9c4b2'
      };
    if (env == 'dev') {
        // over-ride only those that need to be
 //       config.requestBodyIs = '{"title": "Welcome To Karate QA ","QA body": "Karate Automation Framework","userId": 20}';
    } else if (env == 'STG') {
 //       config.requestBodyIs = '{"title": "Welcome To Karate STG","STG body": "Karate Automation Framework","userId": 20}';
    }
    
    return config;
    }