app.controller('DeedController', ['$scope', '$resource', function($scope, $resource) {
  var Deed = $resource('/api' + window.location.pathname + '.json');

  Deed.get().$promise.then(function(data) {
    $scope.deed = data.deed;
    _.defer(function() {
      FB.XFBML.parse();
    });
  });
}]);
