app.factory('DeedsService', ['$resource', function($resource){
  return {
    fetch: function($scope){
      var sortDescByTimestamp = function(collection) {
        return _.sortBy(collection, function(item) { return -item.timestamp; });
      };

      var groupByBeginningOfDay = function(collection) {
        return _.groupBy(collection, function(item) {
          var date = new Date(item.timestamp);
          date.setHours(0);
          date.setMinutes(0);
          date.setSeconds(0);
          return date.valueOf();
        });
      }

      var Deed = $resource('api/deeds.json');
      Deed.get().$promise.then(function(data) {
        var collection = groupByBeginningOfDay(data.deeds);
        collection = _.map(collection, function(values, key) {
          return {
            timestamp: key,
            deeds: sortDescByTimestamp(values)
          };
        });

        $scope.collection = sortDescByTimestamp(collection);
      });
    }
  };
}]);
