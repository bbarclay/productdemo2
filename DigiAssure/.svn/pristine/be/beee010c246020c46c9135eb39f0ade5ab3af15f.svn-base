/**
 * Created by gaudua on 4/1/2016.
 */
(function(){
    'use strict';

    angular.module('digiAssure.login', ['ngRoute', 'ui.router'])
        .config(['$stateProvider', '$urlRouterProvider', function ($stateProvider,  $urlRouterProvider) {

            $urlRouterProvider.otherwise("/login");

            $stateProvider
                .state('login', {
                    url: '/login',
                    templateUrl: '../views/login/login.jsp',
                    controller: 'LoginCtrl'
                })
        }]);
})(angular);