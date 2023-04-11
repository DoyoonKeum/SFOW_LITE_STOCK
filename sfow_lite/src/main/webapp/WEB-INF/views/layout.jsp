<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">



<title>SFOW MAIN</title>


<!-- Custom fonts for this template-->
    <link href="${conPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${conPath}/resources/css/main/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${conPath}/home">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SFOW_LITE</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
           <li class="nav-item active">
    		<a class="nav-link" href="javascript:acyncMovePage('${conPath}/main3');">
        		<i class="fas fa-fw fa-tachometer-alt"></i>
        		<span>공지사항</span>
    		</a>
		</li>



            <!-- Divider -->
            <hr class="sidebar-divider">
			
			
            <!-- Nav Item -사용자관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>사용자관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="javascript:acyncMovePage('${conPath}/updateUser');">개인정보수정</a>
                        <c:if test="${sessionScope.AUTHUSER.adminRole==999}">
                        <a class="collapse-item" href="javascript:acyncMovePage('${conPath}/userManagement');">사용자 계정관리</a>
                        </c:if>
                    </div>
                </div>
            </li>

            <!-- Nav Item - 기준정보 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>기준정보</span>
                </a>
                
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    
                    
                    
                    <!-- 승 -->   <c:if test="${sessionScope.AUTHUSER.adminRole==999}">
                    <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapsecompany"
                      aria-expanded="false" aria-controls="collapseItem">거래처정보</a>
                        <div id="collapsecompany" class="collapse" aria-labelledby="collapsecompany" data-parent="#collapseUtilities">
                        <a class="collapse-item" href="javascript:acyncMovePage('${conPath}/main2');">거래처정보등록</a></div>
                        </c:if>
                    <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapseCompanyInfo"
                      aria-expanded="false" aria-controls="collapseCompanyInfo">회사정보</a>
                        <div id="collapseCompanyInfo" class="collapse" aria-labelledby="headingItem" data-parent="#collapseUtilities">
                            <a class="collapse-item" href="javascript:acyncMovePage('${conPath}/companyInfo?companyCode=${sessionScope.AUTHUSER.companyCode}');">회사정보수정</a>
                           </div>
                    
                    <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapseItem"
                      aria-expanded="false" aria-controls="collapseItem">품목관리정보</a>
                        <div id="collapseItem" class="collapse" aria-labelledby="headingItem" data-parent="#collapseUtilities">
                            <a class="collapse-item" href="#">품목등록</a>
                            <a class="collapse-item" href="#">품목조회</a>
                           </div>
	                 <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapseWarehouse"
	                        aria-expanded="false" aria-controls="collapseWarehouse">창고관리정보</a>
	                           <div id="collapseWarehouse" class="collapse" aria-labelledby="headingWarehouse" data-parent="#collapseUtilities">
	                                  <a class="collapse-item" href="#">창고등록</a>
	                                  <a class="collapse-item" href="#">창고정보</a>
	                          </div>
                    </div>
                </div>
            </li>



            <!-- Nav Item - 영업관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>영업관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
       
                          <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapseItem"
                      aria-expanded="false" aria-controls="collapseItem">수주관리</a>
                        <div id="collapseItem" class="collapse" aria-labelledby="headingItem" data-parent="#collapseUtilities">
                            <a class="collapse-item" href="#">견적서 등록</a>
                            <a class="collapse-item" href="#">수주서 관리</a>
                           </div>
                 <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapseWarehouse"
                        aria-expanded="false" aria-controls="collapseWarehouse">출하관리</a>
                           <div id="collapseWarehouse" class="collapse" aria-labelledby="headingWarehouse" data-parent="#collapseUtilities">
                                  <a class="collapse-item" href="#">출하 등록</a>
                                  <a class="collapse-item" href="#">출하 조회</a>
                          </div>
                 <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapseWarehouse2"
                        aria-expanded="false" aria-controls="collapseWarehouse2">반품관리</a>
                           <div id="collapseWarehouse2" class="collapse" aria-labelledby="headingWarehouse2" data-parent="#collapseUtilities">
                                  <a class="collapse-item" href="#">반품등록</a>
                                  <a class="collapse-item" href="#">반품현황</a>
                          </div>
                    </div>
                </div>
            </li>
            
              <!-- Nav Item -구매관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo2"
                    aria-expanded="true" aria-controls="collapseTwo2">
                  <i class="fas fa-fw fa-folder"></i>
                    <span>구매관리</span>
                </a>
                <div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="#">구매요청</a>
                        <a class="collapse-item" href="#">구매입고등록</a>
                    </div>
                </div>
            </li>
            
              <!-- Nav Item -생산관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo3"
                    aria-expanded="true" aria-controls="collapseTwo3">
                  <i class="fas fa-fw fa-folder"></i>
                    <span>생산관리</span>
                </a>
                <div id="collapseTwo3" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="javascript:acyncMovePage('${conPath}/product/pp');">작업지시</a>
                    </div>
                </div>
            </li>
             
                  <!-- Nav Item -재고관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo4"
                    aria-expanded="true" aria-controls="collapseTwo4">
                  <i class="fas fa-fw fa-folder"></i>
                    <span>재고관리</span>
                </a>
                <div id="collapseTwo4" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">

                        <a class="collapse-item" href="javascript:acyncMovePage('${conPath}/stockSearch');">창고별 재고현황</a>
                        <a class="collapse-item" href="javascript:acyncMovePage('${conPath}/stockByItem');">품목별 재고현황</a>
                      

                    </div>
                </div>
            </li>
            



        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <!-- <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form> -->

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter"></span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                   	 새로운 알림
                                </h6>
                                <!-- <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a> -->
                                    <div>
                                        <span class="font-weight-bold" style="margin: 10px;">새로운 알림이 없습니다.</span>
                                    </div>
                                <!-- <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a> -->
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter"></span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">메세지 센터</h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="${conPath}/resources/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.AUTHUSER.id}</span>
                                <img class="img-profile rounded-circle"
                                    src="${conPath}/resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="javascript:acyncMovePage('${conPath}/updateUser');">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                
                
                
                
                
                
         <!-- body -->
        <div id="bodyContents">     
				</div>
		
		
		
		
		</div>
            <!-- End of Main Content -->


        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="${conPath}/userLogout">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${conPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${conPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${conPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <script>
    
    $(document).ready(function() {
    	
    	$.ajax({
    	    url: "${conPath}/main3",
    	    async : true,
            type : "GET",
            dataType : "html",
            cache : false,
    	    success: function(data) {
    	    	$("#bodyContents").html(data);
    	    },
    	    error: function(){
    	    	alert("error")
    	    }
    	});
    });

	function acyncMovePage(url) {
		  $.ajax({
			  url : url,
	          async : true,
	          type : "GET",
	          dataType : "html",
	          cache : false,
		      success: function(data) {
		    	$('#bodyContents').children().remove();
	            // Contents 영역 교체
	            $('#bodyContents').html(data);
		      },
		      error: function(request, status, error) {
		        alert(error);
		    }
		  });
	}
	</script>

</body>

</html>
