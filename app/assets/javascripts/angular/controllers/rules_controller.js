app.controller('RulesController', ['$scope', function($scope) {
  $scope.showRules = false;

  $scope.displayRules = function() {
    $scope.showRules = true;
    $('body').css({
      'overflow': 'hidden'
    });
  };

  $scope.hideRules = function() {
    $scope.showRules = false;
    $('body').css({
      'overflow': 'auto'
    });
  };
}]);
