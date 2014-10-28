app.controller('DeedsController', ['$scope', '$resource', 'Restangular', 'DeedsService', function($scope, $resource, Restangular, DeedsService){

  DeedsService.fetch($scope);

  $scope.deed = {};
  $scope.steps = {question: true};

  $scope.goToCaptcha = function() {
    $scope.steps = {captcha: true};
  };

  $scope.goToThanks = function() {
    var Deed = Restangular.all('api/deeds.json');
    Deed.post($scope.deed).then(function(deed){
      $scope.steps = {thanks: true};
      DeedsService.fetch($scope);
    });
  };

  $scope.goToQuestion = function() {
    $scope.deed = _.pick($scope.deed, 'person');
    $scope.steps = {question: true};
  };

  $scope.beHappy = function(happiness){
    $scope.deed = _.extend($scope.deed, {happiness: happiness});
  };

  $scope.isHappy = function(happiness){
    return $scope.deed.happiness == happiness;
  };

  $scope.like = function(deed){
    var Deed = Restangular.all('api/deeds/' + deed.id + '/like.json');
    Deed.post().then(function(data){
      _.extend(deed, data.deed, {liked: true});
    });
  };

  $scope.unlike = function(deed){
    var Deed = Restangular.all('api/deeds/' + deed.id + '/unlike.json');
    Deed.post().then(function(data){
      _.extend(deed, data.deed, {liked: false});
    });
  };

  $scope.report = function(deed){
    var Deed = Restangular.all('api/deeds/' + deed.id + '/report.json');
    Deed.post().then(function(data){
      _.extend(deed, data.deed, {reported: true});
    });
  };
}]);
