<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <title>Company Information Form</title>
   <link href="${ContextPath}/resources/css/basicinfo/companyinfo/companyinfo.css" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script>
$(document).ready(function() {
  $(function() {
    $('#edit-btn').click(function() {
      $('input:not(#companyCode), textarea').attr('readonly', false);
      $('#edit-btn').hide();
      $('#cancel-btn, button[type="submit"]').show();
    });
    
    $('#cancel-btn').click(function() {
      $('input:not(#companyCode), textarea').attr('readonly', true);
      $('#cancel-btn, button[type="submit"]').hide();
      $('#edit-btn').show();
    });
  });
  
 $(document).ready(function(){
	 $("form").submit(function(e){
		 e.preventDefault();
		 
		 
		 var formData = $(this).serialize();
		 
		 
		 $.ajax({
			 type : "POST",
			 url : "${ContextPath}/companyInfoUpdate",
			 data : formData,
			 success : function(response){
				 
				 
				 if(response == "1") {
					 alert("성공");
				 } else if(response == "0"){
					 alert("정보를 다시 입력해주세요.");
					 
				 }
				 
				 $('input:not(#companyCode), textarea').attr('readonly', true);
				 $('#cancel-btn, button[type="submit"]').hide();
				 $('#edit-btn').show();
				 
			 },
			 error: function(xhr, status, error ){
					
				}
		 });
	 });
 });
}); 
  
</script>

</head>
 <body>
      <form id="companyInfoForm">
        <div class="wrapper">
        	<div class="wrapperBody">
        	<div class="wrapperBody_title">
	          <div class="wrapperTitle">회사코드</div>
	          <div class="wrapperTitle_sub">Company code</div>
	          </div>
	          <div class="titleInput">
	            <input type="text" id="companyCode" name="companyCode" value="${companyInfo.companyCode}" readonly="readonly" />
	          </div>
	          <div class="divideLine"></div>
	          <div class="wrapperBody_title">
	          <div class="wrapperTitle">회사명</div>
	          <div class="wrapperTitle_sub">Company name</div>
	          </div>
	          <div class="titleInput">
	            <input type="text" id="companyName" name="companyName" value="${companyInfo.companyName}" readonly />
	          </div>
	          <div class="divideLine"></div>
	          <div class="wrapperBody_title">
	          <div class="wrapperTitle">대표자명</div>
	          <div class="wrapperTitle_sub">CEO</div>
	          </div>
	          <div class="titleInput">
	            <input type="text" id="ceoName" name="ceoName" value="${companyInfo.ceoName}" readonly />
	          </div>
	          <div class="divideLine"></div>
	          <div class="wrapperBody_title">
	          <div class="wrapperTitle">전화번호</div>
	          <div class="wrapperTitle_sub">Phone number</div>
	          </div>
	          <div class="titleInput">
	            <input type="text" id="companyPhone" name="companyPhone" value="${companyInfo.companyPhone}" readonly />
	          </div>
	          <div class="divideLine"></div>
	          <div class="wrapperBody_title">
	          <div class="wrapperTitle">이메일</div>
	          <div class="wrapperTitle_sub">Email</div>
	          </div>
	          <div class="titleInput">
	            <input type="text" id="email" name="email" value="${companyInfo.email}" readonly />
	          </div>
	          <div class="divideLine"></div>
	          <div class="wrapperBody_title">
	          <div class="wrapperTitle">주소</div>
	          <div class="wrapperTitle_sub">Address</div>
	          </div>
	          <div class="titleInput">
	            <input type="text" id="address" name="address" value="${companyInfo.address}" readonly />
	            </div>
	            <div class="divideLine"></div>
	            <div class="wrapperBody_title">
	          <div class="wrapperTitle">마지막 수정일</div>
	          <div class="wrapperTitle_sub">Last modified date</div>
	          </div>
	          <div class="titleInput">
	            <form:formatDate value="${companyInfo.updateDate}" pattern="yyyy년 MM월 dd일" />
	          </div>
	          <input type="hidden" value="${sessionScope.AUTHUSER.id}" name="updateUser" />
	         <div class="wrapper_button">
	          <div class="inputButton">
	            <c:if test="${sessionScope.AUTHUSER.adminRole==999}">
	              <button type="button" id="edit-btn" class="btn btn-primary rounded-pill mr-2">수정</button>
	              <button type="reset" id="cancel-btn"  class="btn btn-secondary-custom rounded-pill-custom mr-2" style="display: none">취소</button>
	              <button type="submit" id="submit-btn" class="btn btn-success-custom rounded-pill-custom" style="display: none">저장</button>
	            </c:if>
	          </div>
	          </div>
          </div>
        </div>
      </form>
    </body>
</html>

