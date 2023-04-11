<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    		alert("인증 세션이 만료되었습니다. 다시 로그인해주세요.");
        window.location.href = "${ContextPath}/login";
</script>
</head>
<body>

</body>
</html>