var underscore = angular.module('underscore', []);
underscore.factory('_', function() {
    'use strict';
    return window._; // assumes underscore has already been loaded on the page
});
var app = angular.module('mohalla_user', ['ngCookies', 'ui.bootstrap', 'ngRoute', 'ui.select', 'underscore','ngSanitize','loading.services']);
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
app.filter('limitTocustom', function() {
    'use strict';
    return function(input, limit) {
        if (input) {
            if (limit > input.length) {
                return input.slice(0, limit);
            } else {
                return input.slice(0, limit) + '...';
            }
        }
    };
});
app.filter('SortData', function() {
    return function(input) {
        if(input != undefined) {
            return input.sort();
        }
    }
});
app.config(function (appBusyProvider) {
    'use strict';
    appBusyProvider.setMsg('Registering ...');
    appBusyProvider.setTimeout(50);
    appBusyProvider.setClazz('appBusy');
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
        // when('/dashboard', {
        //     templateUrl: 'dashboard.html',
        // }).
        when('/muhalla', {
            templateUrl: 'muhalla.html',
        }).
        when('/family_members', {
            templateUrl: 'family_members.html',
        }).
        when('/reports', {
            templateUrl: 'reports.html',
        }).
        when('/settings', {
            templateUrl: 'settings.html',
        }).
        otherwise({
            redirectTo: '/muhalla'
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
app.controller('MohallaUserCtrl', function($scope, _,appBusy,$timeout, $http, masjid_data, $location,$modal) {
    $scope.user_logout = function() {
        window.location.href = '/logout_view/'
    }
    $scope.get_muhallaData = function() {
        $http.get('/get_mahallauser_data/',{}).success(function(response){
            $scope.muhalla_values = response.muhalla;
            $scope.getMasjidMember($scope.muhalla_values)
            $scope.getFamilyinfo()
            $scope.getMasjidList($scope.muhalla_values)
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
    $scope.ReportValues = {
        district : '',
        taluk : '',
        muhalla : '',
        muhalla_id : '',
        report_name : '',      
    }
    $scope.ReportDatas = {
        age_from : '',
        age_to : '',
        gender : '',
        marital_status : '',
        voter_status : '',
        financial : '',
        muhalla_id : '',
        taluk : '',
        district : '',
        report_type : '',
    }
    $scope.diseaseid_list = []
    $scope.filter_disease_value = function(diseaseid_list) {
        $scope.diseaseid_list = diseaseid_list
    }
    $scope.schemeid_list = []
    $scope.filter_scheme_value = function(schemeid_list) {
        $scope.schemeid_list = schemeid_list
    }
    $scope.serviceid_list = []
    $scope.filter_service_value = function(serviceid_list) {
        $scope.serviceid_list = serviceid_list
    }  
    $scope.getScheme = function() {
        $http.get('/SchemeData/',{}).success(function(data) {
            $scope.scheme_list = _.keys(data.data)
            $scope.getSubScheme = data.data;
            console.log('scheme_list',$scope.getSubScheme)
        })
    }
    $scope.getService = function() {
        $http.get('/ServiceData/',{}).success(function(data) {
            $scope.service_list = _.pluck(data.data,"service")
            $scope.getServices = data.data;
        })
    }
    $scope.getMasjidList = function(data) {
        $http.get('/add_masjid/').success(function(response){
            $scope.mahallaList = response.data;
            // $scope.ReportValues.muhalla = '';
            $scope.tot_mohalla_list = _.pluck($scope.mahallaList,"mohalla_id")
            // $scope.masjidList = _.pluck(_.filter($scope.mahallaList,function(num) {return num.district == data.district && num.taluk == data.taluk}),"mohalla_id")
            $scope.muhalla_name = _.filter($scope.mahallaList,function(num) {return num.district == data.district && num.taluk == data.taluk && num.mohalla_id == data.mohalla_id})[0]
            $scope.ReportValues.district = $scope.muhalla_values.district;
            $scope.ReportValues.taluk = $scope.muhalla_values.taluk;
            $scope.ReportValues.muhalla_id = $scope.muhalla_values.mohalla_id;
            $scope.ReportValues.muhalla = $scope.muhalla_name;
        })
    } 
    $scope.sort_type = true;
    $scope.column_sort = 'familyid';
    $scope.header_sort = function(val,data,values) {
        if($scope.sort_type == true) {
            $scope.sort_type = false;
        }
        else if($scope.sort_type = false) {
            $scope.sort_type = true;
        }
        else {
            $scope.sort_type = true;
        }
        $scope.column_sort = val;
        $scope.fetchReportAPI(data,values)
        // console.log('val',report)
        // appBusy.set("Loading....");
        // $http.post('/sortReportData/',{
        //     data : data,
        //     sort_val : val,
        //     sort_type : $scope.sort_type,
        //     report_type : report.report_name,
        // }).success(function(response) {
        //     console.log('data response',response.sort_data)
        //     appBusy.set('Done...');              
        //     $timeout( function() {              
        //         appBusy.set(false);
        //     }, 1000);
        //     $scope.ReportHeader = header;
        //     $scope.getReportData = response.sort_data;
        // })
        // scope - $scope.header_sort = function(val,header,data,report) {
        // html - header_sort(header,ReportHeader,getReportData,ReportValues)

    }
    $scope.list_familyid = []
    $scope.checkboxval = '0';
    $scope.dosomething = function(value,data) {
        console.log('value',data.familyid,value,typeof(value))
        if(value == '0') {
            $scope.list_familyid.push(data)
        }
        else if(value == '1') {
            console.log($scope.list_familyid.indexOf(data))
            $scope.list_familyid.splice($scope.list_familyid.indexOf(data),1)
        }
        console.log('value',$scope.list_familyid)

    }
    $scope.performaction = function(action,reportdata,reportval) {
        console.log('val',action,reportdata,reportval)
        if(action == 'delete') {
            appBusy.set("Removing....");
        }
        else {
            appBusy.set("Updating....");
        }
        $http.post('/reportmailer/',{
            data:$scope.list_familyid,
            action:action,
            report:reportdata.report_type,
        }).success(function(response) {
            appBusy.set(response.data);              
                $timeout( function() {              
                    appBusy.set(false);
                }, 1000);
            $scope.fetchReportAPI(reportdata,reportval)
            console.log('val',response)
        })
    }
    $scope.loading_perc_gif = false;
    $scope.load_report_type = false;
    var offset = 0;
    var limit = 50;
    $scope.repr_offset = 0;
    $scope.repr_limit = 50;
    $scope.fetchReportAPI = function(data,values) {
        $scope.load_report_type = false;
        // $scope.list_familyid = []
        // $scope.diseaseid_list = []
        // $scope.schemeid_list = []
        // $scope.serviceid_list = []
        if(values.report_name == 'Total Family Details' || values.report_name == 'Own House & Rent House families' || values.report_name == 'Families without toilets') {
            $scope.voter_status_dt = false;
            $scope.tot_fam_dt = true;
            $scope.govt_needers = false;
            $scope.edu_needers = false;
            $scope.medical_needers = false;
            $scope.service_needers = false;
            $scope.tot_fam_jakath = false;
            $scope.basic_needs = false;
            if(values.report_name == 'Own House & Rent House families') {
                $scope.house_type_filter = true;
            }
            else {
                $scope.house_type_filter = false;
            }
        }
        else if(values.report_name == 'Government Voter ID Needers') {
            $scope.voter_status_dt = true;
            $scope.tot_fam_dt = false;
            $scope.service_needers = false;
            $scope.govt_needers = false;
            $scope.edu_needers = false;
            $scope.medical_needers = false;
            $scope.basic_needs = false;
            $scope.tot_fam_jakath = false;
            $scope.house_type_filter = false;
        }
        else if(values.report_name == 'Families Eligible for Jakaath' || values.report_name == 'Basic Help Needers List') {
            if(values.report_name == 'Basic Help Needers List') {
                $scope.basic_needs = true;
                $scope.tot_fam_jakath = false;
            }
            else if(values.report_name == 'Families Eligible for Jakaath') {
                $scope.basic_needs = false;
                $scope.tot_fam_jakath = true;
            }
            $scope.voter_status_dt = false;
            $scope.govt_needers = false;
            $scope.edu_needers = false;
            $scope.tot_fam_dt = false;
            $scope.service_needers = false;
            $scope.medical_needers = false;
            $scope.house_type_filter = false;
        }
        else if(values.report_name == 'Help for Poor Peoples and Guidance Needers List') {
            $scope.service_needers = true;
            $scope.medical_needers = false;
            $scope.voter_status_dt = false;
            $scope.govt_needers = false;
            $scope.edu_needers = false;
            $scope.tot_fam_jakath = false;
            $scope.tot_fam_dt = false;
            $scope.basic_needs = false;
            $scope.house_type_filter = false;
        }
        else if(values.report_name == 'Medical Needs and Guidance Needers Details') {
            $scope.medical_needers = true;
            $scope.voter_status_dt = false;
            $scope.govt_needers = false;
            $scope.service_needers = false;
            $scope.edu_needers = false;
            $scope.tot_fam_jakath = false;
            $scope.tot_fam_dt = false;
            $scope.basic_needs = false;
            $scope.house_type_filter = false;
        }
        else if(values.report_name == 'Government Schemes and Guidance Needers Details' || values.report_name == 'Training/Employment Help and Guidance Needers List' || values.report_name == 'Help for Discontinued and Guidance Needers List' || values.report_name == 'Educational Help and Guidance Needers List') {
            if(values.report_name == 'Government Schemes and Guidance Needers Details') {
                $scope.edu_needers = false;
                $scope.govt_needers = true;
            }
            else if(values.report_name == 'Educational Help and Guidance Needers List' || values.report_name == 'Training/Employment Help and Guidance Needers List' || values.report_name == 'Help for Discontinued and Guidance Needers List') {
                $scope.edu_needers = true;
                $scope.govt_needers = false;
            }
            $scope.medical_needers = false;
            $scope.voter_status_dt = false;
            $scope.tot_fam_jakath = false;
            $scope.service_needers = false;
            $scope.basic_needs = false;
            $scope.tot_fam_dt = false;
            $scope.house_type_filter = false;
        }
        else if(values.report_name == 'Women chldrens Need to join Niswan Madarasa' || values.report_name == 'Persons Need to join Jumrah Madarasa' || values.report_name == 'Childrens Need to join Makthab Madarasa') {
            $scope.madarasa_needers = true;
            $scope.edu_needers = false;
            $scope.govt_needers = false;
            $scope.medical_needers = false;
            $scope.voter_status_dt = false;
            $scope.tot_fam_jakath = false;
            $scope.service_needers = false;
            $scope.basic_needs = false;
            $scope.tot_fam_dt = false;
            $scope.house_type_filter = false;
        }
        else if(values.report_name == 'Mohalla Report') {
            $scope.madarasa_needers = false;
            $scope.edu_needers = false;
            $scope.govt_needers = false;
            $scope.medical_needers = false;
            $scope.voter_status_dt = false;
            $scope.tot_fam_jakath = false;
            $scope.service_needers = false;
            $scope.basic_needs = false;
            $scope.tot_fam_dt = false;
            $scope.house_type_filter = false;
        }
        else {
            $scope.madarasa_needers = false;
            $scope.edu_needers = false;
            $scope.govt_needers = false;
            $scope.medical_needers = false;
            $scope.voter_status_dt = false;
            $scope.tot_fam_jakath = false;
            $scope.service_needers = false;
            $scope.basic_needs = false;
            $scope.tot_fam_dt = false;
            $scope.house_type_filter = false;
        }
        data.district = values.district;
        data.taluk = values.taluk;
        data.muhalla_id = values.muhalla_id;
        if(values.report_name == '') {
            data.report_type = '';
        }
        else {
            data.report_type = values.report_name;
        }
        if(values.muhalla != '') {
            $scope.ReportHeader = true;
            $scope.getReportData = false;
            $scope.loading_perc_gif = true;
            $scope.repr_limit = limit;
            $scope.repr_offset = offset;
            // appBusy.set("Loading....");
            $http.post('/fetchReportData/',{
                data : data,
                offset : offset,
                limit : limit,
                sort_val : $scope.column_sort,
                sort_type : $scope.sort_type,
                diseaseid_list : $scope.diseaseid_list,
                schemeid_list : $scope.schemeid_list,
                serviceid_list : $scope.serviceid_list,
            }).success(function(response) {
                $scope.loading_perc_gif = false;
                // appBusy.set('Done...');              
                // $timeout( function() {              
                //     appBusy.set(false);
                // }, 1000);
                if(response.report_type == 'Total Family Details'  || response.report_type == 'Own House & Rent House families') {
                    $scope.ReportHeader = ['S.No','Name & Address','Age & Gender','Family ID & Mobile NO','Financial Status & Jakaath']
                    $scope.getReportData = response.get_family;
                }
                else if(response.report_type == 'Basic Help Needers List') {
                    $scope.ReportHeader = ['S.No','Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                    $scope.getReportData = response.get_family;
                }
                else if(response.report_type == 'Families Eligible for Jakaath') {
                    $scope.ReportHeader = ['S.No','Needers Name','Age & Gender','Financial Status & Family ID','Mobile NO','Address']
                    $scope.getReportData = response.get_family;
                }
                else if(response.report_type == 'Families without toilets') {
                    $scope.ReportHeader = ['S.No','Needers Name','Age & Gender','Financial Status & Family ID','Mobile NO','Address']
                    $scope.getReportData = response.get_family;
                }
                else if(response.report_type == 'Medical Needs and Guidance Needers Details') {
                    $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                    $scope.getReportData = response.get_mem_medical;
                }
                else if(response.report_type == 'Help for Poor Peoples and Guidance Needers List') {
                    $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                    $scope.getReportData = response.get_mem_service;
                }
                else if(response.report_type == 'Government Schemes and Guidance Needers Details' || response.report_type == 'Help for Discontinued and Guidance Needers List' || response.report_type == 'Training/Employment Help and Guidance Needers List' || response.report_type == 'Educational Help and Guidance Needers List') {
                    $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                    $scope.getReportData = response.get_mem_scheme;
                }
                else if(response.report_type == 'Government Voter ID Needers') {
                    $scope.ReportHeader = ['S.No','Needers Name','Age & Gender','Financial Status & Family ID','Mobile NO','Address']
                    $scope.getReportData = response.get_mem_voter;
                }
                else if(response.report_type == 'Women chldrens Need to join Niswan Madarasa' || response.report_type == 'Persons Need to join Jumrah Madarasa' || response.report_type == 'Childrens Need to join Makthab Madarasa') {
                    $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                    $scope.getReportData = response.get_memData;
                }
                else if(response.report_type == 'Mohalla Report') {
                    $scope.ReportHeader = ['S.No','Details','Counts']
                    $scope.getReportData = response.reports;
                }
                else if(response.report_type == 'Needs Types') {
                    $scope.ReportHeader = ['S.No','Needs ID','Needs Type','Total','beneficiaries']
                    $scope.getReportData = response.reports;
                }
                else {
                    $scope.ReportHeader = ['S.No','Needers Name & Address','Age & Gender','Financial Status & Family ID','Mobile NO','Needs Details']
                    $scope.getReportData = response.member_details;
                    $scope.ReportValues.report_name = 'New filter'
                }
                if(response.report_type == 'Mohalla Report') {
                    $scope.pdf_data = response.pdf_report;
                }
                else {
                    $scope.pdf_data = $scope.getReportData;
                }
                if (response.report_type == 'Total Family Details' || response.report_type == 'Families without toilets'  || response.report_type == 'Own House & Rent House families' || response.report_type == 'Basic Help Needers List' || response.report_type == 'Families Eligible for Jakaath') {
                    $scope.finacial_value = response.finacial_value;
                }
                else {
                    $scope.finacial_value = '';
                }
                $scope.load_report_type = true;
                // $http.post('/report_to_pdf/',{
                //     header : $scope.ReportHeader,
                //     data : pdf_data,
                //     report : $scope.ReportValues,
                //     finacial_value : finacial_value,
                // }).success(function(response){
                //     $scope.get_pdfname = response.pdfname;
                // })
            })
        }
    }
    $scope.exportPDF = function() {
        // $scope.down_pdf = false;
        $http.post('/report_to_pdf/',{
            header : $scope.ReportHeader,
            data : $scope.pdf_data,
            report : $scope.ReportValues,
            finacial_value : $scope.finacial_value,
        }).success(function(response){
            $scope.get_pdfname = response.pdfname;
            // $scope.down_pdf = true;
            // window.location.href = '/static/pdf/'+response.pdfname
            window.open('/static/pdf/'+response.pdfname,'_blank')
        })
    }
    $scope.export_to_pdf = function(header,data,report) {
        $http.post('/report_to_pdf/',{
            header : header,
            data : data,
            report : report,
        }).success(function(response){
            window.open('/'+response.pdfname)
        })
    }
    $scope.more_report_page = function(repr_offset, repr_limit, report_length, value,reportdat,reportval) {
        if (report_length > repr_limit) {
            if (value == 'add') {
                offset = repr_offset + 50;
                limit = offset + 50;
            } else if (value == 'sub') {
                if (repr_offset > 0) {
                    limit = repr_limit - 50;
                    offset = repr_offset - 50;
                } else if (repr_offset == 0) {
                    offset = 0;
                    limit = 50;
                }
            }
        } else if (report_length <= repr_limit) {
            if (value == 'add') {
                offset = repr_limit;
                limit = report_length;
            } else if (value == 'sub') {
                if (repr_offset > 0) {
                    limit = repr_offset;
                    offset = limit - 50;
                } else if (repr_offset == 0) {
                    offset = 0;
                    limit = 50;
                }
            }
        }
        $scope.fetchReportAPI(reportdat,reportval);
    }
    $scope.report_curr_offset = 0;
    $scope.load_more_report_data = function(plimit, poffset) {
        $scope.report_curr_offset = offset;
        $http.get("/get_eb_wl_data/?portfolio=" + portfolio + '&poffset=' + poffset + '&plimit=' + plimit + '&sort=company_name&by=False&sort_in=' + port_status)
            .success(function(data) {
                $scope.repr_limit = plimit;
                $scope.repr_offset = poffset;
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
        })
    }
    $scope.UpdateMember = function(mohalla_id,member,name,age,designation,mobile,address) {
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
        $http.get('/familyData/?muhalla_id='+$scope.muhalla_values.mohalla_id, {}).success(function(data) {
            // $scope.familyList = _.filter(data.data,function(data_val) { return data_val.taluk == $scope.FamilyValue.taluk && data_val.district_name == $scope.FamilyValue.district && data_val.muhalla == $scope.FamilyValue.masjid });
            $scope.familyList = data.data;
        })
    }
    $scope.getFamilyMembers = function(familyid) {
        $http.get('/FamilyMemberData/?family_id='+ familyid, {}).success(function(data) {
            $scope.FamilyMembersList = data;
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
    $scope.family_gender = ['MALE','FEMALE']
    $scope.FamilyMember.gender = $scope.family_gender[0]
    $scope.family_head_status = ['Yes','No']
    $scope.FamilyMember.family_head = $scope.family_head_status[0]
    $scope.family_marital_status = ['Married','Single','Widow','Devorced','Aged Unmarried Woman']
    $scope.FamilyMember.marital_status = $scope.family_marital_status[0]
    $scope.fam_voter_status = ['Yes','No']
    $scope.FamilyMember.voter = $scope.fam_voter_status[0]
    $scope.fam_mem_location = ['Local','Outstation','Foreign']
    $scope.FamilyMember.location = $scope.fam_mem_location[0]
    $scope.add_Familymembers = function(data,family,status) {
        var family_id = family.familyid.family_id;
        $http.post('/FamilyMemberData/',{
            data: data,
            status: status,
            familyid: family_id,
        }).success(function(response) {
            alert(response.data)
            $scope.getFamilyMembers(family_id)
        })
    }
    $scope.getFamilyMembers = function(familyid) {
        $http.get('/FamilyMemberData/?family_id='+ familyid, {}).success(function(data) {
            $scope.FamilyMembersList = data;
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
    $scope.senses_reports = ['Mohalla Report','Total Family Details','Families Eligible for Jakaath','Medical Needs and Guidance Needers Details','Government Schemes and Guidance Needers Details','Government Voter ID Needers','Educational Help and Guidance Needers List','Help for Discontinued and Guidance Needers List','Basic Help Needers List','Help for Poor Peoples and Guidance Needers List','Training/Employment Help and Guidance Needers List','Childrens Need to join Makthab Madarasa','Persons Need to join Jumrah Madarasa','Women chldrens Need to join Niswan Madarasa','Needs Types','Families without toilets','Own House & Rent House families']
    $scope.getFamilyReport = function(fam_data,report_name) {
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
    $scope.get_jakaath_status = function(financial) {
        if(financial == 'A' || financial == 'B' || financial == 'C') { return 'NO' }
        else if(financial == 'D' || financial == 'E') { return 'YES' }
    }

    // family_update_controller
    $scope.Familymembersupdate = function(data) {
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

var appServices = angular.module('loading.services', []).provider("appBusy", function() {

    this.msg = "Loading ...";
    this.timeout = 1000;
    this.clazz = "appBusy";

    var body = angular.element(window.document.body);
    var domEl = null;

    this.show = function(msg) {
        msg = msg || this.msg;
        if (!domEl) {
            domEl = angular.element('<div></div>').addClass(this.clazz);
            domEl.text(msg);
            setTimeout(function() {
                if (domEl)
                    body.append(domEl);
            }, this.timeout);
        } else {
            domEl.text(msg);
        }
    }
    this.hide = function() {
        if (domEl) {
            domEl.remove();
            domEl = null;
        }
    }
    this.$get = function() {
        var self = this;
        return {
            set: function(msg) {
                if (typeof msg == 'boolean') {
                    msg === true ? self.show() : self.hide();
                } else self.show(msg);
            }
        }
    }
    this.setMsg = function(val) {
        this.msg = val;
    }
    this.setTimeout = function(val) {
        this.timeout = val;
    }
    this.setClazz = function(val) {
        this.clazz = val;
    }
});

