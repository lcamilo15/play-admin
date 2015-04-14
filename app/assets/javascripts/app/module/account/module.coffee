define ['angularAMD'], (angularAMD)->
  app = angular.module("app.module.account", ['ui.router'])

  states = [];

  states.push
    name: 'account'
    url: '/account'
    template:
      '<h1>Module1</h1><h4>This state was dynamically loaded from module1.js</h4>' +
      '<div>module1.js defines 3 nested states</div>' +
      '<div><a ui-sref=".authenticate">go to state1</a></div><div ui-view>Here we are</div>'

  states.push
    name : 'account.authenticate'
    url : '/authenticate'
    controller : [
      '$scope',
      ($scope)->
        console.log("Entered module1.state1 controller")
    ]
    template:'<h3>module1.state1</h3><div><a ui-sref=".nested">go to nested</a></div><div ui-view></div>'

  states.push
    name : 'account.authenticate.nested'
    url : '/nested'
    controllerURL : [
      '$scope',
      ($scope)->
        console.log("Entered module1.state1 controller")
    ]
    templateUrl: 'test.html'

  app.config(['$stateProvider', ($stateProvider) ->
      for state in states
        $stateProvider.state(state)
  ])

  return { states : states, module: app }

