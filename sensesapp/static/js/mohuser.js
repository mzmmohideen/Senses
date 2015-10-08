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
app.service('masjid_data', function($rootScope) {
    var data = [];
    this.get_MasjidData = function() {
        return data;
    };
    this.set_MasjidData = function(masjid_data) {
        data = masjid_data;
    };

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
app.controller('MohallaUserCtrl', function($scope, _, $http, masjid_data, $location,$modal) {
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
            var masjid = value.masjid;
        }
        else if(status == 'update') {
            var familyid = family;
            var masjid = value.masjid;
        }
        console.log('value',value,familyid,status)
        var data = {
            mobile_no: value.mobile_no,
            taluk: $scope.muhalla_values.taluk,
            district: $scope.muhalla_values.district,
            masjid: $scope.muhalla_values.mohalla,
            mohalla_id : $scope.muhalla_values.mohalla_id,
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
            status: 'feed',
        }).success(function(data) {
            alert(data.data)
            $scope.get_family()
            $scope.getFamilyinfo();
        })
    }
    $scope.deleteFamily = function(familyid) {
        console.log('familyid',familyid)
        $http.post('/familyData/',{
            familyid: familyid,
            status: 'delete',
        }).success(function(data) {
            alert(data.data)
            $scope.get_family()
            $scope.getFamilyinfo();
            $scope.FamilyMembersList = false
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
        if(val == true) { return 'Yes' } else if(val == false) { return 'No' } else if(val == 'Yes') { return 'Yes' } else if(val == 'No') { return 'No' }
    }
    $scope.UpdateFamMember = function(member,status) {
        $http.post('/UpdateFamilyMember/',{
            data: member,
            status: status,
        }).success(function(response){
            alert(response.data)
            $scope.getFamilyMembers(member.family)
        })
    }
    $scope.get_password = {
        curr_password : '',
        re_password : '',
        password : '',
    }
    $scope.change_password = function(uname,data_val) {
        console.log('val',$scope.get_password)
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
            console.log('val',$scope.get_password)
        })
    }

    // family_update_controller
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
                $scope.scheme_list = _.keys(data.data)
                $scope.getSubScheme = data.data;
            })
        }
        $scope.getService = function() {
            $http.get('/getServiceData/?mem_id='+$scope.Mem_ID,{}).success(function(data) {
                $scope.service_list = _.keys(data.data,"service")
                $scope.getServices = data.data;
            })
        }
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
            }
        }
        $scope.update_member = function(data,status) {
            console.log('member_name',status,data,$scope.Mem_ID)
            $http.post('/UpdateFamily_member/',{
                data: data,
                mem_id: $scope.Mem_ID,
            }).success(function(response) {
                if(response == '"success"') {
                    if(status == 'continue') {
                        alert('Updated successfully!')
                    }
                    else if(status == 'exit') {
                        $modalInstance.dismiss('cancel');
                    }
                }
                else if (response == '"notfound"') { $modalInstance.dismiss('cancel');};
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
        }
        $scope.sur_disease_val = 'SELECT or ADD DISEASE';
        $scope.sur_get_disease = function(disease) {
            if(!disease) {
                $scope.sur_disease_val = 'SELECT or ADD DISEASE';
            }
            else {
                $scope.sur_disease_val = disease;
            }
        }
        $scope.chr_disease_val = 'SELECT or ADD DISEASE';
        $scope.chr_get_disease = function(disease) {
            if(!disease) {
                $scope.chr_disease_val = 'SELECT or ADD DISEASE';
            }
            else {
                $scope.chr_disease_val = disease;
            }
        }
        $scope.getDisease = function(sym_type) {
            $http.get('/DiseaseData/?type='+sym_type,{}).success(function(data) {
                $scope.disease_list = _.pluck(data.response,"name")
                $scope.getDiseaseData = data.response;
            })
        }
        $scope.MemschemeList = []
        $scope.getMemberScheme = function(scheme_value,scheme_id,Mem_ID) {
            var schemeList = _.find($scope.MemschemeList,function(num) { return num.scheme_id==scheme_id})
            if(schemeList !== undefined) {
                $scope.MemschemeList.splice(schemeList,1)
            }
            $scope.MemschemeList.push({'scheme_value':scheme_value,'scheme_id':scheme_id,'Mem_ID':Mem_ID})
        }
        $scope.MemserviceList = []
        $scope.getMemberService = function(service_value,service_id,Mem_ID) {
            var serviceList = _.find($scope.MemserviceList,function(num) { return num.service_id == service_id; })
            if(serviceList !== undefined) {
                $scope.MemserviceList.splice(serviceList,1)
            }
            $scope.MemserviceList.push({'service_value':service_value,'service_id':service_id,'Mem_ID':Mem_ID})
        }
        $scope.update_memberScheme = function (getSubScheme,getServices,DiseaseValue,SurgeryValue,ChronicValue,status) {
            $http.post('/updateMemScheme/',{
                schemeData: getSubScheme,
                disease_val: DiseaseValue,
                surgery_val: SurgeryValue,
                chronic_val: ChronicValue,
                Servicedata: getServices,
                mem_id: $scope.Mem_ID,
            }).success(function(data){
                alert(data.response)
                if(status == 'exit') {
                    $modalInstance.dismiss('cancel');
                }
                else if(status == 'continue') {
                    $scope.get_memberScheme();
                }
            })
        }
        $scope.get_memberScheme = function() {
            $http.get('/updateMemScheme/?mem_id='+$scope.Mem_ID,{}).success(function(data){
                if(data.medical.length!=0) {
                    $scope.DiseaseValue.sym_type = data.medical[0].sym_type;
                    $scope.get_disease(data.medical[0].disease)
                    $scope.DiseaseValue.medicine = data.medical[0].medicine_needs;
                    $scope.DiseaseValue.cost = data.medical[0].cost;
                }
                if(data.surgery.length!=0) {
                    $scope.SurgeryValue.sym_type = data.surgery[0].sym_type;
                    $scope.sur_get_disease(data.surgery[0].disease)
                    $scope.SurgeryValue.surgery_val = 'Yes';
                    $scope.SurgeryValue.hospital_name = data.surgery[0].hospital_name;
                    $scope.SurgeryValue.cash_hand = data.surgery[0].cash_hand;
                    $scope.SurgeryValue.operation_cost = data.surgery[0].cost;
                    $scope.SurgeryValue.details = data.surgery[0].details;
                }
                if(data.chronic.length!=0) {
                    $scope.ChronicValue.sym_type = data.chronic[0].sym_type;
                    $scope.chr_get_disease(data.chronic[0].disease)
                    $scope.ChronicValue.chronic_val = 'Yes';
                    $scope.ChronicValue.doctor = data.chronic[0].doctor;
                    $scope.ChronicValue.tot_cost = data.chronic[0].cost;
                    $scope.ChronicValue.details = data.chronic[0].details;
                }
            })
        }
    }
    // family_update_controller end

})