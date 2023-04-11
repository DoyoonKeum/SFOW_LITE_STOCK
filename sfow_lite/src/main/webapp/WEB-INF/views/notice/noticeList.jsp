<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>

<!DOCTYPE html>
<html lang="en">
<head>

  <title>Spring MVC02</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
   <link rel="stylesheet" href="${ContextPath}/resources/cpm/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



  <script type="text/javascript">
  $(document).ready(function() {
	    loadList();
	    $("#searchForm").submit(function(event) {
	        event.preventDefault();
	        var keyword = $(this).find("input[name='keyword']").val();
	        var type = $(this).find("select[name='type']").val();
	        loadList(1,type, keyword);
	      });
	    });

  

	function loadList(page,type, keyword) {
	    $.ajax({
	        url: "${ContextPath}/notice",
	        type: "get",
	        dataType: "json",
	        data: {page: page, type: type, keyword: keyword },
	        success: function(data) {
	            makeView(data.pageMaker, data.noticeList);
	        },
	        error: function() {
	            alert("error");
	        }
	    });
	}
	
	function makeView(pageMaker, noticeList) {
	    var listHtml = "<table class='table table-bordered'>";
	    listHtml += "<thead><tr>";
	    listHtml += "<td>번호</td>";
	    listHtml += "<td>제목</td>";
	    listHtml += "<td>작성자</td>";
	    listHtml += "<td>작성일</td>";
	    listHtml += "<td>조회수</td>";
	    listHtml += "</tr></thead>";
	    listHtml += "<tbody>";
	    $.each(noticeList, function(index, notice) {
	        listHtml += "<tr>";
	        listHtml += "<td>" + notice.no + "</td>";
	        listHtml += "<td id='t" + notice.no + "'><a href='javascript:getDetailNotice(" + notice.no + ", \"" + notice.title + "\", hideDetailNoticeCallback)'>" + notice.title + "</a></td>";
	        listHtml += "<td>" + notice.writername + "</td>";
	        listHtml += "<td>" + notice.regdate.substring(0, 10) + "</td>";
	        listHtml += "<td id='cnt" + notice.no + "'>" + notice.readcnt + "</td>";
	        listHtml += "</tr>";
	        listHtml += "<tr id='c" + notice.no + "' style='display:none'>";
	        listHtml += "<td>내용</td>";
	        listHtml += "<td colspan='4'>";
	        listHtml += "<textarea id='ta" + notice.no + "' readonly rows='7' class='form-control'>" + notice.content + "</textarea>";
	        listHtml += "<br/>";
	        listHtml += "<c:if test='${sessionScope.AUTHUSER.adminRole==9999}'>";
	        listHtml += "<span id='ub" + notice.no + "'><button class='btn btn-success btn-sm' onclick='updateNoticeForm(" + notice.no + ")'>수정화면</button></span>&nbsp;";
	        listHtml += "<button class='btn btn-warning btn-sm' onclick='deleteNotice(" + notice.no + ", " + pageMaker.criteria.page + ")'>삭제</button>";
	        listHtml += "</c:if>";
	        listHtml += "</td>";
	        listHtml += "</tr>";
	    });

	    listHtml += "</table>";

	   /*  listHtml += "<tr>";
	    listHtml += "<td colspan='5'>";
	    listHtml += "<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
	    listHtml += "</td>";
	    listHtml += "</tr>"; */
	    listHtml += "</table>";

	     // 페이징 처리
	      listHtml += "<div class='text-center'>";
	      listHtml += "<ul class='pagination'>";
	      if (pageMaker.prev) {
	        listHtml +=
	          "<li><a href='javascript:loadList(" +
	          (pageMaker.startPage - 1) +
	          ")'>&laquo;</a></li>";
	      }
	      for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
	        if (i === pageMaker.criteria.page) {
	          listHtml +=
	            "<li class='active'><a href='javascript:void(0)'>" +
	            i +
	            "</a></li>";
	        } else {
	          listHtml +=
	            "<li><a href='javascript:loadList(" + i + ")'>" + i + "</a></li>";
	        }
	      }
	      if (pageMaker.next) {
	        listHtml +=
	          "<li><a href='javascript:loadList(" +
	          (pageMaker.endPage + 1) +
	          ")'>&raquo;</a></li>";
	      }
    listHtml += "</ul>";
    listHtml += "</div>";

    $("#view").html(listHtml);
    $("#view").css("display", "block");
    $("#wfrom").css("display", "none");
}

	function fn_paging(pageNum) {
		  const form = document.querySelector("#pageFrm");
		  form.querySelector("#page").value = pageNum;
		  form.submit();
		}

        
	function goForm(){
		  $("#view").css("display","none");
		  $("#wfrom").css("display","block");
		  $("#searchFormDiv").css("display","none");
		  $("#writeButton").hide(); // Hide the "글쓰기" button
		}
    
      function inserNotice() {
    	  // 유효성 검사
    	  if (!$("#title").val()) {
    	    alert("제목을 입력해주세요.");
    	    return;
    	  }
    	// 내용이 입력되지 않은 경우
    	  if ($(".content").val().trim() === "") {
    	      alert("내용을 입력해주세요.");
    	      return;
    	  }

    	  

    	  var fData = $("#frm").serialize();
    	  $.ajax({
    	    url: "${ContextPath}/notice/insert",
    	    type: "post",
    	    data: fData,
    	    success: loadList,
    	    	success: function() {

    	    	      // 등록 성공 알림
    	    	      alert("등록되었습니다.");
    	    	    },
    	    	    error: function() {
    	    	      alert("error");
    	    	    }
    	    	  });

    	  // 폼 초기화
    	  $("#frm")[0].reset();
    	}

 
     //상세보기
     function hideDetailNoticeCallback(no, title) {
    	  $("#t" + no).html("<a href='javascript:getDetailNotice(" + no + ", \"" + title + "\", showDetailNoticeCallback)'>" + title + "</a>");
    	  $("#cnt" + no).text(Number($("#cnt" + no).text()) + 1);
    	}

    	function showDetailNoticeCallback(no, title) {
    	  $("#ta" + no).val("");
    	  $("#c" + no).css("display", "none");
    	  $("#t" + no).html("<a href='javascript:getDetailNotice(" + no + ", \"" + title + "\", hideDetailNoticeCallback)'>" + title + "</a>");
    	}

    	function getDetailNotice(no, title, callback) {
    	  if ($("#c" + no).css("display") == "none") {
    	    $.ajax({
    	      url: "${ContextPath}/read/" + no,
    	      type: "get",
    	      success: function (data) {
    	        $("#ta" + no).val(data.content);
    	      },
    	      error: function () {
    	        alert("error");
    	      }
    	    });
    	    $("#c" + no).css("display", "table-row");
    	    $("#ta" + no).attr("readonly", true);
    	    if (typeof callback === "function") {
    	      callback(no, title);
    	    }
    	  } else {
    	    $("#c" + no).css("display", "none");
    	    $.ajax({
    	      url: "${ContextPath}/read/" + no,
    	      type: "POST",
    	      data: { "no": no },
    	      headers: { "X-HTTP-Method-Override": "PUT" },
    	      dataType: "json",
    	      success: function (data) {
    	        $("#cnt" + no).text(data.count);
    	        if (typeof callback === "function") {
    	          callback(no, title);
    	        }
    	      },
    	   /*    error: function () {
    	        alert("error");
    	      } */
    	    });
    	  }
    	}
    	function deleteNotice(no) {
    		  if (confirm("정말로 삭제하시겠습니까?")) {
    		    $.ajax({
    		      url: "${ContextPath}/delete/" + no,
    		      type: "delete",
    		      success: function () {
    		        alert("삭제되었습니다.");
    		        loadList(); // 리스트 페이지 로드
    		      },
    		      error: function () {
    		        alert("error");
    		      }
    		    });
    		  }
    		}

     function updateNoticeForm(no){ //idx=10, 7, 8
    	 $("#ta"+no).attr("readonly",false); // 1
    	 
    	 var title=$("#t"+no).text();     
         var newInput="<input type='text' id='nt"+no+"' class='form-control' value='"+title+"'/>";
         $("#t"+no).html(newInput); // 2
         
         var newButton="<button class='btn btn-primary btn-sm' onclick='updateNotice("+no+")'>수정</button>";
         $("#ub"+no).html(newButton); // 3
     }
     function updateNotice(no){
    	    var title=$("#nt"+no).val();
    	    var content=$("#ta"+no).val();
    	    $.ajax({
    	        url : "${ContextPath}/updateForm/" + no,
    	        type : "put",
    	        contentType:'application/json;charset=utf-8',
    	        data : JSON.stringify({"no":no,"title":title,"content":content}),
    	        success : function() {
    	            alert("수정이 완료되었습니다.");
    	            loadList();
    	        },
    	        error : function(){ alert("error"); }             
    	    });
    	

   
    	 
    	//페이지 번호 클릭시 이동 하기
     	var pageFrm=$("#pageFrm");
     	$(".paginate_button a").on("click", function(e){
     		e.preventDefault(); // a tag의 기능을 막는 부분
     		var page=$(this).attr("href"); // 페이지번호
     		pageFrm.find("#page").val(page);
     		pageFrm.submit(); // /sp08/board/list   		
     	});    	
     }
     
     
     
   
  </script>
