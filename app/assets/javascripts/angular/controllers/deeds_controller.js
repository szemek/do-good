app.controller('DeedsController', ['$scope', '$resource', 'Restangular', 'DeedsService', function($scope, $resource, Restangular, DeedsService){

  var deed = {
    happiness: 2
  };

  DeedsService.fetch($scope);

  $scope.deed = _.clone(deed);
  $scope.steps = {question: true};

  $scope.page = 1;
  $scope.maxSize = 5;
  $scope.bigCurrentPage = 1;

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
    $scope.deed = _.chain($scope.deed).pick('person').extend(deed).value();
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

  $scope.setPage = function (page) {
    $scope.page = page;

    DeedsService.fetch($scope, page);
  };
}]);
