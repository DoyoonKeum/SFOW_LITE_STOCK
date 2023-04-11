<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<script src="${ContextPath}/resources/js/tui-grid.js"></script>
	<link rel="stylesheet" href="${ContextPath}/resources/css/tui-grid.css" type="text/css"/>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<title>Insert title here</title>
  <style>
  .btn-wrapper {
    display: flex;
    justify-content: space-between;
  }
  
  /* .btn-wrapper button {
    background-color: #f5f5f5;
    color: #333;
    border: 1px solid #ccc;
    padding: 5px 8px; 
    border-radius: 4px;
    cursor: pointer;
    width: 70px; 
    height: 30px; 
    font-size: 12px; 
  } */

/*   #delete-row-btn {
    background-color: #ff8a80;
    color: #fff;
    border: 1px solid #ff8a80;
  } */

 /*  #delete-row-btn:hover {
    background-color: #ff7043;
    border: 1px solid #ff7043;
  } */
  
  .inputBox, .searchKeywordBtn {
  display: inline-block;
	}
	
	
	/* ---------------------------------------------------------- */
	
	.custom-button {
    background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
		}
		
		#saveBtn:hover, #saveBtn2:hover, #search:hover {
		  background-color: rgba(051, 102, 204, 1);
		  opacity: 0.8;
		}
		
		#deleteRowBtn:hover, #deleteRowBtn2:hover, #reset:hover {
		  background-color: rgba(204, 000, 051, 1);
		  opacity: 0.8;
		}
		
		#addRowBtn:hover, #addRowBtn2:hover {
		  background-color: rgba(80, 201, 141);
		  opacity: 0.8;
		}
	
