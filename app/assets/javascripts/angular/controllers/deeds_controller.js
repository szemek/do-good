app.controller('DeedsController', ['$scope', '$resource', 'Restangular', function($scope, $resource, Restangular){
  Restangular.setRequestSuffix('.json')
  var Deed = Restangular.all('api/deeds');

  $scope.deed = {};
  $scope.steps = {question: true};

  $scope.nextStep = function() {
    $scope.steps = {captcha: true};
  };

  $scope.finish = function() {
    Deed.post($scope.deed).then(function(deed){
      $scope.steps = {thanks: true};
    });
  };
}]);
