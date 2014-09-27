app.controller('DeedsController', ['$scope', '$resource', function($scope, $resource){
  var Deed = $resource('/deeds/:id', {id:'@id'});

  $scope.deed = {};
  $scope.steps = {question: true};

  $scope.nextStep = function() {
    $scope.steps = {captcha: true};
  };

  $scope.finish = function() {
    var deed = new Deed($scope.deed);
    deed.$save(function(){
      $scope.steps = {thanks: true};
    });
  };
}]);
