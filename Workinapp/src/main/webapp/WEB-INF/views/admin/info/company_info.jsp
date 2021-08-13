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
							<h4 class="text-uppercase text-center">회사 설정</h4>
						</div>
						<div class="card-body">
								<div class="form-row">
									<div class="col-md-12" style="margin-bottom: 15px;">
										<b><h5>회사 정보</h5></b>
									</div>
								</div>
								<div class="form-row">
									<div class="col-md-6">
										<label>회사명</label> <input type="text"
											value="<%=company.getC_name()%>" class="form-control"
											readonly />
									</div>
									<div class="col-md-6">
										<label>회사번호</label> <input type="text"
											value="<%=company.getC_phone()%>" class="form-control"
											readonly />
									</div>
								</div>
								<hr class="my-5">
								<div class="form-row">
									<div class="col-md-1" style="margin-bottom: 15px;">
										<b><h5>주소</h5></b>
									</div>
									<div class="col-md-11">
										<h10> 회사 주소를 변경하세요 </h10>
									</div>
								</div>
								<form id="update_form">
									<input type="hidden" value="<%=company.getC_pk()%>"
										name="c_pk">
									<div class="form-row">
										<div class="col-md-7">
											<input type="text" placeholder="<%=company.getC_addr() %>" class="form-control"
												id="email" name="c_addr" />
										</div>
										<div class="col-md-5">
											<button type="button" class="btn btn-primary rounded-0"
												onClick="updateAddr()">변경</button>
										</div>
									</div>
								</form>


								<hr class="my-5">


								<div class="form-row">
									<div class="col-md-2" style="margin-bottom: 15px;">
										<b><h5>회사코드</h5></b>
									</div>
									<div class="col-md-10">
										<h10> 코드를 변경하세요 </h10>
									</div>
								</div>

								<div class="form-row">
									<div class="col-md-7" style="margin-bottom: 10px;">
										<input type="text" placeholder="현재 회사코드" class="form-control"
											id="orgin_pwd" />
									</div>
									<div class="col-md-5"></div>
								</div>

								<div class="form-row">
									<div class="col-md-7" style="margin-bottom: 10px;">
										<input type="text" placeholder="새 회사코드" class="form-control"
											id="new_pwd" />
									</div>
									<div class="col-md-5"></div>
								</div>

								<div class="form-row">
									<div class="col-md-7">
										<input type="text" placeholder="새 회사코드 확인"
											class="form-control" id="new_pwd_second" />
									</div>
									<div class="col-md-5">
										<button type="button" class="btn btn-primary rounded-0"
											disabled="true" id="pwd">회사코드 변경</button>
									</div>
								</div>


								<hr class="my-5">


								<div class="form-row">
									<div class="col-md-2" style="margin-bottom: 15px;">
										<b><h5>회사 삭제</h5></b>
									</div>
									<div class="col-md-10">
										<h10> 삭제된 회사는 되돌릴 수 없습니다. </h10>
									</div>
								</div>

								<div class="form-row">
									<div class="col-md-7">
										<input type="text" placeholder="회사코드 확인" class="form-control"
											id="out" />
									</div>
									<div class="col-md-5">
										<button type="button" class="btn btn-danger rounded-0"
											disabled="true" id="out_bt">회사 삭제</button>
									</div>
								</div>


								<hr class="my-5">

						</div>
					</div>
				</div>
			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>
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

		function updateAddr() {
 			$("#update_form").attr({
				"action" : "/admin/company/update",
				"method" : "post"
			});
			$("#update_form").submit();
		}
	</script>
</body>

</html>