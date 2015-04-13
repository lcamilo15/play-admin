define 'app', ['angular', 'bootstrap', 'ui-router-extras'] , (angular) ->

  configApp = ($stateProvider, $futureStateProvider, $controllerProvider)->
    console.log(arguments)

  runningApp = ($injector, $rootScope, $state, $window, $timeout, $http ) ->
    console.log(arguments)

  angular.module('app', ['ui.router', 'ct.ui.router.extras']).config(configApp).run(runningApp)
