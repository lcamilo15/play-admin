define 'app', ['angular', 'bootstrap', 'ui-router-extras'] , (angular) ->

  configApp = ($stateProvider, $futureStateProvider, $controllerProvider) ->
    console.log("the config", $stateProvider, $futureStateProvider, $controllerProvider)

  runningApp = ($injector, $rootScope, $state, $window, $timeout, $http ) ->
    console.log("the running app", $injector, $rootScope, $state, $window, $timeout, $http)

  angular.module('app', ['ui.router', 'ct.ui.router.extras'])
  .config(['$stateProvider', '$futureStateProvider', '$controllerProvider', configApp])
  .run(['$injector', '$rootScope', '$state', '$window', '$timeout', '$http', runningApp])