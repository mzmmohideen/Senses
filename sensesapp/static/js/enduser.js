var underscore = angular.module('underscore', []);
underscore.factory('_', function() {
    'use strict';
    return window._; // assumes underscore has already been loaded on the page
});
var app = angular.module('end_user', ['ngCookies', 'ui.bootstrap', 'ngRoute', 'ui.select', 'underscore','ngSanitize']);
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
        // when('/family_members', {
        //     templateUrl: 'family_members.html',
        // }).
        when('/reports', {
            templateUrl: 'reports.html',
        }).
        when('/settings', {
            templateUrl: 'settings.html',
        }).
        otherwise({
            redirectTo: '/dashboard'
        });
    }
]);
app.controller('EndUserCtrl', function($scope, _, $http, $location,$modal) {
    $scope.user_logout = function() {
        window.location.href = '/logout_view/'
    }
    $scope.get_muhallaData = function() {
        $http.get('/get_mahallauser_data/',{}).success(function(response){
            $scope.muhalla_values = response.muhalla;
            $scope.getMasjidMember(response.muhalla)
        })
    }
    $scope.get_muhallaData()
    $scope.getMasjidMember = function(masjid_data) {
        $http.get('/masjid_member/?masjid_id=' + masjid_data.mohalla_id).success(function(data){
            $scope.masjid_member_list = data.data;
        })
    }
    $scope.get_password = {
        curr_password : '',
        re_password : '',
        password : '',
    }
    $scope.change_password = function(uname,data_val) {
        $http.post('/change_password/',{
            username: uname,
            password: data_val.curr_password,
            change_pwd: data_val.re_password,
            status: 'edit',
        }).success(function(data){
            alert(data.data)
            $scope.get_password.curr_password = ''
            $scope.get_password.re_password = ''
            $scope.get_password.password = ''
        })
    }
    $scope.senses_reports = ['Mohalla Report','Total Family Details','Families Eligible for Jakaath','Medical Needs and Guidance Needers Details','Government Schemes and Guidance Needers Details','Government Voter ID Needers','Educational Help and Guidance Needers List','Help for Discontinued and Guidance Needers List','Basic Help Needers List','Help for Poor Peoples and Guidance Needers List','Training/Employment Help and Guidance Needers List','Childrens Need to join Makthab Madarasa','Persons Need to join Jumrah Madarasa','Women chldrens Need to join Niswan Madarasa']
    $scope.getFamilyReport = function(fam_data,report_name) {
        console.log('report_name',fam_data,report_name)
        $http.get('/fetchReportData/?muhalla_id='+fam_data.mohalla_id,{}).success(function(data){
            if(report_name == 'Mohalla Report') {
                $scope.ReportHeader = ['S.No','Details','Counts']
                $scope.getReportData = data.reports;
            }
            else if(report_name == 'Total Family Details') {
                $scope.ReportHeader = ['S.No','Name & Address','Age & Gender','Family ID & Mobile NO','Financial Status & Jakaath']
                $scope.getReportData = data.get_family;
            }
            else if(report_name == 'Families Eligible for Jakaath' || report_name == 'Government Voter ID Needers') {
                $scope.ReportHeader = ['S.No','Needers Name','Age & Gender','Financial Status & Family ID','Mobile NO','Address']
                if(report_name == 'Families Eligible for Jakaath') {
                    $scope.getReportData = _.filter(data.get_family,function(val){ return val.financial_status.split(' ')[0] == 'D' || val.financial_status.split(' ')[0] == 'E'});
                }
                else if(report_name == 'Basic Help Needers List') {
                    $scope.getReportData = _.filter(data.get_family,function(val){ return val.financial_status.split(' ')[0] == 'E'});
                }
                else if(report_name == 'Government Voter ID Needers') {
                    console.log('voter',data.get_memdata)
                    $scope.getReportData = _.filter(data.get_memdata,function(val){ return val.voter == false && parseInt(val.age) >= 18});
                }                
            }
            else if(report_name == 'Educational Help and Guidance Needers List' || report_name == 'Help for Discontinued and Guidance Needers List') {
                $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                if(report_name == 'Educational Help and Guidance Needers List') {
                    $scope.getReportData = _.filter(data.get_mem_scheme,function(val){ return val.needs == 'Help for Higher Education/ Guidance Needed' && val.status == true});
                }
                else if(report_name == 'Help for Discontinued and Guidance Needers List') {
                    $scope.getReportData = _.filter(data.get_mem_scheme,function(val){ return val.status == true && val.needs == 'Help for Education Discontinued/Guidance Needed'});
                }                
            }
            else if(report_name == 'Medical Needs and Guidance Needers Details' || report_name == 'Government Schemes and Guidance Needers Details') {
                $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                if(report_name == 'Medical Needs and Guidance Needers Details') {
                    $scope.getReportData = data.get_mem_medical;
                }
                else if(report_name == 'Government Schemes and Guidance Needers Details') {
                    $scope.getReportData = data.get_mem_scheme;
                }
            }
            else if(report_name == 'Persons Need to join Jumrah Madarasa' || report_name == 'Childrens Need to join Makthab Madarasa'  || report_name == 'Women chldrens Need to join Niswan Madarasa') {
                $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                if(report_name == 'Persons Need to join Jumrah Madarasa') {
                    $scope.getReportData = _.filter(data.get_memData,function(val) {return val.makthab == true && val.makthab_status == 'Jumrah Madarasa for Boys'});
                }
                else if(report_name == 'Childrens Need to join Makthab Madarasa') {
                    $scope.getReportData = _.filter(data.get_memData,function(val) {return val.makthab == true && val.makthab_status == 'Boys For Makthab 4-15'});
                }
                else if(report_name == 'Women chldrens Need to join Niswan Madarasa') {
                    $scope.getReportData = _.filter(data.get_memData,function(val) {return val.makthab == true && val.makthab_status == 'Girls For Makthab 4-15'});
                }
            }
        })
    }
})