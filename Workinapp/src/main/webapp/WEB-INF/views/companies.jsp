<%@page import="com.koreait.workinapp.domain.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.workinapp.domain.Employee"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Employee employee = (Employee)session.getAttribute("Employee");
	List<Company> companyList = (List)request.getAttribute("companyList"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WorkinApp</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">  
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            
            <!-- Main Content -->
            <div id="content">
                
                <!-- Topbar -->
                <nav class="navbar navbar-expand bg-primary topbar static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/companies">
                        <div class="sidebar-brand-text mx-4 text-light">WorkIn <sup>app</sup></div>
                    </a>
                    <ul class="navbar-nav ml-auto">
                     <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline small text-light"><%=employee.getE_name() %>님 환영합니다</span>
                                <i class="fas fa-cog text-light"></i>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid" style="min-height: 800px !important;">
                    <div class="container">
                        <div class="row justify-content-center" style="padding-top: 184px; padding-bottom: 2rem;">
                            <div class="col-12 col-md-8">
                                <h3 class="text-dark font-weight-bold text-primary">회사선택</h3>
                               총 회사 수 : <%=companyList.size() %>개
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-8">
                                <div class="row sft-companies-list-header" style="padding-left: 20px; padding-right: 1.5rem;">
                                    <div class="col-9">
                                        <b>회사명</b>
                                    </div>
                                    <div class="col-3">
                                        <b>액세스 권한</b>
                                    </div>
                                </div>
                                <!---->
                                <%for(Company obj : companyList){ %>
                                <div class="card border-left-primary shadow py-3 mt-3">
                                    <div class="card-body" onclick="getCompany(<%=obj.getC_pk()%>,'<%=obj.getC_name() %>')">
                                        <div class="row">
                                            <div class="col-9 sft-company-name" >
                                            	<input type="hidden" name="c_pk" value="<%=obj.getC_pk()%>">
                                                <b><%=obj.getC_name() %></b>
                                            </div>
                                            <div class="col-3 sft-access-level">
                                                <span class="sft-text-color-gray">최고관리자</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} %>
                                <!---->
                                <div class="row-cols-1 detailModal" style="margin-top: 15px; padding-top: 1rem; padding-bottom: 1rem; background-color: transparent; border: 1px dashed #a5adb8;">
                                    <div class="col-12 text-center">
                                        <a class="btn">
                                            <i class="fas fa-plus"></i>
                                            <span>
                                                <b>회사 만들기</b>
                                                <br>(최고관리자용)</span>
                                            </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--  -->
                </div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; WorkinApp 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

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
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 회사 생성 폼 -->
    <!-- Detail Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h5 class="modal-title text-gray-900">회사만들기 (최고관리자)</h5>
            <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body text-gray-900">
                <form id="registForm">
                    <div class="form-group row">
                      <label class="col-3">회사명</label>
                      <input type="text" class="col-6" name="c_name">
                    </div>
                    <div class="form-group row">
                      <label class="col-3">전화 번호</label>
                      <input type="text" class="col-6" name="c_phone">
                    </div>
                    <div class="form-group row">
                      <label class="col-3">주소</label>
                      <input type="text" class="col-6" name="c_addr">
                    </div>
                    <div class="form-group row">
                        <label class="col-3">회사코드*</label>
                        <input type="text" class="col-6" name="c_code">
                    </div>
                  </form>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="registCompany()">생성하기</button>
            </div>
            
        </div>
        </div>
    </div>
    
	<!-- 회사 로그인 모델 -->
    <!-- Detail Modal -->
    <div class="modal fade" id="loginCompany">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h5 class="modal-title text-gray-900" id="c_title"></h5>
            <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body text-gray-900">
                <form id="loginForm">
                    <div class="form-group row">
                      <label class="col-2">코드</label>
                      <input type="hidden" value="<%=employee.getE_pk()%>" name="e_pk">
                      <input type="text" class="col-4" name="c_pk" id="c_pk">
                      <input type="text" class="col-4" name="c_code">
                    </div>
                  </form>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="loginCompany()">입장</button>
            </div>
            
        </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/admin/js/demo/chart-area-demo.js"></script>
    <script src="/resources/admin/js/demo/chart-pie-demo.js"></script>

    <script>
        $(function(){
          $(".detailModal").click(function(){
            $("#myModal").modal({backdrop: "static"});
          });        
        });
        
        function getCompany(pk, name) {
        	$("#loginCompany").modal({
        		backdrop: "static"
       		});
        	$("#c_pk").val(pk);
        	$("#c_title").html(name);
		}
        
        function registCompany() {
        	$("#registForm").attr({
        		"action" : "/main/companies/create",
        		"method" : "post"
        	});
        	$("#registForm").submit();
		}
        
        function loginCompany() {
        	$("#loginForm").attr({
        		"action" : "/main/companies/login",
        		"method" : "post"
        	});
        	$("#loginForm").submit();			
		}
    </script>
</body>

</html>