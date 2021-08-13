<%@page import="com.koreait.workinapp.paging.PagingManager"%>
<%@page import="com.koreait.workinapp.domain.Requests"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
List<Requests> workList = (List) request.getAttribute("workList");
PagingManager pm = (PagingManager) request.getAttribute("pm");
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
							<h1 class="h4 mb-0 text-gray-800">근무일정</h1>
							<div class="">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="#">홈</a></li>
									<li class="breadcrumb-item active">근무일정</li>
									<li class="breadcrumb-item active">목록형</li>
								</ol>
							</div>
						</div>
						<table class="table table-hover text-gray-900">
							<thead>
								<tr>
									<th>요청 종류</th>
									<th>요청 사항</th>
									<th>이름</th>
									<th>날짜</th>
									<th>요청 사유</th>
									<th>승인권자</th>
								</tr>
							</thead>
							<tbody>
								<%
								int curPos = pm.getCurPos();
								int num = pm.getNum();

								for (int i = 0; i < pm.getPageSize(); i++) {
									if (num < 1)
										break;
									Requests obj = workList.get(curPos++);
								%>
								<tr
									onClick="getDetailModal('<%=obj.getEmployee().getE_name()%>','<%=obj.getTopCategory().getTop_name()%>','<%=obj.getSubCategory().getSub_name()%>','<%=obj.getReq_date()%>','<%=obj.getReq_note()%>')">
									<td><%=obj.getTopCategory().getTop_name()%></td>
									<td><%=obj.getSubCategory().getSub_name()%></td>
									<td><%=obj.getEmployee().getE_name()%></td>
									<td><%=obj.getReq_date()%></td>
									<td><%=obj.getReq_note()%></td>
									<td><%=obj.getReq_master()%></td>
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
								<li class="page-item"><a class="page-link"
									href="/admin/scheduler/list" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
								</a></li>
								<tr>
									<td colspan="9" style="text-align: center">
										<%
										for (int i = pm.getFirstPage(); i <= pm.getLastPage(); i++) {

											if (i > pm.getTotalPage())
												break;
										%>
										<li class="page-item active"><a class="page-link" href="/admin/scheduler/list?currentPage=<%=i%>"><%=i%></a></li> 
										<% }%>
									</td>
								</tr>

								<li class="page-item"><a class="page-link"
									href="/admin/scheduler/list" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
						<!-- /PageNation -->
					</div>
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

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Detail Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content border-left-primary">

				<!-- Modal Header -->
				<div class="modal-header">
					<div class="modal-title text-gray-900"></div>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-6">
							<label for="recipient-name" class="col-form-label">요청 종류</label>
							<input type="text" class="form-control" disabled="disabled"
								id="top">
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
		function getDetailModal(name, top, sub, date, note) {
			$("#myModal").modal({
				backdrop : "static"
			});
			$(".modal-title").text(name + "님의 근무일정");
			$("#top").val(top);
			$("#sub").val(sub);
			$("#date").val(date);
			$("#note").val(note);
		}
	</script>
</body>

</html>