<%@page import="com.koreait.workinapp.domain.Requests"%>
<%@page import="com.koreait.workinapp.domain.Work"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
List<Requests> workList = (List) request.getAttribute("workList");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>WorkinApp</title>

<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link href='/resources/admin/lib/main.css' rel='stylesheet' />
<script src='/resources/admin/lib/main.js'></script>
<script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
		var test;
		
        var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '100%',
        expandRows: true,
        slotMinTime: '08:00',
        slotMaxTime: '20:00',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        initialView: 'dayGridMonth',
        initialDate: '2021-08-19',
        //navLinks: true, // can click day/week names to navigate views
       // editable: true,
        //selectable: true,
        nowIndicator: true,
        dayMaxEvents: true, // allow "more" link when too many events
         events: [ 	
        	 <%for (Requests obj : workList) {%>
	        	 {
	        		color:'#1cc88a',
	    	 		title:'<%=obj.getEmployee().getE_name()%>',
	    	 		start: '<%=obj.getReq_date()%>',
	        	 },
       	 	<%}%>
         ],
         eventRender:function(event,element){
        	 if(event.test=='test'){
        		 alert('동일');
        	 }
         },
         eventClick:function(info){
        	//alert('이름: ' + info.event.title + "날짜" + info.event.start);
       		getDetailModal(info);
         }
        
        });
        calendar.render();
    });

    </script>
<style>
#calendar-container {
	width: 100%;
	height: 1000px;
	margin: 20px auto;
	/* padding: 0 10px; */
}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="../inc/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column bg-white">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="../inc/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-wrapper">
					<div class="container-fluid">
						<!-- Page Heading -->
						<div
							class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h4 mb-0 text-gray-800 today"></h1>
							<div
								class="d-none d-sm-inline-block btn btn-sm-1 btn-primary shadow-sm">
								<i class="fas fa-user-friends"></i> 총직원수 : 3
							</div>
						</div>
						<div class="row">

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-12 col-md-6 mb-4">
								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xm font-weight-bold text-success text-uppercase mb-1">
													승인 완료된 근무</div>
												<div class="h2 mb-0 font-weight-bold text-gray-800"><%=workList.size() %></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Calendar -->
						<div class="card shadow">
							<div class="card-body">
								<div id='calendar-container'>
									<div id='calendar'></div>
								</div>
							</div>
						</div>
						<!-- /.container-fluid -->
					</div>

				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<!-- <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; WorkinApp 2021</span>
                        </div>
                    </div>
                </footer> -->
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Detail Modal -->
	<div class="modal fade" id="detail_modal">
		<div class="modal-dialog">
			<div class="modal-content border-left-primary">

				<!-- Modal Header -->
				<div class="modal-header">
					<div class="modal-title text-gray-900"></div>
					님의 근무 일정
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-6">
							<label for="recipient-name" class="col-form-label">요청 종류</label>
							<input type="text" class="form-control" disabled="disabled" id="top">
						</div>
						<div class="col-6">
							<label for="message-text" class="col-form-label">요청 사항</label> <input
								type="text" class="form-control" disabled="disabled" id="sub">
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label for="message-text" class="col-form-label">날짜</label> <input
								type="text" class="form-control" disabled="disabled" id="date">
						</div>
						<div class="col-12">
							<label for="message-text" class="col-form-label">요청 사유</label>
							<textarea class="form-control" disabled="disabled" id="note"></textarea>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/admin/js/demo/chart-area-demo.js"></script>
	<script src="/resources/admin/js/demo/chart-pie-demo.js"></script>

	<script>
		function getDetailModal(info) {
			$("#detail_modal").modal({
				backdrop : "static"
			});
			$(".modal-title").text(info.event.title);

		}
		
		var today = new Date();

	    var year = today.getFullYear();
	    var month = ('0' + (today.getMonth() + 1)).slice(-2);
	    var day = ('0' + today.getDate()).slice(-2);

	    var dateString = year + '-' + month  + '-' + day;

	    console.log(dateString);
	    $(".today").html(dateString)
	</script>
</body>

</html>