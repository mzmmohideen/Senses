var app = angular.module('login',['ngCookies','ngRoute', 'underscore']);
app.run(function ($http, $cookies) {
    $http.defaults.headers.post['X-CSRFToken'] = $cookies.csrftoken;
});
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
app.directive('validEntry', function() {
    return {
        require: '?ngModel',
        link: function(scope, element, attrs, ngModelCtrl) {
            if (!ngModelCtrl) {
                return;
            }

            ngModelCtrl.$parsers.push(function(val) {
                var clean = val.replace(/[ ]+/g, '');
                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function(event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
});

app.directive('validUname', function() {
    return {
        require: '?ngModel',
        link: function(scope, element, attrs, ngModelCtrl) {
            if (!ngModelCtrl) {
                return;
            }

            ngModelCtrl.$parsers.push(function(val) {
                var clean = val.replace(/[ %'^'[';',':''{'|()~'}/]+/g, '');
                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function(event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
});
app.controller('loginCtrl',function($scope,$http,_,$location) {
	$scope.login = function(name,password) {
		console.log('val',name,password)
		var data = {
			username : name,
			password : password,
		}
        $http.post('/login_page/', {
        	data: data,
        }).success(function (response) {
		if(response.data == 'admin_dash') {
			window.location.href = '/home/'
		}
		else if(response.data == 'mohalla_user') {
			window.location.href = '/mohallauser/'
		}
		else if(response.data == 'end_user') {
			window.location.href = '/enduser/'
		}
	   	else if(response.data == 'invalid') {
            alert("Invalid Login Details!")
        }
	   	else if(response.data == 'failed') {
            alert("Incorrect username or password.")
        }
		});			
	}
	$scope.signup = function(name, email, password, confirm_password) {
		var data = {
			username : name,
			email : email,
			password : password,
		}
		if (confirm_password != password){
			alert('password not matched')
		}
		else{
			$http.post('/signup/', {
			    data: data,
			}).success(function(data){
				if(data.data == 'success') {
					alert('Registered !!!')
					window.location.href = '/login/'
			    }
			    else if (data.data == 'username exists'){
			    	alert('username already exists')
			    }
			    else if (data.data == 'email exists'){
			    	alert('email already exists')
			    }
			})
        }
	}
	$scope.user_signup = function(name, email, password, FamilyValue) {
		console.log('FamilyValue',FamilyValue.masjid.mohalla_id)
		$http.post('/new_member/',{
            mohalla_id: FamilyValue.masjid.mohalla_id,
            username: name,
            email: email,
            password: password,
            member_type: 'End Users & Donors',
            status: 'new',
        }).success(function(response) {
            alert(response.data)
            if(response.data == 'Member Created Successfully!') {
            	window.location.href = '/login/'
            }
        })
	}
	$scope.forgot_password = function(name,email,password) {
		$http.post('/change_password/',{
			email: email,
            username: name,
            password: password,
            status: 'forgot',
        }).success(function(data){
            if(data.data == 'Password Changed Successfully!') {
            	alert(data.data)
            	window.location.href = '/login/'
            }
            else {
            	alert(data.data)
            }
        })
	}

	//user signup
	$scope.FamilyValue = {
        masjid: '',
        district: '',
        taluk: '',
    }
	$scope.getMahallaData = function(val) {
        $scope.muhallaData = _.filter($scope.mahallaList, function(data){ return data.district == val.district && data.taluk == val.taluk })
    }
    $scope.getLocation = function() {
        $http.get('/addLocation/',{}).success(function(data) {
            $scope.DisCode = data.district;
            $scope.district_list = _.keys(data.district)
            $scope.getTaluk = data.data;
        })
    }
    $scope.getMasjidData = function() {
        $http.get('/add_masjid/').success(function(data){
            $scope.mahallaList = data.data;
        })
    }	
})


// request.onupgradeneeded = function() {
// 	  var db = request.result;
// 	  var store = db.createObjectStore("student", {keyPath: "studentid", autoIncrement : true});
// 	  var idIndex = store.createIndex("studentid", "studentid", {unique: true});
// 	  var nameIndex = store.createIndex("name", "name");
// 	  var courseIndex = store.createIndex("course", "course");
// 	  var yearIndex = store.createIndex("year", "year");
// 	  var attendanceIndex = store.createIndex("attendance", "attendance");
// 	  var dateIndex = store.createIndex("date", "date");
// 	};