</head>
<body>


<div class="container">
  <h2>공지사항</h2>
   <div class="card">
    <div class="card-body">
       
    <c:if test="${sessionScope.AUTHUSER.adminRole==9999}">
 <button id="writeButton" class='btn btn-primary btn-sm' onclick='goForm()' style='margin-bottom: 10px;'>글쓰기</button>
</c:if>
      <div id="view"></div>
  
       <div class="text-right" >
<div class="search-form" id="searchFormDiv">
  <form class="form-inline" id="searchForm" method="get">
    <div class="form-group">
      <select name="type" class="form-control">
        <option value="title" ${data.criteria.type == 'title' ? 'selected' : ''}>제목</option>
        <option value="no" ${data.criteria.type == 'no' ? 'selected' : ''}>번호</option>
        <option value="writername" ${data.criteria.type == 'writername' ? 'selected' : ''}>작성자</option>
      </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" name="keyword" value="${data.criteria.keyword}">
    </div>
 <div class="form-group" style="margin-bottom: 20px;">
  <button type="submit" class="btn btn-success"  style="margin-top: 20px;">검색</button>
</div>
  </form>
</div>
<div style="height: 10px;"></div>
    <div class="panel-footer"></div>
  </div>
</div>

    <div class="panel-body" id="wfrom" style="display: none">
     <form id="frm">
      <table class="table">
         <tr>
           <td>제목</td>
           <td><input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요"/></td>
         </tr>
         <tr>
           <td>내용</td>
           <td><textarea rows="7" class="form-control content" id="content" name="content" placeholder="내용을 입력해주세요" ></textarea> </td>
         </tr>
         <tr>
           <td>작성자</td>
           <td><input type="text" id="writername" name="writername" class="form-control" value="${sessionScope.AUTHUSER.id}" readonly/></td>
         </tr>
         <tr>
           <td colspan="2" align="center">
            <button type="button" class="btn btn-success btn-sm" onclick="inserNotice()">등록</button> 
               <button type="reset" class="btn btn-warning btn-sm" id="fclear">취소</button>
            <!--   <button type="button" class="btn btn-info btn-sm" onclick="getNoticeList()">리스트</button> -->
           </td>
         </tr>
      </table>
     </form>
    </div>
 


</body>
</html>