/**
 * Created by gaudua on 4/1/2016.
 */

(function () {

    'use strict';

    angular.module('digiAssure.login')
        .controller('LoginCtrl', LoginController);

    LoginController.$inject = [ '$scope', '$state'];

    function LoginController($scope, $state){

        $scope.email;
        $scope.password;
        
        $scope.login = login;

        function login(){
            localStorage.setItem('loginId', $scope.email);
            $state.go('landing_new');
        }
    };

    //window.screen.lockOrientation('portrait');

})();

