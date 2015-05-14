app.factory('DeedsService', ['$resource', function($resource) {
  return {
    fetch: function($scope, params, callback) {
      var Deed = $resource('api/deeds.json');
      params = params || {page: 1};
      Deed.get(params).$promise.then(function(data) {
        $scope.deeds = data.deeds;

        if (callback !== undefined) {
          _.defer(callback);
        }
      });

      var DeedCount = $resource('api/deeds/count.json');
      DeedCount.get().$promise.then(function(data) {
        $scope.digits = data.count.toString().split('');
        $scope.totalItems = data.count;
      });
    }
  };
}]);
