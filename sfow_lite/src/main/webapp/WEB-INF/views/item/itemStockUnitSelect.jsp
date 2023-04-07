<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목유형 코드등록</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/main/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>

window.onload = function(){
	
	const Grid = tui.Grid;
	const grid = new Grid({
		
		el: document.getElementById('grid'),
        scrollX: true,
        scrollY: true,
       
        rowHeaders: [
          { type: 'rowNum', align: 'center'},	
    	  { type: 'checkbox' }
        ],
        columns: [
          {
            header: '재고단위',
            name: 'item_stock_unit',
            align: 'center',
            editor:'text'
          }
        ]
      });
	
	$.ajax({
        url : './stockunitListAjax',
        method :'GET',
        dataType : 'JSON',
        success : function(result){
            grid.resetData(result);
             } //success끝 
          }); //typeSelectAjax끝
          
          grid.on('check', function(ev) {	
		      
			const rowKey = ev.rowKey;
          	const columnName = ev.columnName;
          	const rowData = grid.getRow(rowKey);
          	const item_stock_unit = rowData.item_stock_unit;
    		
          	console.log('check!', ev);
    		console.log('check!', rowData);
    		console.log('check!', rowData.item_stock_unit);

    		  Array.prototype.forEach.call(document.querySelectorAll('#subBtn'), el => {
			      el.addEventListener('click', ev => {  
			    	
			    	console.log('item_stock_unit!', item_stock_unit);
			    	grid.setValue(sp.rowKey,sp.columnName,item_stock_unit) 
			    	 window.close();
			    	 
		          }); //addEventListener끝
		    	}); //subBtn 끝
			    	  
   	}); //grid.on('check')끝    
	
          grid.on('click', function(ev) {
				
			const rowKey = ev.rowKey;
          	const columnName = ev.columnName;
          	const rowData = grid.getRow(rowKey);
          	
          	$('input[name=item_stock_unit]').attr('value',rowData.item_stock_unit);
			});
			
			 Array.prototype.forEach.call(document.querySelectorAll('#searchBtn'), el => {   
	           	 el.addEventListener('click', ev => {
	           		 
	           var item_stock_unit = $("#search_area input[name='item_stock_unit']").val();
	           		           
	           console.log('item_stock_unit:', item_stock_unit);
	           
	           $.ajax({
	       		type: 'POST',
	       		dataType: 'JSON',
	       		url: './stockunitSearchAjax',
	       		contentType: 'application/json',
	       	    data: JSON.stringify({	
	       	    	"item_stock_unit": item_stock_unit
	       	        }),
	       		success: function(data) {
	       			 gridData=data
	       	         grid.resetData(data)      
	               	},
	               error: function(error) {
	                   console.log('Error:', error);
	               	}
	           });	         
	           	 });
	           });			
};
</script>
<body>
<div>
<br>
<div id="search_area">
    <input type="text" id="item_stock_unit" name="item_stock_unit" value="">
	<button type="submit" id="searchBtn">조회</button>
</div>
<br/>
<div id="grid"></div>
</div>
<button onClick='self.close()'>닫기</button>
<button onClick='reset()'>초기화</button>
<button id="subBtn">적용</button>
<script>
</script>
</body>
</html>