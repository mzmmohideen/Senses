var underscore = angular.module('underscore', []);
underscore.factory('_', function() {
    'use strict';
    return window._; // assumes underscore has already been loaded on the page
});
var app = angular.module('mohalla_user', ['ngCookies', 'ui.bootstrap', 'ngRoute', 'ui.select', 'underscore','ngSanitize']);
app.run(function($http, $cookies) {
    console.log($cookies.csrftoken,'csrrf')
    $http.defaults.headers.post['X-CSRFToken'] = $cookies.csrftoken;
});
app.directive('ngEnter', function() {
    return function(scope, element, attrs) {
        element.bind("keydown keypress", function(event) {
            if (event.which === 13) {
                scope.$apply(function() {
                    scope.$eval(attrs.ngEnter);
                });

                event.preventDefault();
            }
        });
    };
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
app.controller('MohallaUserCtrl', function($scope, _, $http, $location,$modal) {
    $scope.user_logout = function() {
        console.log('triger')
        window.location.href = '/logout_view/'
    }
    $scope.get_muhallaData = function() {
        $http.get('/get_mahallauser_data/',{}).success(function(response){
            $scope.muhalla_values = response.muhalla;
            $scope.getMasjidMember(response.muhalla)
            $scope.getFamilyinfo()
            console.log('scope',$scope.muhalla_values)
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
    $scope.FamilyValue = {
        familyid: '',
        masjid: '',
        ration_card: '',
        address: '',
        mobile: '',
        district: '',
        taluk: '',
        district_code: '',
        house: '',
        toilet: '',
        language: '',
        health_insurance: '', 
        family_needs: '', 
        financial: '',
    }
    $scope.get_family = function(family) {
        if(!family) {
            console.log(family,'family')
            $scope.family_val = 'Type or Select Family ID from the List';
            $scope.FamilyValue.familyid='';
            $scope.FamilyValue.ration_card = '';
            $scope.FamilyValue.mobile_no = '';
            $scope.FamilyValue.address = '';
            $scope.FamilyValue.house = '';
            $scope.FamilyValue.toilet = '';
            $scope.FamilyValue.financial = '';
            $scope.FamilyValue.language = '';
            $scope.FamilyValue.health_insurance = '';
            $scope.FamilyValue.family_needs = '';
        }
        else {
            $scope.family_val = family.family_id;
            $scope.FamilyValue.ration_card = family.ration_card;
            $scope.FamilyValue.mobile_no = family.mobile;
            $scope.FamilyValue.address = family.address;
            $scope.FamilyValue.house = family.house_type;
            if(family.toilet == true) { $scope.FamilyValue.toilet = 'Yes'; } else if(family.toilet == false) { $scope.FamilyValue.toilet = 'No'; }
            $scope.FamilyValue.financial = family.financial_status;
            $scope.FamilyValue.language = family.language;
            if(family.health_insurance == true) { $scope.FamilyValue.health_insurance = 'Yes'; } else if(family.health_insurance == false) { $scope.FamilyValue.health_insurance = 'No'; }
            $scope.FamilyValue.family_needs = family.family_needs;
            $scope.getFamilyMembers(family.family_id)
        }
    }
    $scope.addFamily = function(family,value,status) {
        if(status == 'new') {
            var familyid = '';
            var masjid = value.masjid.name;
        }
        else if(status == 'update') {
            var familyid = family;
            var masjid = value.masjid;
        }
        var data = {
            mobile_no: value.mobile_no,
            taluk: value.taluk,
            district: value.district,
            masjid: masjid,
            mohalla_id : value.masjid.mohalla_id,
            toilet: value.toilet,
            language: value.language,
            health_insurance: value.health_insurance,
            familyid: familyid,
            ration_card: value.ration_card,
            address: value.address,
            family_needs: value.family_needs,
            house: value.house,
            financial: value.financial,
        }
        $http.post('/familyData/',{
            value: data,
        }).success(function(data) {
            alert(data.data)
            $scope.get_family()
            $scope.getFamilyinfo();
        })
    }

    $scope.getFamilyinfo = function() {
        $scope.FamilyValue.masjid = $scope.muhalla_values.mohalla;
        $scope.FamilyValue.district = $scope.muhalla_values.district;
        $scope.FamilyValue.taluk = $scope.muhalla_values.taluk;
        console.log('get',$scope.FamilyValue)
        $http.get('/familyData/', {}).success(function(data) {
            console.log('varerror',data[2],$scope.FamilyValue.masjid)
            $scope.familyList = _.filter(data.data,function(data_val) { return data_val.taluk == $scope.FamilyValue.taluk && data_val.district_name == $scope.FamilyValue.district && data_val.muhalla == $scope.FamilyValue.masjid });
            
            console.log('val',$scope.familyList)
        })
    }
    $scope.getFamilyMembers = function(familyid) {
        console.log('value',familyid)
        $http.get('/FamilyMemberData/?family_id='+ familyid, {}).success(function(data) {
            $scope.FamilyMembersList = data;
            console.log(data,'voter')
        })
    }
})