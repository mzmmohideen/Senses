var underscore = angular.module('underscore', []);
underscore.factory('_', function() {
    'use strict';
    return window._; // assumes underscore has already been loaded on the page
});
var app = angular.module('senses', ['ngSanitize', 'ngCookies', 'ui.bootstrap', 'ngRoute', 'ui.select', 'underscore']);
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

app.service('masjid_data', function($rootScope) {
    var data = [];
    this.get_MasjidData = function() {
        return data;
    };
    this.set_MasjidData = function(masjid_data) {
        data = masjid_data;
    };

});

app.filter('propsFilter', function() {
    return function(items, props) {
        var out = [];
        if (angular.isArray(items)) {
            items.forEach(function(item) {
                var itemMatches = false;
                var keys = Object.keys(props);
                for (var i = 0; i < keys.length; i++) {
                    var prop = keys[i];
                    var text = props[prop].toLowerCase();
                    if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
                        itemMatches = true;
                        break;
                    }
                }
                if (itemMatches) {
                    out.push(item);
                }
            });
        } else {
            // Let the output be the input untouched
            out = items;
        }
        return out;
    }
});
app.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
        when('/dashboard', {
            templateUrl: 'dashboard.html',
        }).
        when('/location', {
            templateUrl: 'location.html',
        }).
        when('/masjid', {
            templateUrl: 'masjid.html',
        }).
        when('/family', {
            templateUrl: 'family.html',
        }).
        when('/schemes', {
            templateUrl: 'schemes.html',
        }).
        when('/services', {
            templateUrl: 'services.html',
        }).
        when('/diseases', {
            templateUrl: 'diseases.html',
        }).
        when('/reports', {
            templateUrl: 'reports.html',
        }).
        otherwise({
            redirectTo: '/dashboard'
        });
    }
]);
app.directive('fileModel', ['$parse', function($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            element.bind('change', function() {
                scope.$apply(function() {
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
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
app.controller('dashboardCtrl', function($scope,_, $http,masjid_data, $location,$modal) {
    $scope.group_value="Select the Group in the list or Enter New...";
    $scope.get_group = function(prog,sem) {
        console.log('program',prog,sem,$scope.group_data)
        $scope.group_list = [];       
        for(var i in $scope.group_data) {
            if($scope.group_data[i].program == prog.name && $scope.group_data[i].semester == sem) {
                $scope.group_list.push($scope.group_data[i].name)
                // console.log('program',$scope.group_list)
            }    
        }
    }
    $scope.scheme_val = 'SELECT or ADD SCHEMES';
    $scope.get_scheme = function(scheme) {
        if(!scheme) {
            $scope.scheme_val = 'SELECT or ADD SCHEMES';
        }
        else {
            console.log('val',scheme)
            $scope.scheme_val = scheme;
        }
    }
    $scope.sub_scheme_val = 'SELECT or ADD SUB SCHEME';
    $scope.get_sub_scheme = function(scheme) {
        console.log('val1',typeof(scheme))
        if(!scheme) {
            $scope.sub_scheme_val = 'SELECT or ADD SUB SCHEME';
        }
        else if(typeof(scheme) == 'string') {
            $scope.sub_scheme_val = scheme;
        }
        else if(typeof(scheme) == 'object') {
            $scope.sub_scheme_val = scheme.sub;
        }
        console.log('val',$scope.sub_scheme_val)
    }
    $scope.getScheme = function() {
        $http.get('/SchemeData/',{}).success(function(data) {
            $scope.scheme_list = _.keys(data.data)
            $scope.getSubScheme = data.data;
        })
    }
    $scope.service_val = 'SELECT or ADD SERVICES';
    $scope.get_service = function(service) {
        if(!service) {
            $scope.service_val = 'SELECT or ADD SERVICES';
        }
        else {
            $scope.service_val = service;
        }
        console.log('service_val',$scope.service_val)
    }
    $scope.getService = function() {
        $http.get('/ServiceData/',{}).success(function(data) {
            console.log('datascheme',data)
            $scope.service_list = _.pluck(data.data,"service")
            $scope.getServices = data.data;
        })
    }
    $scope.district_val = 'SELECT DISTRICT';
    $scope.get_district = function(district) {
        if(!district) {
            $scope.district_val = 'SELECT DISTRICT';
            $scope.district_code = ''
        }
        else {
            console.log('val',district)
            $scope.district_val = district;
            if($scope.DisCode[district][0]) {
                console.log('dis$scope.DisCode',$scope.DisCode[district][0])
                $scope.district_code = $scope.DisCode[district][0]
            }
            else {
                console.log('Elsesdis$scope.DisCode',district)
                $scope.district_code = ''
            }

        }
    }
    $scope.editTaluk = function(district_val,taluk,tot_taluk,index,status) {
        console.log(district_val,taluk,tot_taluk[district_val][index])
        $http.post('/addLocation/',{
            district : district_val,
            edit_taluk : taluk,
            taluk : tot_taluk[district_val][index],
            status : status,
        }).success(function(response){
            alert(response.data)
            $scope.getLocation()
        })
    }
    $scope.DiseaseVal = {
        sym_type: '',
        name: '',
        description: '',
    }
    $scope.disease_val = 'SELECT or ADD DISEASE';
    $scope.get_disease = function(disease) {
        console.log('val',disease)
        if(!disease) {
            $scope.disease_val = 'SELECT or ADD DISEASE';
        }
        else {
            $scope.disease_val = disease;
        }
    }
    $scope.getDisease = function(sym_type) {
        console.log('sym_type',sym_type)
        $http.get('/DiseaseData/?type='+sym_type,{}).success(function(data) {
            $scope.disease_list = _.pluck(data.response,"name")
            $scope.getDiseaseData = data.response;
            console.log($scope.getDiseaseData)
        })
    }
    $scope.deleteDisease = function(value) {
        console.log('delete',value)
        $http.get('/DiseaseData/?disease='+value.name,{}).success(function(data) {
            alert(data.response)
            $scope.getDisease(value.type)
            console.log('val',data)
        })
    }
    $scope.add_disease = function(disease_val,data) {
        var symptom_type = data.sym_type;
        console.log('value',symptom_type)
        $http.post('/DiseaseData/',{
            sym_type: symptom_type,
            description: data.description,
            disease: disease_val, 
        }).success(function(data){
            alert(data.response)
            $scope.getDisease(symptom_type)
            console.log('value',data)
        })
    }
    $scope.scheme_values = {
        scheme: '',
        sub_scheme: '',
        field: '',
        condition: '',
        scheme_id: '',
        description: '',
        value: '',
        apply: '',
    }
    $scope.field_list = ['Age','Marital Status','Gender','Qualification','Voter ID','Physically Challenged','RelationShip','Occupation']
    $scope.condition_list = function(field) {
        if(field == 'Age' || field == 'Qualification') {
            $scope.conditionsData = ['<=','>=','=','>','<','!=']
        }
        else if(field == 'Marital Status' || field == 'Gender' || field == 'Voter ID' || field == 'Physically Challenged' || field == 'RelationShip' || field == 'Occupation') {
            $scope.conditionsData = ['=','!=']
        }
        if(field == 'Marital Status') {
            $scope.getValue = ['Married','Unmarried','Widow','Devorced','Aged Unmarried Woman']
        }
        else if(field == 'Gender') {
            $scope.getValue = ['Male','Female']
        }
        else if(field == 'Physically Challenged' || field == 'RelationShip') {
            $scope.getValue = ['Yes','No']
        }
        else {
            console.log('var',field)
            $scope.get_val()
            $scope.scheme_values.value = ''
            $scope.getValue = []
        }
        
    }
    $scope.taluk_val = 'SELECT TALUK';
    $scope.get_taluk = function(taluk) {
        if(!taluk) {
            $scope.taluk_val = 'SELECT TALUK';
        }
        else {
            $scope.taluk_val = taluk;
        }
    }
    $scope.masjid_val = '';
    $scope.get_masjid = function(masjid) {
        if(!masjid) {
            $scope.masjid_val = 'Select mahalla ID from the List';
        }
        else {
            $scope.masjid_val = masjid;
            $scope.getMasjidData($scope.masjid_val);
        }
    }
    $scope.value = '';
    $scope.get_val = function(val) {
        if(!val) {
            $scope.value = 'Select or Enter Value'
        }
        else {
            $scope.value = val;
        }

    }
    $scope.MasjidAddValue = {
        masjid_name: '',
        musallas: '',
        district: '',
        taluk: '',
        address: '',
    }
    $scope.mahallaList = [];
    $scope.getMasjidData = function(masjid_val) {
        $http.get('/add_masjid/').success(function(data){
            $scope.mahallaList = data.data;
            // $scope.masjidList = _.pluck(data.data,"mohalla_id")
            if(!masjid_val) {
                $scope.MasjidAddValue.masjid_name = '';
                $scope.MasjidAddValue.mohalla_id = '';
                $scope.MasjidAddValue.musallas = '';
                // $scope.MasjidAddValue.district = '';
                // $scope.MasjidAddValue.taluk = '';
                $scope.MasjidAddValue.address = '';
            }
            else {
                $scope.getMasjidListData = _.filter(data.data,function(num) { return num.mohalla_id==masjid_val})
                $scope.MasjidAddValue.mohalla_id = $scope.getMasjidListData[0].mohalla_id;
                $scope.MasjidAddValue.masjid_name = $scope.getMasjidListData[0].name;
                $scope.MasjidAddValue.musallas = $scope.getMasjidListData[0].musallas;
                $scope.MasjidAddValue.district = $scope.getMasjidListData[0].district;
                $scope.MasjidAddValue.taluk = $scope.getMasjidListData[0].taluk;
                $scope.MasjidAddValue.address = $scope.getMasjidListData[0].location;
                $scope.getMasjidMember($scope.MasjidAddValue);
            }
        })
    }
    $scope.getMasjidList = function(data) {
        console.log('mahalla',$scope.mahallaList)
        console.log('dataMasjid',data)
        $scope.ReportValues.muhalla = '';
        $scope.masjidList = _.pluck(_.filter($scope.mahallaList,function(num) {return num.district == data.district && num.taluk == data.taluk}),"mohalla_id")
        $scope.muhallaList = _.filter($scope.mahallaList,function(num) {return num.district == data.district && num.taluk == data.taluk})
        console.log('val',$scope.masjidList)
    }
    $scope.report_value_change = function() {
        console.log('valchange')
        $scope.ReportValues.district = ''
        $scope.ReportValues.taluk = ''
        $scope.ReportValues.muhalla = ''
        $scope.ReportValues.muhalla.mohalla_id = ''
        $scope.ReportHeader = []
        $scope.getReportData = []
    }
    $scope.getFamilyReport = function(fam_data) {
        console.log('value',fam_data.report_name)
        $http.get('/fetchReportData/?muhalla_id='+fam_data.muhalla.mohalla_id,{}).success(function(data){
        // $http.get('/fetchReportData/?muhalla_id='+data.muhalla.mohalla_id+'&report_name='+data.report_name,{}).success(function(data){
            // 'Government Schemes and Guidance Needers Details(Non Voters)','Basic Help Needers List','Help for Poor Peoples and Guidance Needers List','Training/Employment Help and Guidance Needers List','Childrens Need to join Makthab Madarasa','Persons Need to join Jumrah Madarasa','Women chldrens Need to join Niswan Madarasa']
            if(fam_data.report_name == 'Mohalla Report') {
                $scope.ReportHeader = ['S.No','Details','Counts']
                $scope.getReportData = data.reports;
            }
            else if(fam_data.report_name == 'Total Family Details') {
                $scope.ReportHeader = ['S.No','Name & Address','Age & Gender','Family ID & Mobile NO','Financial Status & Jakaath']
                $scope.getReportData = data.get_family;
            }
            else if(fam_data.report_name == 'Families Eligible for Jakaath' || fam_data.report_name == 'Government Voter ID Needers') {
                $scope.ReportHeader = ['S.No','Needers Name','Age & Gender','Financial Status & Family ID','Mobile NO','Address']
                if(fam_data.report_name == 'Families Eligible for Jakaath') {
                    $scope.getReportData = _.filter(data.get_family,function(val){ return val.financial_status.split(' ')[0] == 'D' || val.financial_status.split(' ')[0] == 'E'});
                }
                else if(fam_data.report_name == 'Basic Help Needers List') {
                    $scope.getReportData = _.filter(data.get_family,function(val){ return val.financial_status.split(' ')[0] == 'E'});
                }
                else if(fam_data.report_name == 'Government Voter ID Needers') {
                    console.log('voter',data.get_memdata)
                    $scope.getReportData = _.filter(data.get_memdata,function(val){ return val.voter == false && parseInt(val.age) >= 18});
                }                
            }
            else if(fam_data.report_name == 'Educational Help and Guidance Needers List' || fam_data.report_name == 'Help for Discontinued and Guidance Needers List') {
                $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                if(fam_data.report_name == 'Educational Help and Guidance Needers List') {
                    $scope.getReportData = _.filter(data.get_mem_scheme,function(val){ return val.needs == 'Help for Higher Education/ Guidance Needed' && val.status == true});
                }
                else if(fam_data.report_name == 'Help for Discontinued and Guidance Needers List') {
                    $scope.getReportData = _.filter(data.get_mem_scheme,function(val){ return val.status == true && val.needs == 'Help for Education Discontinued/Guidance Needed'});
                }                
            }
            else if(fam_data.report_name == 'Medical Needs and Guidance Needers Details' || fam_data.report_name == 'Government Schemes and Guidance Needers Details') {
                $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                if(fam_data.report_name == 'Medical Needs and Guidance Needers Details') {
                    $scope.getReportData = data.get_mem_medical;
                }
                else if(fam_data.report_name == 'Government Schemes and Guidance Needers Details') {
                    $scope.getReportData = data.get_mem_scheme;
                }
            }
            else if(fam_data.report_name == 'Persons Need to join Jumrah Madarasa' || fam_data.report_name == 'Childrens Need to join Makthab Madarasa'  || fam_data.report_name == 'Women chldrens Need to join Niswan Madarasa') {
                $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                if(fam_data.report_name == 'Persons Need to join Jumrah Madarasa') {
                    $scope.getReportData = _.filter(data.get_memData,function(val) {return val.makthab == true && val.makthab_status == 'Jumrah Madarasa for Boys'});
                }
                else if(fam_data.report_name == 'Childrens Need to join Makthab Madarasa') {
                    $scope.getReportData = _.filter(data.get_memData,function(val) {return val.makthab == true && val.makthab_status == 'Boys For Makthab 4-15'});
                }
                else if(fam_data.report_name == 'Women chldrens Need to join Niswan Madarasa') {
                    $scope.getReportData = _.filter(data.get_memData,function(val) {return val.makthab == true && val.makthab_status == 'Girls For Makthab 4-15'});
                }
            }
            console.log('data',$scope.getReportData)
            // $scope.getReportData = data.reports;
            console.log('reportdata',$scope.getReportData)
        })
    }
    $scope.get_jakaath_status = function(financial) {
        if(financial == 'A' || financial == 'B' || financial == 'C') { return 'NO' }
        else if(financial == 'D' || financial == 'E') { return 'YES' }
    }
    $scope.getMasjidMember = function(data) {
        console.log('masjid_member',data)
        $http.get('/masjid_member/?masjid_id=' + data.mohalla_id).success(function(data){
        // $http.get('/masjid_member/?masjid=' + data.masjid_name+'&taluk='+data.taluk+'&district='+ data.district).success(function(data){
            $scope.masjid_member_list = data.data;
            console.log('data',data)
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
    $scope.addMasjid = function(masjid,data,status) {
        console.log(data,masjid)
        if(data.mohalla_id == "") {
            var masjid_val = masjid
        }
        else {
            var masjid_val = data.mohalla_id
        }
        console.log('masjid',masjid,'a',data,'b',masjid_val)
        $http.post('/add_masjid/',{
            district: data.district,
            taluk: data.taluk,
            masjid_name: data.masjid_name,
            mohalla_id: masjid_val,
            musallas: data.musallas,
            address: data.address,
            status: status,
        }).success(function(data) {
            console.log('val',data)
            alert(data.data)
            $scope.new_masjid=false;
            $scope.getMasjidData()
        })
    }
    $scope.add_location = function(district,district_code,taluk) {
        console.log('val',district,'taluk',taluk)
        $http.post('/addLocation/',{
            district: district,
            district_code: district_code,
            taluk: taluk,
            status : 'new',
        }).success(function(data) {
            console.log('data',data)
            alert(data.data)
            $scope.getLocation();
        })
    }
    $scope.add_schemes = function(scheme,sub,scheme_values) {
        console.log('val',scheme,'taluk',sub,'scheme_values',scheme_values.scheme_id)
        $http.post('/SchemeData/',{
            scheme: scheme,
            sub: sub,
            field: scheme_values.field,
            scheme_id: scheme_values.scheme_id,
            description: scheme_values.description,
            condition: scheme_values.condition,
            value: scheme_values.value,
            apply: scheme_values.apply,
        }).success(function(data) {
            console.log('data',data)
            alert(data.data)
            $scope.get_scheme(scheme)
            $scope.get_sub_scheme()
            $scope.scheme_values.scheme_id = ''
            // window.location.reload()
            $scope.getLocation();
        })
    }
    $scope.add_service = function(service,service_id,description) {
        console.log('mahalla',service,description)
        if(description) { var desc = description; } else { var desc = '' }
        var data = {
            service : service,
            service_id : service_id,
            description : desc,
        }
        $http.post('/ServiceData/',{
            data: data,
        }).success(function(data){
            alert(data.data)
            $scope.getService()
            console.log('data',data)
        })
    }
    $scope.delete_service = function(service) {
        console.log('???',service)
        $http.get('/ServiceData/?del_ser='+service,{}).success(function(response){
            alert(response.data)
            $scope.getService()
            console.log('response',response)
        })
    }
    $scope.getMahallaData = function(val) {
        $scope.muhallaData = _.filter($scope.mahallaList, function(data){ return data.district == val.district && data.taluk == val.taluk })
        console.log('mahalla',$scope.muhallaData)
    }
    $scope.senses_reports = ['Mohalla Report','Total Family Details','Families Eligible for Jakaath','Medical Needs and Guidance Needers Details','Government Schemes and Guidance Needers Details','Government Voter ID Needers','Educational Help and Guidance Needers List','Help for Discontinued and Guidance Needers List','Basic Help Needers List','Help for Poor Peoples and Guidance Needers List','Training/Employment Help and Guidance Needers List','Childrens Need to join Makthab Madarasa','Persons Need to join Jumrah Madarasa','Women chldrens Need to join Niswan Madarasa']
    // ,'தொகுப்பு அறிக்கை'
    $scope.getLocation = function() {
        $http.get('/addLocation/',{}).success(function(data) {
            // console.log('val',data.district)
            $scope.DisCode = data.district;
            $scope.district_list = _.keys(data.district)
            $scope.getTaluk = data.data;
        })
    }
    $scope.ReportValues = {
        district : '',
        taluk : '',
        muhalla : '',
        muhalla_id : '',
        report_name : '',      
    }

    $scope.add_members = function(data) {
        console.log('masjid_data',data)
        masjid_data.set_MasjidData(data);
        var modalInstance = $modal.open({
            templateUrl: 'add_members_modal',
            controller: add_members_ctrl,
            backdrop: 'true',
        });
    }
    var add_members_ctrl=function($scope,$http,masjid_data,$rootScope,$timeout,$location,$modalInstance) {
        $scope.cancel = function() {
            $modalInstance.dismiss('cancel');
        };
        var data = masjid_data.get_MasjidData();
        $scope.add_member = function(member_name,age,designation,mobile,address,status) {
            console.log('member_name',member_name,data)
            if(mobile == undefined) { var mobile_no = ''} else {var mobile_no = mobile}
            if(address == undefined) { var address_val = ''} else {var address_val = address}    
            console.log('member_name',mobile_no,address_val)
            $http.post('/masjid_member/',{
                member_name: member_name,
                data: data,
                age: age,
                designation: designation,
                mobile: mobile_no,
                address: address_val,
                status: 'new',
            }).success(function(response) {
                alert(response.data)
                if(status == 'continue') {
                   $scope.member_name = '';
                   $scope.age = '';
                   $scope.designation = '';
                   $scope.mobile = '';
                   $scope.address = '';
                }
                else if(status == 'exit') {
                    $modalInstance.dismiss('cancel');
                    window.location.reload();
                }
                console.log('response',response)
            })
        }
    }

    $scope.Familymembersupdate = function(data) {
        console.log('masjid_data',data)
        masjid_data.set_MasjidData(data);
        var modalInstance = $modal.open({
            templateUrl: 'add_Familymembers_modal',
            controller: add_Familymembers_ctrl,
            backdrop: 'true',
        });
    }
    var add_Familymembers_ctrl=function($scope,$http,masjid_data,$rootScope,$timeout,$location,$modalInstance) {
        $scope.cancel = function() {
            $modalInstance.dismiss('cancel');
        };
        $scope.Mem_ID = masjid_data.get_MasjidData();
        $scope.MemberUpdate = {
            volunteer : '', 
            donor : '',
            namaz : '',
            quran_reading : '', 
            language : '', 
            mobile : '', 
            physical : '', 
            alive : '',
            makthab : '',
            makthab_detail : '',
            age : '',
            gender : '', 
        }
        $scope.GetMemData = function() {
            $http.get('/UpdateFamily_member/?mem_id='+$scope.Mem_ID,{}).success(function(data){
                $scope.MemberUpdate.volunteer = data.volunteer;
                $scope.MemberUpdate.mobile = data.mobile;
                $scope.MemberUpdate.donor = data.donor;
                $scope.MemberUpdate.quran_reading = data.quran_reading;
                $scope.MemberUpdate.namaz = data.namaz;
                $scope.MemberUpdate.makthab = data.makthab;
                $scope.MemberUpdate.makthab_detail = data.makthab_detail;
                $scope.MemberUpdate.language = data.language;
                $scope.MemberUpdate.physical = data.disability;
                $scope.MemberUpdate.alive = data.alive;
                $scope.MemberUpdate.age = data.age;
                $scope.MemberUpdate.gender = data.gender;
            })
        }
        $scope.GetMemData()
        $scope.getScheme = function() {
            $http.get('/getSchemeData/?mem_id='+$scope.Mem_ID,{}).success(function(data) {
                console.log('datascheme',data)
                $scope.scheme_list = _.keys(data.data)
                $scope.getSubScheme = data.data;
            })
        }
        $scope.getService = function() {
            $http.get('/getServiceData/?mem_id='+$scope.Mem_ID,{}).success(function(data) {
                $scope.service_list = _.keys(data.data,"service")
                $scope.getServices = data.data;
                console.log('datascheme',$scope.getServices)
            })
        }
        // ['Boys For Makthab 4-15','Girls For Makthab 4-15','Adult Makthab','Interest in Aalim/Hifz','Interest in Niswan','Interest in 1yr Muallim']
        $scope.makthabData = function() {
            if($scope.MemberUpdate.makthab == 'Yes') {
                if($scope.MemberUpdate.gender == 'FEMALE' && 4<=parseInt($scope.MemberUpdate.age) && parseInt($scope.MemberUpdate.age)<=15) {
                    return ['Girls For Makthab 4-15','Interest in Niswan']
                }
                else if($scope.MemberUpdate.gender == 'MALE' && 4<=parseInt($scope.MemberUpdate.age) && parseInt($scope.MemberUpdate.age)<=15) {
                    return ['Boys For Makthab 4-15','Jumrah Madarasa for Boys']
                }
                else if(parseInt($scope.MemberUpdate.age)>15) {
                    return ['Interest in Aalim/Hifz','Adult Makthab','Interest in 1yr Muallim']
                }
                // else if($scope.MemberUpdate.gender == 'FEMALE' && parseInt($scope.MemberUpdate.age)>15) {
                //     console.log('yes',$scope.MemberUpdate)
                //     return ['Interest in Aalim/Hifz','Adult Makthab','Interest in 1yr Muallim']
                // }
            }
        }
        // $scope.makthabData()
        $scope.update_member = function(data,status) {
            console.log('member_name',status,data,$scope.Mem_ID)
            $http.post('/UpdateFamily_member/',{
                // member_name: member_name,
                data: data,
                mem_id: $scope.Mem_ID,
                // age: age,
                // designation: designation,
                // mobile: mobile,
                // address: address,
            }).success(function(response) {
                console.log('response',status)
                // alert(response)
                if(response == '"success"') {
                    console.log('success',status)
                    if(status == 'continue') {
                        alert('Updated successfully!')
                       //  $scope.member_name = '';
                       // $scope.age = '';
                       // $scope.designation = '';
                       // $scope.mobile = '';
                       // $scope.address = '';
                    }
                    else if(status == 'exit') {
                        $modalInstance.dismiss('cancel');
                        // window.location.reload();
                    }
                }
                else if (response == '"notfound"') { $modalInstance.dismiss('cancel');};
                console.log('response',response)
            })
        }
        $scope.DiseaseValue = {
            sym_type: '',
            name: '',
            medicine: '',
            cost: '',
        }
        $scope.SurgeryValue = {
            surgery_val : '',
            name : '',
            hospital_name : '',
            cash_hand : '',
            operation_cost : '',
            details : '',
        }
        $scope.ChronicValue = {
            name : '',
            chronic_val : '',
            doctor : '',
            tot_cost : '',
            details : '',
        }
        $scope.disease_val = 'SELECT or ADD DISEASE';
        $scope.get_disease = function(disease) {
            if(!disease) {
                $scope.disease_val = 'SELECT or ADD DISEASE';
            }
            else {
                $scope.disease_val = disease;
            }
            // $scope.get_memberScheme()
        }
        $scope.sur_disease_val = 'SELECT or ADD DISEASE';
        $scope.sur_get_disease = function(disease) {
            if(!disease) {
                $scope.sur_disease_val = 'SELECT or ADD DISEASE';
            }
            else {
                $scope.sur_disease_val = disease;
            }
            // $scope.get_memberScheme()
        }
        $scope.chr_disease_val = 'SELECT or ADD DISEASE';
        $scope.chr_get_disease = function(disease) {
            if(!disease) {
                $scope.chr_disease_val = 'SELECT or ADD DISEASE';
            }
            else {
                $scope.chr_disease_val = disease;
            }
            // $scope.get_memberScheme()
        }
        $scope.getDisease = function(sym_type) {
            console.log('sym_type',sym_type)
            $http.get('/DiseaseData/?type='+sym_type,{}).success(function(data) {
                $scope.disease_list = _.pluck(data.response,"name")
                $scope.getDiseaseData = data.response;
                console.log($scope.getDiseaseData)
            })
        }
        $scope.MemschemeList = []
        $scope.getMemberScheme = function(scheme_value,scheme_id,Mem_ID) {
            console.log('MemschemeList',scheme_value,scheme_id,Mem_ID)
            var schemeList = _.find($scope.MemschemeList,function(num) { return num.scheme_id==scheme_id})
            if(schemeList !== undefined) {
                $scope.MemschemeList.splice(schemeList,1)
            }
            $scope.MemschemeList.push({'scheme_value':scheme_value,'scheme_id':scheme_id,'Mem_ID':Mem_ID})
        }
        $scope.MemserviceList = []
        $scope.getMemberService = function(service_value,service_id,Mem_ID) {
            console.log('MemserviceList',service_value,service_id,Mem_ID)
            var serviceList = _.find($scope.MemserviceList,function(num) { return num.service_id == service_id; })
            if(serviceList !== undefined) {
                $scope.MemserviceList.splice(serviceList,1)
            }
            $scope.MemserviceList.push({'service_value':service_value,'service_id':service_id,'Mem_ID':Mem_ID})
        }
        $scope.update_memberScheme = function (getSubScheme,getServices,DiseaseValue,SurgeryValue,ChronicValue,status) {
            console.log('mem_id',DiseaseValue,SurgeryValue,ChronicValue,status)
            $http.post('/updateMemScheme/',{
                schemeData: getSubScheme,
                disease_val: DiseaseValue,
                surgery_val: SurgeryValue,
                chronic_val: ChronicValue,
                Servicedata: getServices,
                mem_id: $scope.Mem_ID,
            }).success(function(data){
                // if(data.response == 'Please Select Disease First!') {
                //     alert(data.response)
                // }
                // else {
                alert(data.response)
                if(status == 'exit') {
                    $modalInstance.dismiss('cancel');
                }
                else if(status == 'continue') {
                    $scope.get_memberScheme();
                }
                // }
                // $scope.MemschemeList = []
            })
        }
        $scope.get_memberScheme = function() {
            console.log('workinng')
            $http.get('/updateMemScheme/?mem_id='+$scope.Mem_ID,{}).success(function(data){
                console.log('data',data.medical,data.chronic)
                if(data.medical.length!=0) {
                    console.log('value',data.medical.length,data.medical)
                    $scope.DiseaseValue.sym_type = data.medical[0].sym_type;
                    // $scope.disease_val = data.medical[0].disease;
                    $scope.get_disease(data.medical[0].disease)
                    $scope.DiseaseValue.medicine = data.medical[0].medicine_needs;
                    $scope.DiseaseValue.cost = data.medical[0].cost;
                }
                if(data.surgery.length!=0) {
                    $scope.SurgeryValue.sym_type = data.surgery[0].sym_type;
                    // $scope.sur_disease_val = data.surgery[0].disease;
                    $scope.sur_get_disease(data.surgery[0].disease)
                    $scope.SurgeryValue.surgery_val = 'Yes';
                    $scope.SurgeryValue.hospital_name = data.surgery[0].hospital_name;
                    $scope.SurgeryValue.cash_hand = data.surgery[0].cash_hand;
                    $scope.SurgeryValue.operation_cost = data.surgery[0].cost;
                    $scope.SurgeryValue.details = data.surgery[0].details;
                }
                // else {
                //     $scope.SurgeryValue.surgery_val = 'No';
                // }
                if(data.chronic.length!=0) {
                    $scope.ChronicValue.sym_type = data.chronic[0].sym_type;
                    // $scope.chr_disease_val = data.chronic[0].disease;
                    $scope.chr_get_disease(data.chronic[0].disease)
                    $scope.ChronicValue.chronic_val = 'Yes';
                    $scope.ChronicValue.doctor = data.chronic[0].doctor;
                    $scope.ChronicValue.tot_cost = data.chronic[0].cost;
                    $scope.ChronicValue.details = data.chronic[0].details;
                }
                // else {
                //     $scope.ChronicValue.chronic_val = 'No';
                // }
            })
        }
        // $scope.get_memberScheme()
    }

    $scope.family_val = '';
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
            // $scope.FamilyValue.district = '';
            // $scope.FamilyValue.taluk = '';
            // $scope.FamilyValue.masjid = '';
            
            // $scope.FamilyValue.donor = '';
            // $scope.FamilyValue.volunteer = '';
            
            $scope.FamilyValue.health_insurance = '';
            $scope.FamilyValue.family_needs = '';
        }
        else {
            console.log('val--family',family)
            $scope.family_val = family.family_id;
            $scope.FamilyValue.ration_card = family.ration_card;
            $scope.FamilyValue.mobile_no = family.mobile;
            $scope.FamilyValue.address = family.address;
            $scope.FamilyValue.house = family.house_type;
            if(family.toilet == true) { $scope.FamilyValue.toilet = 'Yes'; } else if(family.toilet == false) { $scope.FamilyValue.toilet = 'No'; }
            $scope.FamilyValue.financial = family.financial_status;
            // $scope.FamilyValue.district = family.district_name
            // $scope.FamilyValue.taluk = family.taluk;
            // $scope.FamilyValue.masjid = family.muhalla;
            $scope.FamilyValue.language = family.language;
            // if(family.donor == true) { $scope.FamilyValue.donor = 'Yes'; } else if(family.donor == false) { $scope.FamilyValue.donor = 'No'; }
            if(family.health_insurance == true) { $scope.FamilyValue.health_insurance = 'Yes'; } else if(family.health_insurance == false) { $scope.FamilyValue.health_insurance = 'No'; }
            // if(family.volunteer == true) { $scope.FamilyValue.volunteer = 'Yes'; } else if(family.volunteer == false) { $scope.FamilyValue.volunteer = 'No'; }
            $scope.FamilyValue.family_needs = family.family_needs;
            // $scope.getMasjidData();
            $scope.getFamilyMembers(family.family_id)
        }
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
        // donor: '', 
        // volunteer: '', 
        health_insurance: '', 
        family_needs: '', 
        financial: '',
    }
    $scope.addFamily = function(family,value,status) {
        console.log('family',family,'value',value.masjid)
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
            // donor: value.donor,
            // volunteer: value.volunteer,
            health_insurance: value.health_insurance,
            familyid: familyid,
            ration_card: value.ration_card,
            address: value.address,
            family_needs: value.family_needs,
            house: value.house,
            financial: value.financial,
        }
        // if(data.masjid_name == "") {
        //     var masjid_val = masjid
        // }
        // else {
        //     var masjid_val = data.masjid_name
        // }
        $http.post('/familyData/',{
            value: data,
        }).success(function(data) {
            alert(data.data)
            $scope.get_family()
            $scope.getFamilyinfo();
        })
    }

    $scope.getFamilyinfo = function() {
        console.log('get',$scope.FamilyValue)
        // $http.get('/add_masjid/').success(function(data){
        //     $scope.mahallaList = data.data;
        //     $scope.masjidList = _.pluck(data.data,"name")
        //     if($scope.masjidList.indexOf($scope.masjid_val)==-1) {
        //         $scope.MasjidAddValue.masjid_name = '';
        //         $scope.MasjidAddValue.musallas = '';
        //         $scope.MasjidAddValue.district = '';
        //         $scope.MasjidAddValue.taluk = '';
        //         $scope.MasjidAddValue.address = '';
        //     }
        //     else {
        //         $scope.getMasjidListData = _.filter(data.data,function(num) { return num.name==$scope.masjid_val})
        //         $scope.MasjidAddValue.masjid_name = $scope.getMasjidListData[0].name;
        //         $scope.MasjidAddValue.musallas = $scope.getMasjidListData[0].musallas;
        //         $scope.MasjidAddValue.district = $scope.getMasjidListData[0].district;
        //         $scope.MasjidAddValue.taluk = $scope.getMasjidListData[0].taluk;
        //         $scope.MasjidAddValue.address = $scope.getMasjidListData[0].location;
        //         $scope.getMasjidMember($scope.MasjidAddValue);
        //         console.log('data',$scope.getMasjidListData)
        //     }
        // })
        $http.get('/familyData/', {}).success(function(data) {
            console.log('varerror',data)
            $scope.familyList = _.filter(data.data,function(data) { return data.taluk == $scope.FamilyValue.taluk && data.district_name == $scope.FamilyValue.district && data.muhalla == $scope.FamilyValue.masjid.name });
            
            console.log('val',$scope.familyList)
        })
    }
    $scope.FamilyMember = {
        mem_id : '',
        name : '', 
        gender : '', 
        age : '',
        family_head : '', 
        relationship : '', 
        qualification : '', 
        marital_status : '', 
        voter : '', 
        location : '', 
        occupation : '', 
    }
    $scope.add_Familymembers = function(data,family,status) {
        console.log('data',data,family)
        var family_id = family.familyid.family_id;
        $http.post('/FamilyMemberData/',{
            data: data,
            status: status,
            familyid: family_id,
        }).success(function(response) {
            alert(response.data)
            $scope.getFamilyMembers(family_id)
            console.log('response',response)
        })
    }
    $scope.getFamilyMembers = function(familyid) {
        console.log('value',familyid)
        $http.get('/FamilyMemberData/?family_id='+ familyid, {}).success(function(data) {
            $scope.FamilyMembersList = data;
            console.log(data,'voter')
        })
    }
    $scope.get_booleanval = function(val) {
        if(val == true) { return 'Yes' } else if(val == false) { return 'No' }
    }

    $scope.positionUpdated = function(module,session) {
        $scope.course_value = 'Select the Module in the list or Enter New... ';
        console.log('module',$scope.course_value,module)
        console.log('val',session)
        if(module == 'with') {
            $scope.course_module = true;
        }
        else if(module == 'without') {
            $scope.course_module = false;
        }
    }
    $scope.periods = ['Period 1','Period 2','Period 3','Period 4','Period 5','Period 6','Period 7','Period 8'];
    $scope.get_unique_ctype = function(course_type) {
        return  _.without(_.uniq(_.pluck($scope.courses, 'course_type')),"");
    }
    $scope.get_unique_course = function(course_type,module) {
        if(module == '') {
            $scope.unique_course = _.filter($scope.courses, function(num){ return num.course_type == course_type; });
            return $scope.unique_course;
        }
        else {
            return _.filter($scope.courses, function(num){ return num.module == module && num.course_type == course_type; });
        }
    }

    $scope.get_unique_module = function(course_type) {
        return  _.without(_.uniq(_.pluck(_.filter($scope.courses, function(num){ return num.course_type == course_type; }), 'module')),"");
        // var uniqCourse = _.filter($scope.courses, function(num){ return pluck_module.indexOf(num.module) != -1; });
        // return pluck_module
    }

    $scope.upload_csv = function(csv_file, to) {
        console.log(csv_file, to)
        var csv_file = csv_file;
        var fileUrl = '/upload_bulk_csv/';
        var send = new FormData();
        send.append('csv_file', csv_file);
        $http.post(fileUrl, send, {
            data: to,
            transformRequest: angular.identity,
            headers: {
                'Content-Type': undefined
            }
        }).success(function(data) {
            console.log('val', data)
            alert(data.data)
        });
    }

    $scope.sizeUpdated = function(day, session) {

        var periodIndex = day.allocs.indexOf(session);
        console.log(periodIndex,session,day.allocs)

        var tempStartHour = parseInt(session.session_start) + session.session_length;

        for (var i = periodIndex + 1; i < day.allocs.length; i++) {
            if(day.allocs[i].name == 'Period 5' || day.allocs[i].subject== 'Lunch Break') {
                console.log('????',day.allocs)
                day.allocs[i].session_start = 4;
                day.allocs[i].session_length = 1;
                day.allocs[i].subject = 'Lunch Break';

            }
            else if(day.allocs[i].name || day.allocs[i].subject || day.allocs[i].staff) {
                console.log('????',day.allocs)
                day.allocs[i].session_start = parseInt(day.allocs[i].session_start);
                day.allocs[i].session_length = day.allocs[i].session_length;
            }
            else {
                day.allocs[i].session_start = parseInt(session.session_start);
                day.allocs[i].session_length = session.session_length;
            }
            console.log(tempStartHour);
            console.log(day.allocs)
            // tempStartHour = day.allocs[i].session_start + day.allocs[i].session_length;
        };



    }



    $scope.addNewPeriod = function(day, session) {
        var lastPeriod = day.allocs[day.allocs.length - 1];
        var session_start = 0;
        console.log('session',lastPeriod)
        if (session != undefined) {
            console.log(session);
            lastPeriod = session;
            console.log('lastPeriod',lastPeriod,'lastPeriodsession',parseInt(lastPeriod.session_length))
            session_start = parseInt(lastPeriod.session_start) + parseInt(lastPeriod.session_length);
        };
        // var lastPeriod = day.allocs[day.allocs.length - 1];
        var periodIndex = day.allocs.indexOf(lastPeriod) + 1;

        console.log(day.allocs,'111',session_start)
        var tempData = {
            name: 'Period ' + (day.allocs.length),
            subject: '',
            staff: '',
            session_start: session_start,
            session_length: 1,
            selected: false
        };
        console.log(day.allocs.length)
        day.allocs.splice(periodIndex + 1, 0, tempData);
        console.log('session_start',day.allocs,'lastPeriod',lastPeriod)
        var tempStartHour = day.allocs[periodIndex].session_start + day.allocs[periodIndex].session_length;


        $scope.periodClicked(day,day.allocs[periodIndex + 1])

        for (var i = periodIndex + 1; i < day.allocs.length; i++) {
            console.log(tempStartHour);
            day.allocs[i].session_start = tempStartHour;
            tempStartHour = day.allocs[i].session_start + day.allocs[i].session_length;
        };
    }


    $scope.dayClicked = function(day) {

        console.log("dayClicked", day);

        $scope.selectedDay = day;


        console.log("dayClicked", $scope.selectedDay);


    }


    $scope.periodClicked = function(day, session) {

        $scope.dayClicked(day);
        

        console.log("periodClicked", day, session, $scope.selectedDay, $scope.selectedSession);

        $scope.selectedSession = session;




    }


    $scope.get_program = function() {
        return _.filter($scope.program,function(num){ return _.uniq(_.pluck($scope.group_data, "program")).indexOf(num.name) != -1; });
    }


    $scope.getStaffStudentData = function(staff) {
        console.log('attendance',staff)
        $http.get("/attendance_sheet/?instructor=" + staff.user, {}).success(function(response) {
            var data = response.data;
            var student_program = [];
            for(var i in data) {
                student_program.push(data[i].program)
            }
            $scope.staff_student_program = _.uniq(student_program);
            $scope.staff_student_data = response.programData;
        });
    }
    $scope.getStudentData = function(person,program,group) {
        console.log(person,program,group)
        $http.post('/getStudent_data/',{
            person : person,
            program : program,
            group : group,
        }).success(function(data){
            console.log('data')
            $scope.student_list = data.data;
            // console.log($scope.attendanceData)

            
            for(var stud in $scope.student_list){
                $scope.student_list[stud]['sessions'] = {}
                for(var ses in $scope.attendanceData['sessions']){
                   $scope.student_list[stud]['sessions'][$scope.attendanceData['sessions'][ses]] = true;
                }
                // console.log()
            }
            $http.get("/add_attendance/?instructor=" + person.user, {}).success(function(response) {
                
            })
            // for(i in $scope.attendanceData){

            //     student.sessions[a]
            // }
        })
    }

    $scope.login = function(name, password) {
        var data = {
            username: name,
            password: password,
        }
        console.log(data)
        $http({
            method: 'POST',
            url: '/login_page/',
            data: data,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).success(function(response) {
            console.log(response)
            if (response.data == 'success') {
                window.location.href = '/home/'
            }
        });
    }
    $scope.signup = function(name, password) {
        var data = {
            username: name,
            password: password,
        }
        $http({
            method: 'POST',
            url: '/signup/',
            data: data,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).success(function(data) {
            console.log(data)
        })
    }

})


// request.onupgradeneeded = function() {
//    var db = request.result;
//    var store = db.createObjectStore("student", {keyPath: "studentid", autoIncrement : true});
//    var idIndex = store.createIndex("studentid", "studentid", {unique: true});
//    var nameIndex = store.createIndex("name", "name");
//    var courseIndex = store.createIndex("course", "course");
//    var yearIndex = store.createIndex("year", "year");
//    var attendanceIndex = store.createIndex("attendance", "attendance");
//    var dateIndex = store.createIndex("date", "date");
//  };