define ['angularAMD'], (angularAMD)->
  app = angular.module("app.module.credential", ['ui.router'])

  states = [];

  states.push
    name : 'credential'
    url : '/credential'
    templateUrl : 'welcome.html'
    data :
      pageTitle : 'Welcome'

  states.push
    name : 'credential.authenticate'
    url : '/authenticate'
    templateUrl : 'authenticate.html'
    data :
      pageTitle : 'Enter Credentials'

  states.push
    name : 'credential.reset_password'
    url : '/reset_password'
    templateUrl : 'reset_password.html'
    data :
      pageTitle : 'Reset Password'

  app.config(['$stateProvider', ($stateProvider) ->
    for state in states
      $stateProvider.state(state)
  ])

  return { states : states, module: app }
