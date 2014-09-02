var app = angular.module('do-good', []);

app.controller('FormController', ['$scope', function($scope){
  $scope.deed = {};

  $scope.addDeed = function(deed) {
    $scope.deed = {};
  };
}])
