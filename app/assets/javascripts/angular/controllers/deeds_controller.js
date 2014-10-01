app.controller('DeedsController', ['$scope', '$resource', 'Restangular', 'DeedsService', function($scope, $resource, Restangular, DeedsService){

  DeedsService.fetch($scope);

  $scope.deed = {};
  $scope.steps = {question: true};

  $scope.nextStep = function() {
    $scope.steps = {captcha: true};
  };

  $scope.finish = function() {
    var Deed = Restangular.all('api/deeds.json');
    Deed.post($scope.deed).then(function(deed){
      $scope.steps = {thanks: true};
      DeedsService.fetch($scope);
    });
  };
}]);
