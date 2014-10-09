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

  $scope.like = function(deed){
    var Deed = Restangular.all('api/deeds/' + deed.id + '/like.json');
    Deed.post().then(function(data){
      _.extend(deed, data.deed, {liked: true});
    });
  };

  $scope.report = function(deed){
    var Deed = Restangular.all('api/deeds/' + deed.id + '/report.json');
    Deed.post().then(function(data){
      _.extend(deed, data.deed, {reported: true});
    });
  };
}]);
