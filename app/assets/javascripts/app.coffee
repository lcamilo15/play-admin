define 'app', ['angularAMD', 'text!config/future_state.json', 'bootstrap', 'angular-ui-router', 'ct-ui-router-extras.future'] , (angularAMD, futureState) ->

  app = angular.module('app', ['ct.ui.router.extras.future'])

  app.config [
    '$futureStateProvider',
    ($futureStateProvider) ->

      #Load pending future state /
      $futureStateProvider.stateFactory('ngload', ['$q', 'futureState', ($q, futureState) ->

        ngloadDeferred = $q.defer()
        ngRequireURL = requirejs.toUrl(futureState.src)
        baseUrl = ngRequireURL.replace(/\/\w+$/, '/')

        require([ "ngload!" + ngRequireURL + '.js', 'angularAMD'], (loadedModule,  angularAMD) ->
            angularAMD.processQueue()

            #TODO : Handle nested views here
            angular.forEach(loadedModule.states, (state)->
              if (state.templateUrl)
                state.templateUrl = baseUrl + 'views/' + state.templateUrl
            )

            ngloadDeferred.resolve(null)
        )
        ngloadDeferred.promise
      ])

      #Register future states
      $futureStateProvider.addResolve(() -> angular.forEach(eval(futureState), (fstate) -> $futureStateProvider.futureState(fstate)) )
  ]

  app.run [ '$rootScope', '$state', ($rootScope, $state) ->  $rootScope.$state = $state ]

  return app