define ['angularAMD'], (angularAMD)->
  app = angular.module('app.module.registration', ['ui.router'])

  states = [];

  states.push
    name : 'registration'
    url : '/registration'
    templateUrl : 'welcome.html'
    controller : ['$state', ($state) ->
      if ($state.current.name == 'registration')
        $state.go('registration.userInformation')
    ]
    data :
      pageTitle : 'Registration'

  states.push
    name : 'registration.userInformation'
    url : '/user_information'
    templateUrl : 'user_information.html'
    data :
      pageTitle : 'Please enter your information'

  states.push
    name : 'registration.confirmAccount'
    url : '/confirm_account'
    templateUrl : 'confirm_account.html'
    data :
      pageTitle : 'Confirm Account'

  states.push
    name : 'registration.accountCreated'
    url : '/account_created'
    templateUrl : 'account_created.html'

  app.config(['$stateProvider', ($stateProvider) ->
    for state in states
      $stateProvider.state(state)
  ])

  return { states : states, module: app }

