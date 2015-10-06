var app = angular.module('mohalla_user', ['ngCookies', 'ngRoute']);
app.run(function($http, $cookies) {
    console.log($cookies.csrftoken,'csrrf')
    $http.defaults.headers.post['X-CSRFToken'] = $cookies.csrftoken;
});
app.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
        when('/dashboard', {
            templateUrl: 'dashboard.html',
        }).
        when('/muhalla', {
            templateUrl: 'muhalla.html',
        }).
        when('/family_members', {
            templateUrl: 'family_members.html',
        }).
        
        when('/settings', {
            templateUrl: 'settings.html',
        }).
        otherwise({
            redirectTo: '/dashboard'
        });
    }
]);
app.directive('ngConfirmClick', [
    function(){
        return {
            link: function (scope, element, attr) {
                var msg = attr.ngConfirmClick || "Are you sure?";
                var clickAction = attr.confirmedClick;
                element.bind('click',function (event) {
                    if ( window.confirm(msg) ) {
                        scope.$eval(clickAction)
                    }
                });
            }
        };
}])
app.controller('MohallaUserCtrl', function($scope, $http, $location) {
    $scope.user_logout = function() {
        console.log('triger')
        window.location.href = '/logout_view/'
    }
    $scope.get_muhallaData = function() {
        $http.get('/get_mahallauser_data/',{}).success(function(response){
            $scope.muhalla_values = response.muhalla;
            $scope.getMasjidMember(response.muhalla)
        })
    }
    $scope.get_muhallaData()
    $scope.updatemahalla = function(data) {
        $http.post('/add_masjid/',{
            district: data.district,
            taluk: data.taluk,
            masjid_name: data.mohalla,
            mohalla_id: data.mohalla_id,
            musallas: data.musallas,
            address: data.address,
            status: 'new',
        }).success(function(response) {
            alert(response.data)
            $scope.getMasjidMember(data)
        })
    }
    $scope.add_member = function(member_name,age,designation,mobile,address,status) {
        if(mobile == undefined) { var mobile_no = ''} else {var mobile_no = mobile}
        if(address == undefined) { var address_val = ''} else {var address_val = address}    
        var data = $scope.muhalla_values;
        $http.post('/masjid_member/',{
            member_name: member_name,
            data: data,
            age: age,
            designation: designation,
            mobile: mobile_no,
            address: address_val,
            status: status,
        }).success(function(response) {
            alert(response.data)
            $scope.getMasjidMember(data)
            console.log('response',response)
        })
    }
    $scope.UpdateMember = function(mohalla_id,member,name,age,designation,mobile,address) {
            console.log('valllll',mohalla_id,member,name,age,designation,mobile,address)
            $http.post('/masjid_member/',{
                mohalla_id: mohalla_id,
                data: member,
                name: name,
                age: age,
                designation: designation,
                mobile: mobile,
                address: address,
                status: 'edit',
            }).success(function(response) {
                alert(response.data)
            })
    }
    $scope.DeleteMember = function(mohalla_id,member) {
        $http.post('/masjid_member/',{
        mohalla_id: mohalla_id,
        data: member,
        status: 'delete',
        }).success(function(response) {
            alert(response.data)
            $http.get('/masjid_member/?masjid_id=' + mohalla_id).success(function(data){
                $scope.masjid_member_list = data.data;
            })
        })
    }
    $scope.getMasjidMember = function(masjid_data) {
        $http.get('/masjid_member/?masjid_id=' + masjid_data.mohalla_id).success(function(data){
            $scope.masjid_member_list = data.data;
        })
    }		
})