</style>
</head>
<script>
$(document).ready(function() {
		const EMAIL_AT_REQUIRED = '올바른 이메일 주소를 입력해주세요.';
		const EMPTY_FIELD_ERROR_MSG ='값을 입력해주세요';
		const DELETE_SUCCESS = '삭제에 성공했습니다.';
		const DELETE_FAILED ='삭제에 실패했습니다.';
	  const ADD_SUCCESS = '추가에 성공했습니다.';
    const ADD_FAILED = '추가에 실패했습니다.';
    const EXISTING_ID_MSG = '이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.';
    
    
    
    /* 정규식  */
     const tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
		 
		var gridData = [];
		var grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    data: gridData,
	    scrollX: false,
	    scrollY: true,
	    rowHeaders: ['checkbox','rowNum'],
	    bodyHeight: 700,
	    columns: [
	    			// [회사코드 ] 
            {
                header: '회사코드',            
                name: 'companyCode',
            },
        		// [회사명 ] 
            {
                header: '회사명',        
                name: 'companyName',  
                editor: 'text',
               },
               
            // [이름 ]
            	{
                header: '이름',   
                name: 'userName',  
                editor: 'text', 
                sortable: true,
                validation: {
                    dataType: 'string',
                    required: true
                  }
            },
            
         		// [아이디 ]
            {
                header: '아이디',         
                name: 'id',  
                editor: 'text',
                sortable: true,
                align: 'center', 
            },
            
         		// [계정번호 ]
            {
                header: '계정번호',         
                name: 'updateKey',            
                hidden: true
            },
            
         		// [비밀번호 ]
            {
                header: '비밀번호',         
                name: 'password',            
                editor: 'text',  
                sortable: true,
                align: 'center',
                validation: {
	                dataType: 'string',
	                required: true
	              }
            },
            
         		// [전화번호 ]
            {
                header: '전화번호',            
                name: 'phoneNum',             
                editor: 'text', 
                align: 'center',
                sortable: true,
		            validation: {
		                dataType: 'string',
		                required: true
		              }
            },
            
         			// [이메일 ]
            	{
                header: '이메일',           
                name: 'email',             
                align: 'center', 
                sortable: true,
                editor: 'text',
	            	validation: {
	                dataType: 'string',
	                required: true
	              }
              },
              
              {
            	  header: '관리자 권한',
            	  name: 'adminRole',
            	  formatter: 'listItemText',
            	  sortable: true,
            	  align: 'center',
            	  editor: {
            	      type: 'select',
            	      options: {
            	        listItems: [
            	          {
            	            text: 'Y',
            	            value: '999'
            	          },
            	          {
            	            text: 'N',
            	            value: '1'
            	          }
            	        ]
            	      }
            	  }
              },
              
           		// [생성일 ]
              {
                  header: '생성일',            
                  name: 'createDate',
                  hidden: true
                },
                
                
                // 수정일[]
                {
                    header: '수정일',            
                    name: 'updateDate',  
                    hidden: true
                  },
			        ]
	  	});
		
		
	  
	  //행 추가
	  $('#addRowBtn').on('click', function() {
		  
		  
		  var now = new Date();
		  var currentDate = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + ('0' + now.getDate()).slice(-2);
		  
		    // 행 추가할 때 필수 데이터 입력
		    var newRowData = {
		        companyCode: '${sessionScope.AUTHUSER.companyCode}',
		        companyName: '${sessionScope.AUTHUSER.companyName}',
		        userName: '',
		        id: '',
		        updateId: '',
		        password: '',
		        phoneNum: '',
		        email: '',
		        createDate: currentDate,
		        updateDate: currentDate
		    };
				
		    // 새로운 행 추가
		    var newRowKey = grid.appendRow(newRowData); 
		   
		    
		    // 새로운 행의 정보 전송
		    $.ajax({
		        url: '${ContextPath}/newUserAjax',
		        type: 'POST',
		        async : true,
		        data: JSON.stringify(newRowData),
		        contentType: 'application/json',
		        success: function(result) {
		            
		            $.ajax({
		                url: '${ContextPath}/userManagementAjax?companyCode=${sessionScope.AUTHUSER.companyCode}',
		                type: 'GET',
		                dataType: 'JSON',
		                success: function(result) {
		                    grid.resetData(result);
		                },
		                error: function(xhr, status, error) {
		                    alert('Error: ' + error);
		                }
		            });
		        },
		        error: function(xhr, status, error) {
		            alert(ADD_FAILED);
		        }
		    });
		});


	  
	  //모든 회원 목록 조회하기
	  $.ajax({
	    url: '${ContextPath}/userManagementAjax?companyCode=${sessionScope.AUTHUSER.companyCode}',
	    method: 'GET',
	    async : true,
	    dataType: 'JSON',
	    success: function(data) {
	      gridData=data;
	      grid.resetData(gridData);

	      grid.on('editingFinish', function(ev) {
	    	  var rowKey = ev.rowKey;
	    	  var columnName = ev.columnName;
	    	  var updatedData = {};
	    	  var rowData = grid.getRow(rowKey);
	    	  
	    	  
	    	  
	    	  // ID 유효성 검사
	    	  if(columnName == 'id' && data != null){
	    		 
	    		  $.ajax({
		    		    url: '${ContextPath}/userListCheckDuplicate',
		    		    method: 'POST',
		    		    async : true,
		    		    dataType: 'JSON',
		    		    data: JSON.stringify(rowData),
		    		    contentType: 'application/json',
		    		    success: function(response) {
		    		    	if(response === 2) {
										alert(EXISTING_ID_MSG);    		    		
						    	}
		    		    },
		    		    error: function(error) {
		    		    }
		    		});
	    	  }
	    	  
	    	  //회원정보 변경
	    	  if (columnName !== 'id') {
	    		  
	    		  //값 필수 입력 유효성 검사
		    	  if (!rowData[columnName]) {
		    		  alert(EMPTY_FIELD_ERROR_MSG);
		    		  return;
		    		}  
		    	  
		    	  //이메일 유효성 검사
		    	  if (columnName === 'email') {
		    		  var emailValue = rowData[columnName];
		    		  if (!emailValue || emailValue.indexOf('@') === -1) {
		    		    alert(EMAIL_AT_REQUIRED);
		    		    return;
		    		  }
		    		}
		    	  //전화번호 유효성 검사
		    	  if(columnName ==='phoneNum'){
		    		  var phoneNum = rowData[columnName];
		    		  if(!tel_rule.test(phoneNum)) {
		    			  alert("올바른 번호를 입력해주세요.");
		    			  return;
		    		  }
		    	  }
	    		  
	    		  
	    		  
	    	  $.ajax({
	    		    url: '${ContextPath}/userListUpdate',
	    		    method: 'PUT',
	    		    async : true,
	    		    dataType: 'JSON',
	    		    data: JSON.stringify(rowData),
	    		    contentType: 'application/json',
	    		    success: function(response) {
	    		    },
	    		    error: function(error) {
	    		    }
	    		});
	    	  }	//회원정보 변경 ajax
	    	  
	    	  
	    	  //관리자 권한 부여
	    	  if (columnName === 'adminRole') {
	    		  
	    		  var dataToSend = { "adminRoll": rowData[columnName], "id": rowData['id'] };
	    		  
	    		  $.ajax({
	    		    url: '${ContextPath}/userAdminRollUpdate',
	    		    method: 'PUT',
	    		    async: true,
	    		    data: JSON.stringify(dataToSend),
	    		    contentType: 'application/json',
	    		    success: function(response) {
	    		    },
	    		    error: function(error) {
	    		    }
	    		  });
	    		}
	    	  
	    	});
	    }
	  });
	  
	  
		// 행 삭제
		  $('#deleteRowBtn').on('click', function() {
		    const checkedRows = grid.getCheckedRows();
		    var ids = [];
		    for (var i = 0; i < checkedRows.length; i++) {
		      ids.push(checkedRows[i].updateKey);
		    }
	    
	    $.ajax({
	      url: '${ContextPath}/deleteUserAjax',
	      type: 'DELETE',
	      async : true,
	      data: JSON.stringify(ids),
	      contentType: 'application/json',
	      success: function(result) {
	        
	        // 삭제된 행 재로딩
	        $.ajax({
	          url: '${ContextPath}/userManagementAjax?companyCode=${sessionScope.AUTHUSER.companyCode}',
	          method: 'GET',
	          dataType: 'JSON',
	          success: function(result) {
	            grid.resetData(result);
	          }
	        });
	      },
	      error: function(xhr, status, error) {
	        alert(DELETE_FAILED);
	      }
	    });
	  });
		
			// 검색 기능
		  $('#searchKeywordBtn, #searchKeyword').on('keyup', function(e) {
			    if (e.keyCode === 13) { // 엔터 키를 눌렀을 때
			        search();
					    }
					});
		
					$('#searchKeywordBtn').click(function(){
					    search();
					});
		
					function search() {
			    var searchKeyword = $("#searchKeyword").val();// input 태그의 값을 가져옵니다.
			    
			    // 검색 keyword ajax 요청
			    $.ajax({
			      url: "${ContextPath}/search", // 서버 url을 입력하세요.
			      type: "GET", // 요청 방식을 입력하세요. (POST, GET 등)
			      data: { keyword: searchKeyword }, // 넘겨줄 데이터를 입력하세요.
			      success: function(response) {
			    	  grid.resetData(response);// 그리드 데이터 업데이트
			      },
			      error: function(jqXHR, textStatus, errorThrown) {
			        // 실패 시 동작할 코드를 입력하세요.
			      }
			    });
			    
			  }
		});
</script>
<body>
        <!-- 테이블 버튼 구성 -->
        <div class="wrapper">
				  <div class="btn-wrapper" style="margin-bottom: 10px;">
				  	  <div class="inputBox">
				      <input type="text" name="searchKeyword" id="searchKeyword">
				      <div class="searchKeywordBtn">
				        <button id="search"  class="custom-button">이름 검색</button>
				      </div>
				    </div>
				    <div class="wrapper_rowBtn">
						  <button id="addRowBtn" class="custom-button"><i class="fas fa-plus"></i></button>
						  <button id="deleteRowBtn"  class="custom-button"><i class="fas fa-minus"></i></button>
						</div>
				  </div>
				</div>
        <!-- Toast Grid Load -->
  <div id="grid"></div>
</body>
</html>