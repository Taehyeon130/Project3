<%@page import="com.koreait.workinapp.domain.Commute"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
List <Commute>comList = (List)request.getAttribute("comList");
	int totalRecord=comList.size(); //총 게시물 수
	int pageSize=10; //페이지당 보여질 게시물 수
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize); //총 페이지 수 
	int blockSize=10; //하단의 페이지 링크 수
	int currentPage = 1; //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int firstPage = currentPage-((currentPage -1)%blockSize); //한페이지 블럭의 시작 페이지
	int lastPage = (firstPage+blockSize-1);
	int num = totalRecord -(currentPage-1)*pageSize;
	int curPos = (currentPage-1)*pageSize;
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WorkinApp</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/client/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/client/css/sb-admin-2.min.css" rel="stylesheet">
    <link href='/resources/client/lib/main.css' rel='stylesheet' />
    <script src='/resources/client/lib/main.js'></script>

<style>
    	#ctable{
    		background-color:#ffffff;
    	}
    	
    	td,tr {
        text-align: center;
      }
    
    
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">  
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            
            <!-- Main Content -->
            <div id="content">
                
                <!-- Topbar -->
                <%@include file="../inc/header.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Main Content -->
                <div class="container-fluid">
                <h4>출퇴근 기록</h4>
              <div class="card-body">
                <table class="table table-bordered table-hover" id="ctable" >
                  <thead>
                    <tr class="table-primary">
                      <th>No</th>
                      <th>유형</th>
                      <th>시간</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%for(int i=1;i<=pageSize;i++){ %>
                  <%if(num<1)break; %>
                  <%Commute com = comList.get(curPos++); %>
                    <tr>
                    <td><%=num--%></td>
                    <td>
                    	<%if(com.getCom_state()==0){ %>
                    		출근
                    	<%}else if(com.getCom_state()==1){ %>
                    		퇴근
                    	<%} %>
                    </td>
                      <td ><%=com.getCom_date()%></td>
                    </tr>
                    <%} %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
					<div class="container">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="/client/request/list?currentPage=<%=firstPage-1%>">Prev</a></li>
							<%for(int i=firstPage;i<=lastPage;i++){ %>
							<%if(i>totalPage)break; %>							
								<li class="page-item active"><a class="page-link" href="/client/request/list?currentPage=<%=i%>"><%=i %></a></li>
							<%} %>							
							<li class="page-item"><a class="page-link" href="/client/request/list?currentPage=<%=lastPage+1%>">Next</a></li>
						</ul>
					</div>

				</div>
            </div>
            <!-- End of Main Content -->

			<!-- 모달창 -->
			<%@include file="../inc/detail_modal.jsp" %>

            <!-- Footer -->
            <%@include file="../inc/footer.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

       <!-- Logout Modal start-->
    <%@include file="../inc/logout_modal.jsp" %>
    <!-- Logout Modal end-->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/client/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/client/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/client/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/client/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/client/js/demo/chart-area-demo.js"></script>
    <script src="/resources/client/js/demo/chart-pie-demo.js"></script>



</body>

</html>