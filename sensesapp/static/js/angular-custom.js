var underscore = angular.module('underscore', []);
underscore.factory('_', function() {
    'use strict';
    return window._; // assumes underscore has already been loaded on the page
});
var app = angular.module('senses', ['ngSanitize', 'ngCookies', 'ngRoute', 'ui.select', 'underscore']);
app.run(function($http, $cookies) {
    console.log($cookies.csrftoken)
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
app.service('studentSelected', function($rootScope) {
    var student = [];
    this.get_students_name = function() {
        return student;
    };
    this.set_students_name = function(name) {
        student = name;
    };

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
app.controller('dashboardCtrl', function($scope,_, $http, $location,studentSelected) {
    $scope.fetch_data = function() {
        $http.get('/fetchData/', {}).success(function(data) {
            $scope.courses = data.course;
            $scope.unique_course = _.filter($scope.courses, function(num){ return num.course_type == 'LECTURES'; });
            $scope.program = data.program;
            $scope.subjectAllocData.program = $scope.program[0];
            $scope.student_data = data.student;
            $scope.group_data = data.group;
            $scope.coursemap_data = data.course_map;
            $scope.fetchSubjectAllocData();
            $scope.subjectAllocData.group = $scope.group_data[0];
            $scope.get_group($scope.program[0],1)
            console.log('course_module',$scope.coursemap_data)
        })
    }
    $scope.fetch_data();
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
    $scope.get_group_staff = function(prog,sem) {
        if(prog != undefined || sem != undefined) {
           
            var group_list =  _.without(_.pluck(_.filter($scope.group_data, function(num) { return num.program == prog.name && parseInt(num.semester) == sem }),"name"),"");        
            return group_list
        }
    }
   

   
    $scope.get_year = function(prog) {
        var year_list = [];
        // var sem_list = ['first','second','third','fourth','fifth','sixth','seven'];
        for(i=0;i<prog;i++){
            year_list.push(i+1)
        }
        return year_list;
    }
    $scope.generate_year = function() {
        var year = [];
        for(i=2010;i<2110;i++){
            year.push(i+1)
        }
        return year;
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

    $scope.add_student = function(name,stud_id,email,address,gender,program,year,batch) {
        $http.post('/add_new_student/', {
            name: name,
            stud_id: stud_id,
            address: address,
            email: email,
            gender: gender,
            program: program.name,
            year: year,
            batch: batch,
        }).success(function(data) {
            console.log(data)
            alert(data.data)
            $scope.fetch_data();
        })
    }
    $scope.description = '';
    $scope.add_program = function(prog_name, duration, description) {
        $http.post('/add_new_program/', {
            prog_name: prog_name,
            duration: duration,
            description: description,
        }).success(function(data) {
            console.log(data)
            alert(data.data)
            $scope.fetch_data();
            $scope.prog_name = '';
            $scope.duration = '';
            $scope.description = '';
        })
    }
    $scope.course_map = function(semester, prog,course_type, course, description) {
        $http.post('/CourseMap/',{
            semester: semester,
            prog: prog.name,
            course_type: course_type,
            course: course.name,
            description: description,
        }).success(function(data) {
            console.log(data)
            alert(data.data)
            $scope.fetch_data();
        })
    }
    $scope.get_student_list = function(gen,prog,semester) {
        console.log('gen',gen)
        if(semester % 2 == 0) {
            var year = semester /2 ;
        }
        else {
            var year = (semester+1) /2;
        }
        $http.post('/get_studentList/',{
            gender: gen,
            program: prog.name,
            semester: semester,
            year: year,
        }).success(function(data){
            console.log(data.data)
            $scope.getStudent = data.data;
        })
    }
    var list_selected_studs = [];
    $scope.add_selected_users = function(check,group){
        console.log(check,group)
        // studentSelected.get_students_name();
        
        if(check){
            // console.log(group.student_id)
            list_selected_studs.push(group.student_id);
        }
        else{
            list_selected_studs = _.without(list_selected_studs,group.student_id)
            // console.log(group.student_id)
        }
        studentSelected.set_students_name(list_selected_studs);
        // console.log(studentSelected.get_students_name())
    }
    $scope.get_group_students = function(group_name,prog,sem){
        // console.log(group_name,prog,sem);
        // //         group
        // // prog_name
        // // sem_name
    $http.get('/get_studentList/?group='+group_name, {}).success(function(data) {
            $scope.getStudent_group = data.data;
        })
    }
    $scope.add_userto_group = function(group_name,prog,sem){
        $http.post('/add_userto_group/',{
            group_name: group_name,
            prog: prog,
            sem: sem,
            list_student: studentSelected.get_students_name(),
        }).success(function(data){
            alert(data.data)
            console.log(data.data)
            // $scope.getStudent = data.data;
        })

    }
    $scope.check_students = function(value){
        console.log(value)
        var check_list = studentSelected.get_students_name();
        console.log(check_list)
        if(check_list.length != 0 && value){
            return false;
        }
        else{
            return true;
        }
    }
    $scope.gen = '';
    $scope.group_name = '';
    $scope.add_group = function(group_name,gender,semester,prog,student,description) {
        if(semester % 2 == 0) {
            var year = semester /2 ;
        }
        else {
            var year = (semester+1) /2;
        }
        console.log('year',group_name,year)
        $http.post('/add_new_group/', {
            group_name: group_name,
            semester: semester,
            year: year,
            gender: gender,
            prog: prog.name,
            student: student.name,
            description: description,
        }).success(function(data) {
            alert(data.data)
            $scope.fetch_data();
        })
    }
    $scope.get_course_val = function(sel) {
    //     if ( sel.search==val && ! sel.clickTriggeredSelect ) {
    //         console.log(sel.search,val)
    //         $scope.val_course = true;
    //         $scope.course_val = val;
    //     }
    //     else if( !sel.search && sel.selected) {
    //         $scope.course_val = val;
    //         console.log(val,'val')
    //     }  
    //   console.log('callenderview',$scope.course_val)
    // };
    // $scope.course_val = "";
    $scope.course_val = sel;
    $scope.course_value = sel;
    };
    $scope.add_course = function(course_type,module_name,course_name, description) {
        console.log(module_name,'module_name')
        $http.post('/add_new_course/', {
            course_type: course_type,
            course_name: course_name,
            module_name: module_name,
            description: description,
        }).success(function(data) {
            alert(data.data)
            $scope.fetch_data();
        })
    }
    $scope.get_group_val = function(group) {
        console.log('????',group)
        return group;
    }
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