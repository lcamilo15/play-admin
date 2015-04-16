define ['angularAMD'], (angularAMD)->
  app = angular.module('app.module.account', ['ui.router'])

  states = [];

  states.push
    name : 'account'
    url : '/account'
    templateUrl : 'welcome.html'

  app.config(['$stateProvider', ($stateProvider) ->
      for state in states
        $stateProvider.state(state)
  ])

  return { states : states, module: app }

