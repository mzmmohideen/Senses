var app = angular.module('home',[])
app.directive('ngEnter', function() {
        return function(scope, element, attrs) {
            element.bind("keydown keypress", function(event) {
                if(event.which === 13) {
                        scope.$apply(function(){
                                scope.$eval(attrs.ngEnter);
                        });
                        
                        event.preventDefault();
                }
            });
        };
}); 
app.controller('homeCtrl',function($scope,$http,$location) {
    $scope.staff_name = '';
 


    var request = window.indexedDB.open("attendance");
    request.onsuccess = function() {
      db = request.result;
      var tx = db.transaction("login", "readonly");
        var req = tx.objectStore("login").openCursor();
        req.onsuccess = function(event) {
            var cursor = req.result.value;
            $scope.staff_name = cursor.uname;        
            console.log('name', $scope.staff_name)
            $scope.$apply();    
        }
    }


})