<%@page import="com.koreait.workinapp.paging.PagingManager"%>
<%@page import="com.koreait.workinapp.domain.Work"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
				<div class="container">
					<div class="card">
						<!-- 카드 헤더 -->
						<div class="card-header bg-primary text-white">
							<h4 class="text-uppercase text-center">계정 설정</h4>
						</div>
						<div class="card-body">
							<form>

								<div class="form-row">
									<div class="col-md-12" style="margin-bottom: 15px;">
										<b><h5>계정 정보</h5></b>
									</div>
								</div>
								<div class="form-row">
									<div class="col-md-6">
										<label>이름</label> <input type="text"
											value="<%=employee.getE_name()%>" class="form-control"
											readonly />
									</div>
									<div class="col-md-6">
										<label>이메일</label> <input type="text"
											value="<%=employee.getE_mail()%>" class="form-control"
											readonly />
									</div>
								</div>


								<hr class="my-5">


								<div class="form-row">
									<div class="col-md-8" style="margin-bottom: 15px;">
										<b><h5>이메일</h5></b>
									</div>
									<div class="col-md-4">
										<h10> 이메일 주소를 변경하세요 </h10>
									</div>
								</div>
								<form id="form1">
									<input type="hidden" value="<%=employee.getE_pk()%>"
										name="e_pk">
									<div class="form-row">
										<div class="col-md-7">
											<input type="text" placeholder="Email" class="form-control"
												id="email" />
										</div>
										<div class="col-md-5">
											<button type="button" class="btn btn-primary rounded-0"
												disabled="true" id="c_mail" name="e_mail">변경</button>
										</div>
									</div>
								</form>


								<hr class="my-5">


								<div class="form-row">
									<div class="col-md-8" style="margin-bottom: 15px;">
										<b><h5>비밀번호</h5></b>
									</div>
									<div class="col-md-4">
										<h10> 비밀번호를 변경하세요 </h10>
									</div>
								</div>

								<div class="form-row">
									<div class="col-md-7" style="margin-bottom: 10px;">
										<input type="text" placeholder="현재 비밀번호" class="form-control"
											id="orgin_pwd" />
									</div>
									<div class="col-md-5"></div>
								</div>

								<div class="form-row">
									<div class="col-md-7" style="margin-bottom: 10px;">
										<input type="text" placeholder="새 비밀번호" class="form-control"
											id="new_pwd" />
									</div>
									<div class="col-md-5"></div>
								</div>

								<div class="form-row">
									<div class="col-md-7">
										<input type="text" placeholder="새 비밀번호 확인"
											class="form-control" id="new_pwd_second" />
									</div>
									<div class="col-md-5">
										<button type="button" class="btn btn-primary rounded-0"
											disabled="true" id="pwd">비밀번호 변경</button>
									</div>
								</div>


								<hr class="my-5">


								<div class="form-row">
									<div class="col-md-8" style="margin-bottom: 15px;">
										<b><h5>회원 탈퇴</h5></b>
									</div>
									<div class="col-md-4">
										<h10> 삭제된 계정은 되돌릴 수 없습니다. </h10>
									</div>
								</div>

								<div class="form-row">
									<div class="col-md-7">
										<input type="text" placeholder="비밀번호 확인" class="form-control"
											id="out" />
									</div>
									<div class="col-md-5">
										<button type="button" class="btn btn-danger rounded-0"
											disabled="true" id="out_bt">계정 탈퇴</button>
									</div>
								</div>


								<hr class="my-5">

							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
	</div>
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
						<input type="hidden" class="w_pk" name="w_pk">
					</form>
					<textarea class="form-control form-control-user"></textarea>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onClick="approve()">승인하기</button>
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
						<input type="hidden" class="w_pk" name="w_pk">
					</form>
					<textarea class="form-control form-control-user"></textarea>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onClick="reject()">거절하기</button>
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
			$(".w_pk").val(num);
		}

		//근무 요청 승인
		function approve() {
			$("#approveForm").attr({
				"action" : "/admin/requests/work/approve",
				"method" : "post"
			});
			$("#approveForm").submit();
		}

		//거절 요청 모델
		function getRejectModal(num) {
			$("#reject_modal").modal({
				backdrop : "static"
			});
			$(".w_pk").val(num);
		}

		//근무 요청 거절
		function reject() {
			$("#rejectForm").attr({
				"action" : "/admin/requests/work/reject",
				"method" : "post"
			});
			$("#rejectForm").submit();
		}
	</script>
</body>

</html>