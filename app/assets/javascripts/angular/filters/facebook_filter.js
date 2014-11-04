app.filter('facebook_url', ['$sce', function($sce){
  return function(input){
    var url = 'http://www.facebook.com/plugins/like.php?href=';
    url += encodeURIComponent(input);
    url += '&width&layout=button_count&action=like&show_faces=false&share=false&height=21&appId=512390572238099';
    return $sce.trustAsResourceUrl(url);
  };
}]);
