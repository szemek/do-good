app.filter('ordinal', function(){
  return function(input){
    var number = parseInt(input, 10);
    var suffixes = ["th","st","nd","rd"];
    var remainder = number % 100;
    var suffix = suffixes[(remainder-20)%10] || suffixes[remainder] || suffixes[0];
    return suffix;
  };
});
