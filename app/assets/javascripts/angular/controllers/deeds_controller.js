app.controller('DeedsController', ['$scope', '$resource', 'Restangular', 'DeedsService', function($scope, $resource, Restangular, DeedsService){

  var deed = {
    happiness: 2
  };

  var goToQuestion = function() {
    $scope.deed = _.chain($scope.deed).pick('person').extend(deed).value();
    $scope.steps = {question: true};
    _.defer(function() {
      $scope.$apply();
    });
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
    Deed.post($scope.deed).then(function(deed) {
      $scope.steps = {thanks: true};

      _.delay(goToQuestion, 3000);

      DeedsService.fetch($scope, {page: 1}, function() {
        FB.XFBML.parse();
      });
    });
  };

  $scope.goToQuestion = goToQuestion;

  $scope.beHappy = function(happiness) {
    $scope.deed = _.extend($scope.deed, {happiness: happiness});
  };

  $scope.isHappy = function(happiness) {
    return $scope.deed.happiness == happiness;
  };

  $scope.setPage = function(page) {
    $scope.page = page;

    $('body,html').animate({
      scrollTop: $('.deeds').offset().top
    }, 800, function() {
      DeedsService.fetch($scope, {page: page}, function() {
        FB.XFBML.parse();
      });
    });
  };
}]);
