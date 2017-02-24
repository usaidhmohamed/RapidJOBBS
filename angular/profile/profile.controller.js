(function () {
    'use strict';

    angular
        .module('app')
        .controller('ProfileController', ProfileController);

    ProfileController.$inject = ['UserService', '$location', '$rootScope', 'FlashService'];
    function ProfileController(UserService, $location, $rootScope, FlashService) {
        var vm = this;

        vm.update = update;

        function update() {
            vm.dataLoading = true;
            UserService.Update(vm.user.id, vm.user)
                .then(function (response) {
                    if (response.success) {
                        FlashService.Success('Update successful', true);
                        $location.path('/home');
                    } else {
                        FlashService.Error(response.message);
                        vm.dataLoading = false;
                    }
                });
        }
    }

})();
