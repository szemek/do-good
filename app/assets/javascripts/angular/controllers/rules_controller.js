app.controller('RulesController', ['$scope', function($scope){
  $scope.showRules = false;

  $scope.displayRules = function(){
    $scope.showRules = true;
  }

  $scope.hideRules = function(){
    $scope.showRules = false;
  }
}]);
