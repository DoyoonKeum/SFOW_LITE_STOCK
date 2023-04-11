<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="./resources/tui-grid.js"></script>
   <link rel="stylesheet" href="./resources/tui-grid.css" type="text/css"/>

<title>Insert title here</title>
  <style>
  .btn-wrapper {
  display: flex;
  justify-content: flex-end; /* 변경 */
}



.inputBox,
.searchKeywordBtn {
  display: inline-block;
}

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

#delete-row-btn:hover, #delete-row-btn2:hover, #reset:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}

#add-row-btn:hover, #add-row-btn2:hover {
  background-color: rgba(80, 201, 141);
  opacity: 0.8;
}

	
</style>
</head>
<script>


$(document).ready(function() {
	
	
	
     const grid = new tui.Grid({
       el: document.getElementById('grid'),
       scrollX: false,
       scrollY: true,
       rowHeaders: ['checkbox','rowNum'],
       bodyHeight: 300,
       columns: [
    	   {
               header: '거래처코드',
               name: 'client_Code',
               editor: 'text',
            	   align: 'center',
            	   sortable: true,
                   filter: {
                       type: 'text',
                       showApplyBtn: true,
                       showClearBtn: true 
                   }
    	   },
                   {
                       header: '회사코드',            
                       name: 'company_code',
                       align: 'center',
                   },
             {
                 header: '회사명',             // [필수] 컬럼 이름
                 name: 'client_Name',
                 align: 'center',// [필수] 컬럼 매핑 이름 값
                 editor: 'text',
                 sortable: true,
                 filter: {
                     type: 'text',
                     showApplyBtn: true,
                     showClearBtn: true 
                 },
                 validation: {
                     dataType: 'string',
                     required: true
                   }
                 
                },

             {
               header: '대표자',
               name: 'ceo_Name',
               align: 'center',
               editor: 'text',
             },
            
             {
               header: '전화번호',
               name: 'client_Phone',
               align: 'center',
               editor: 'text',
               validation: {
                   dataType: 'string',
                   required: true
                 }
             },
             {
                  header: 'email',
                  name: 'client_Email',
                  align: 'center',
                  editor: 'text',
                  validation: {
                      dataType: 'string',
                      required: true
                    }
                },
             	{
                 header: '등록일',
                 name: 'create_Date',
                 align: 'center',
                 hidden:true
               	},
                {
                 header: '수정일',
                 name: 'update_Date',
                 align: 'center',
                 hidden:true
                 }
        ]
        
     });
     
     
      
     
     
     $('#add-row-btn').on('click', function(event) {
    	    event.preventDefault(); // 기본 동작 막기
    	    var now = new Date();
  		  var currentDate = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + ('0' + now.getDate()).slice(-2) + '-' + ('0' + now.getHours()).slice(-2);


    	    // 새로운 데이터 생성
    	    const newRowData = {
    	        client_Code: '',
    	        company_code: '${sessionScope.AUTHUSER.companyCode}',
    	        client_Name: '',
    	        ceo_Name: '',
    	        client_Phone: '',
    	        client_Email: '',
    	        create_Date: '',
    	        update_Date: '',
    	    };
    	    console.log("newRowData", newRowData);
    	      
    	    // 새로운 행 추가
    	    const newRowKey = grid.appendRow(newRowData); 
    	    console.log("newRowKey",newRowKey);
    	    
    	    // 새로운 행의 정보 전송
    	    $.ajax({
    	        url: '${ContextPath}/insert',
    	        type: 'POST',
    	        data: JSON.stringify(newRowData),
    	        contentType: 'application/json',
    	        success: function(result) {
    	            console.log(result);
    	            
    	            $.ajax({
    	                url: '${ContextPath}/cpm?companyCode=${sessionScope.AUTHUSER.companyCode}',
    	                method: 'GET',
    	                dataType: 'JSON',
    	                success: function(result) {
    	                    console.dir(result); //배열인지 확인.
    	                    grid.resetData(result);
    	                },
    	                error: function(xhr, status, error) {
    	                    console.log(xhr.responseText);
    	                }
    	            });
    	            alert('사용자가 추가되었습니다.');
    	        }
    	    }); 
    	});

     
     
   //행 모든 데이터 불러오기
     $.ajax({
         url: '${ContextPath}/cpm?companyCode=${sessionScope.AUTHUSER.companyCode}',
         method: 'GET',
         dataType: 'JSON',
         success: function(result) {
             console.dir(result); //배열인지 확인.
             grid.resetData(result);

             grid.on('editingFinish', function(ev) {
                 const rowKey = ev.rowKey;
                 const columnName = ev.columnName;
                 var updatedData = {};
                 const rowData = grid.getRow(rowKey);
                 console.log('Row data: ', rowData);

               //이메일 유효성 검사
                 if (columnName === 'client_Email') {
                   var emailValue = rowData[columnName];
                   if (!emailValue || emailValue.indexOf('@') === -1) {
                     alert('이메일 주소에는 @ 문자가 포함되어야 합니다.');
                     return;
                   }
                 }
                 
                 
                 $.ajax({
                	    url: '${ContextPath}/update',
                	    method: 'PUT',
                	    dataType: 'text',
                	    data: JSON.stringify(rowData),
                	    contentType: 'application/json',
                	    success: function(response) {
                	        console.log('Success:', response);
                	    },
                	    error: function(error) {
                	        console.log('Error:', error);
                	    }
                	});



             });
         }
     });



     $('#delete-row-btn').on('click', function(event) {
    	  event.preventDefault();
    	  const checkedRows = grid.getCheckedRows();
    	  var no = [];
    	  var client_Codes = [];
    	  for (var i = 0; i < checkedRows.length; i++) {
    	    client_Codes.push(checkedRows[i].no);
    	  }

    	  $.ajax({
    	    url: '${ContextPath}/deletecpm',
    	    type: 'DELETE',
    	    data: JSON.stringify(client_Codes[0]),
    	    contentType: 'application/json',
    	    success: function(result) {
    	      console.log(result);
    	      alert('삭제되었습니다.');

    	      // 그리드에서 선택한 행을 삭제합니다.
    	      grid.removeCheckedRows();

    	      // 선택한 행을 삭제하지 않고 표시를 변경할 경우, 아래와 같이 사용합니다.
    	      // for (var i = 0; i < checkedRows.length; i++) {
    	      //   grid.removeRow(checkedRows[i].updateKey);
    	      // }
    	    },
    	    error: function(xhr, status, error) {
    	      console.log(xhr.responseText);
    	      alert('삭제에 실패했습니다.');
    	    }
    	  });
    	});

  
  
});


   
</script>
<body>
<h3>거래처 정보</h3>
  <div class="wrapper">
 <div class="btn-wrapper" style="margin-bottom: 10px;">


         <!-- 테이블 버튼 구성 -->
         <div class="wrapper_rowBtn">
						  <button id="add-row-btn" class="custom-button"><i class="fas fa-plus"></i></button>
						  <button id="delete-row-btn" class="custom-button"><i class="fas fa-minus"></i></button>
						</div>
       
        </div>
        </div>
        <!-- Toast Grid Load -->
  <div id="grid"></div>
  
  
</body>
</html>