app.factory('DeedsService', ['$resource', function($resource){
  var beginningOfDay = function(timestamp){
    var date = new Date(timestamp);
    date.setHours(0);
    date.setMinutes(0);
    date.setSeconds(0);
    return date.valueOf();
  };

  var sortDescByTimestamp = function(collection) {
    return _.sortBy(collection, function(item) { return -item.timestamp; });
  };

  var groupByBeginningOfDay = function(collection) {
    return _.groupBy(collection, function(item) {
      return beginningOfDay(item.timestamp);
    });
  };

  return {
    fetch: function($scope){
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

      var DeedCount = $resource('api/deeds/count.json');
      DeedCount.get().$promise.then(function(data){
        $scope.digits = data.count.toString().split('');
      });
    }
  };
}]);
