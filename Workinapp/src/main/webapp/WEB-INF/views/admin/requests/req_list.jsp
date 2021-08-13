<%@page import="com.koreait.workinapp.domain.Requests"%>
<%@page import="com.koreait.workinapp.paging.PagingManager"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Requests> workList = (List)request.getAttribute("workList");
	PagingManager pm = (PagingManager)request.getAttribute("pm");

%>
<!DOCTYPE html>
<html lang="en">

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
<!-- Font Awesome -->

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
						<div
							class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h4 mb-0 text-gray-900">요청관리</h1>
							<div class="">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="#">홈</a></li>
									<li class="breadcrumb-item active">요청</li>
								</ol>
							</div>
						</div>
						<table class="table table-hover text-gray-900">
							<thead>
								<tr>
									<th>요청 종류</th>
									<th>요청 보낸 사람</th>
									<th>요청 사항</th><!-- 요청날짜 + 시간 ()-->
									<th>부서</th>
									<th>직책</th>
									<th>총시간</th>
									<th>상태</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<%
								int curPos=pm.getCurPos();
								int num=pm.getNum();
								
								for (int i=0;i<pm.getPageSize();i++) {
									if(num<1)break;
									Requests obj=workList.get(curPos++);	
								%>
								<tr>
									<input type="hidden" value="">
									<td><%=obj.getTopCategory().getTop_name() %></td>
									<td><%=obj.getEmployee().getE_name() %></td>
									<td><%=obj.getReq_date() %></td>
									<td>없음</td>
									<td>없음</td>
									<td>9시간</td>
									<td><button class="btn btn-warning">대기중</button></td>
									<td>
										<button class="btn btn-outline-primary detailModal" onClick="getAppModal(<%=obj.getReq_pk()%>)">승인</button>
										<button class="btn btn-outline-danger rejectModal" onClick="getRejectModal(<%=obj.getReq_pk()%>)">거절</button>
									</td>
								</tr>
								<%
								num--;
								}
								%>
							</tbody>

						</table>
						<!-- /.container-fluid -->
						<!-- PageNation -->
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="/admin/requests/req/list"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only" >Previous</span>
								</a></li>
								<tr>
									<td colspan="9" style="text-align:center">
										<%for(int i=pm.getFirstPage();i<=pm.getLastPage();i++){ %>
										<%if(i>pm.getTotalPage())break; %>
										<li class="page-item active">
										<a class="page-link" href="/admin/requests/req/list?currentPage=<%=i%>"><%=i %></a></li>
										<%} %>
									</td>
								</tr>
								
								<li class="page-item"><a class="page-link" href="/requests/req/list"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only" >Next</span>
								</a></li>
							</ul>
						</nav>
						<!-- /PageNation -->
					</div>

				</div>
				<!-- End of Main Content -->
			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Approve Modal -->
		<div class="modal fade" id="approve_modal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<div class="modal-title text-gray-900">해당 요청을 승인하시겠습니까?</div>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form id="approveForm">
							<input type="hidden" class="req_pk" name="req_pk">
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="approve()">승인하기</button>
					</div>

				</div>
			</div>
		</div>
		
		<!-- Reject Modal -->
		<div class="modal fade" id="reject_modal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<div class="modal-title text-gray-900">해당 요청을 거절하시겠습니까?</div>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form id="rejectForm">
							<input type="hidden" class="req_pk" name="req_pk">
						<label>거절 사유</label>
						<textarea class="form-control form-control-user" name="req_note"></textarea>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal" onClick="reject()">거절하기</button>
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
			//승인 요청 모델
			function getAppModal(num) {
				$("#approve_modal").modal({
					backdrop : "static"
				});
				$(".req_pk").val(num);
			}
			
			
			//근무 요청 승인
			function approve() {
				$("#approveForm").attr({
					"action" : "/admin/requests/req/approve",
					"method" : "post"
				});
				$("#approveForm").submit();
			}
			
			//거절 요청 모델
			function getRejectModal(num) {
				$("#reject_modal").modal({
					backdrop : "static"
				});
				$(".req_pk").val(num);
			}
			
			//근무 요청 거절
			function reject() {
				$("#rejectForm").attr({
					"action" : "/admin/requests/req/reject",
					"method" : "post"
				});
				$("#rejectForm").submit();
			}
		</script>
</body>

</html>