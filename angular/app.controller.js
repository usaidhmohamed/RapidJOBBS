(function () {
    'use strict';

    angular
        .module('app')
        .controller('appController', appController);

    appController.$inject = ['$rootScope'];
    function appController($rootScope) {
        var vm = this;
        vm.isAuthenticated = false;

        vm.navigationLinks = [
        {
          name: 'Home',
          state: '/'
        },
        {
          name: 'Login',
          state: 'login'
        }
      ];

      vm.authenticatednavigationLinks= [
        {
          name: 'Register',
          state: 'register'
        },
        {
          name: 'Profile',
          state: 'profile'
        }
      ];

    }

})();