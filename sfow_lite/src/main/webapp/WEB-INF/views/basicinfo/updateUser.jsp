<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

* {
  box-sizing: border-box;
  margin: 0px;
}


html,
body {
  width: 100%;
  height: 100%;
}

input[type="text"], input[type="password"],textarea {
	width: 250px;


  border: 0px solid black;
  border-radius: 10px;
  font-size: 14px;
  font-weight: 450;
}


.wrapper{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	
}

.wrapperBody{
	width: 500px;
  height: 600px;
  
  display: flex;
  flex-direction: column;
  justify-content: space-between;
	
	
	background: #ffffff;
  border: 1px solid rgb(218, 212, 205);
  box-shadow: 7px 7px 39px rgb(218, 212, 205);
  border-radius: 20px;
  
  padding: 20px 0px 0px 15px;
}

.wrapperBody_title{
	display: flex;
	flex-direction: row;
	align-items: center;
}


.wrapperTitle_sub{
	padding-left: 5px;
	font-weight: 400;
	font-color: gray;
	font-size: 11px;
}

.wrapperTitle,.titleInput,.inputButton{
	padding-left: 30px;
}


.wrapperTitle{
	font-weight: 600;
	color: #2a4dc1;
}

.titleInput{
	width: 200px;
	border: 0px solid black;
	border-radius: ;
}

.divideLine {
	width: 90%;
  border-top: 1px solid #bdbdc1;
  padding: 30px 0px 0px 100px;
  margin: 0 auto;
}

.btn-primary-custom,
.btn-primary {
  color: #fff;
  background-color: #007bff !important;
  border-color: #007bff;
}


.btn-primary-custom {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
}

.btn-success-custom {
  color: #fff;
  background-color: #2a4dc1;
  border-color: #2a4dc1;
}

.rounded-pill-custom {
  border-radius: 20px;
}

.wrapper_button{
	display: flex;
	justify-content: flex-end;
	padding-right: 30px;
	}
</style>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	const SUCCESS_MESSAGE ='수정 성공.';
	const ERROR_MESSAGE = '수정 실패 정보를 다시 입력해주세요.';
	
	
	 $(function() {
		    $('#edit-btn').click(function() {
		    	$('input:not(#companyCode):not([name="id"]), textarea').attr('readonly', false);
		      $('#edit-btn').hide();
		      $('button[type="submit"]').show();
		    });
		  });
	
	
	  $.ajax({
	        type: "GET",
	        url: "${ContextPath}/userInfoAjax?id=${sessionScope.AUTHUSER.id}",
	        success: function(data) {
	        	  	$("input[name='companyCode']").val(data.companyCode);
	              $("input[name='companyName']").val(data.companyName);
	              $("input[name='id']").val(data.id);
	              $("input[name='userName']").val(data.userName);
	              $("input[name='email']").val(data.email);
	              $("input[name='phoneNum']").val(data.phoneNum);
	        }
	    });
	  
	  
	  $("#updateFrm").submit(function(e) {
		 			 e.preventDefault();
	        var formData = $(this).serialize();
	        $.ajax({
	            type: "POST",
	            url: "${ContextPath}/updateUserAjax",
	            data: formData,
	            success: function(data) {
	                // update the input fields with generalUserInfo data
	                $("input[name='companyName']").val(data.companyName);
	                $("input[name='id']").val(data.id);
	                $("input[name='userName']").val(data.userName);
	                $("input[name='email']").val(data.email);
	                $("input[name='phoneNum']").val(data.phoneNum);
	                
	                $('#edit-btn').show();
	                $('button[type="submit"]').hide();
	            },
	            error: function(xhr, status, error) {
	            }
	        });
	    });
	
});

	</script>
</head>
<body>
	<form id="updateFrm">
			<div class="wrapper">
				<div class="wrapperBody">
						<div class="wrapperBody_title">
		          <div class="wrapperTitle">회사코드</div>
	          	<div class="wrapperTitle_sub">Company code</div>
	          </div>
	          <div class="titleInput">
							<input type="text" name="companyCode" value="" disabled="disabled">
						</div>
						<div class="divideLine"></div>
						<div class="wrapperBody_title">
		          <div class="wrapperTitle">회사명</div>
	          	<div class="wrapperTitle_sub">Company name</div>
	          </div>
	          <div class="titleInput">
							<input type="text" name="companyName" value="" readonly="readonly">
						</div>
					 	<div class="divideLine"></div>
					 	<div class="wrapperBody_title">
		          <div class="wrapperTitle">아이디</div>
		          <div class="wrapperTitle_sub">ID</div>
          	</div>
	          <div class="titleInput">
							<input type="text" name="id" value="" readonly="readonly">
						</div>
						<div class="divideLine"></div>
						<div class="wrapperBody_title">
		          <div class="wrapperTitle">이름</div>
		          <div class="wrapperTitle_sub">Name</div>
	          </div>
	           <div class="titleInput">
								<input type="text" name="userName"value="" readonly="readonly">
							</div>
						<div class="divideLine"></div>
						<div class="wrapperBody_title">
		          <div class="wrapperTitle">이메일</div>
		          <div class="wrapperTitle_sub">E-Mail</div>
	          </div>
	          <div class="titleInput">
							<input type="text" name="email" value="" readonly="readonly">
						</div>
						<div class="divideLine"></div>
					  <div class="wrapperBody_title">
		          <div class="wrapperTitle">전화번호</div>
		          <div class="wrapperTitle_sub">Phone-Number</div>
	          </div>
	           <div class="titleInput">
							<input type="text" name="phoneNum" value="" readonly="readonly">
							</div>
							<div class="divideLine"></div>
							  <div class="wrapper_button">
			          <div class="inputButton">
			              <button type="button" id="edit-btn" class="btn btn-primary rounded-pill mr-2">수정</button>
			              <button type="submit" id="submit-btn" class="btn btn-success-custom rounded-pill-custom" style="display: none">저장</button>
			          </div>
		          </div>
				</div>
			</div>
		</form>
</body>
</html>