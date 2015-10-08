var app = angular.module('login',['ngCookies','ngRoute']);
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
app.controller('loginCtrl',function($scope,$http,$location) {
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