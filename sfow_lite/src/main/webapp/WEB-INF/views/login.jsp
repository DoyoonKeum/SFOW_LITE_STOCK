<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<link href="${ContextPath}/resources/css/basicinfo/login/login.css" rel="stylesheet" />
<style>
body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-color: #B0BEC5;
    background-repeat: no-repeat;
}

.card0 {
    box-shadow: 0px 4px 8px 0px #757575;
    border-radius: 0px;
}

.card2 {
    margin: 0px 40px;
}

.logo {
    width: 200px;
    height: 100px;
    margin-top: 20px;
    margin-left: 35px;
}

.image {
    width: 360px;
    height: 280px;
}

.border-line {
    border-right: 1px solid #EEEEEE;
}


.line {
    height: 1px;
    width: 45%;
    background-color: #E0E0E0;
    margin-top: 10px;
}

.or {
    width: 10%;
    font-weight: bold;
}

.text-sm {
    font-size: 14px !important;
}

::placeholder {
    color: #BDBDBD;
    opacity: 1;
    font-weight: 300
}

:-ms-input-placeholder {
    color: #BDBDBD;
    font-weight: 300
}

::-ms-input-placeholder {
    color: #BDBDBD;
    font-weight: 300
}

input, textarea {
    padding: 10px 12px 10px 12px;
    border: 1px solid lightgrey;
    border-radius: 2px;
    margin-bottom: 5px;
    margin-top: 2px;
    width: 100%;
    box-sizing: border-box;
    color: #2C3E50;
    font-size: 14px;
    letter-spacing: 1px;
}

input:focus, textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #304FFE;
    outline-width: 0;
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0;
}

a {
    color: inherit;
    cursor: pointer;
}

.btn-blue {
    background-color: #1A237E;
    width: 150px;
    color: #fff;
    border-radius: 2px;
}

.btn-blue:hover {
    background-color: #000;
    cursor: pointer;
}

.bg-blue {
    color: #fff;
    background-color: #1A237E;
}

@media screen and (max-width: 991px) {
    .logo {
        margin-left: 0px;
    }

    .image {
        width: 300px;
        height: 220px;
    }

    .border-line {
        border-right: none;
    }

    .card2 {
        border-top: 1px solid #EEEEEE !important;
        margin: 0px 15px;
    }
}

</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	
	$("form").submit(function(e) {
		e.preventDefault();
		
		var formData = $(this).serialize();
		
		$.ajax({
			type : "POST",
			url : "${ContextPath}/login",
			data : formData,
			success : function(response){
				
				console.log(response);
				
				  if (response == "2") {
	                    window.location.href = "${ContextPath}/home";
	                } else if(response == "1"){
	                    var errorMessage ="아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.";
	                    
	                    if (!$("div.error-message").length) { // check if error message element exists
	                        var errorDiv = '<div class="error-message" style="color:red">' + errorMessage + '</div>';
	                        $("input[type='submit']").before(errorDiv);
	                    }
	                }
				},
				error: function(xhr, status, error ){
				
					console.log(xhr.responseText);
				}
			});
		});
	});
</script>
<body>
<form method="post" name="loginForm">
		<div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
		    <div class="card card0 border-0">
		        <div class="row d-flex">
		            <div class="col-lg-6">
		                <div class="card1 pb-5">
		                    <div class="row">
		                        <img src="https://cdn.imweb.me/thumbnail/20230113/c0baf4dc3caa4.png" class="logo">
		                    </div>
		                    <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
		                        <img src="https://i.imgur.com/uNGdWHi.png" class="image">
		                    </div>
		                </div>
		            </div>
		            <div class="col-lg-6" >
		                <div class="card2 card border-0 px-4 py-5" >
		                    <div class="row px-3">
		                        <label class="mb-1"><h6 class="mb-0 text-sm">Company Code</h6></label>
		                        <input class="mb-4" type="text" name="companyCode" placeholder="Company Code">
		                    </div>
		                     <div class="row px-3">
		                        <label class="mb-1"><h6 class="mb-0 text-sm">ID</h6></label>
		                        <input class="mb-4" type="text" name="id" placeholder="ID">
		                    </div>
		                    <div class="row px-3">
		                        <label class="mb-1"><h6 class="mb-0 text-sm">Password</h6></label>
		                        <input type="password" name="password" placeholder="Password">
		                    </div>
		                    <div class="row mb-3 px-3 d-flex justify-content-center">
											  	<input type="submit" value="로그인">
											</div>
		                </div>
		            </div>
		        </div>
		        <div class="bg-blue py-4">
		            <div class="row px-3">
		                <small class="ml-4 ml-sm-5 mb-2">Copyright(c) SFOW. All Rights Reserved.</small>
		                <div class="social-contact ml-4 ml-sm-auto">
		                    <span class="fa fa-facebook mr-4 text-sm"></span>
		                    <span class="fa fa-google-plus mr-4 text-sm"></span>
		                    <span class="fa fa-linkedin mr-4 text-sm"></span>
		                    <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
</form>
</body>
</html>
