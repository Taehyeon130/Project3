<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Employee empl = (Employee)request.getAttribute("empl");
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
<link href="/resources/client/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/client/css/sb-admin-2.min.css" rel="stylesheet">
<link href='/resources/client/lib/main.css' rel='stylesheet' />

<script src='/resources/client/lib/main.js'></script>

<script type="text/javascript">

	
</script>

</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<%@include file="../inc/header.jsp"%>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container py-5">
					<div class="card">
						<!-- 카드 헤더 -->
						<div class="card-header bg-primary text-white">
							<h4 class="text-uppercase text-center">계정 설정</h4>
						</div>
						<div class="card-body">
							<form>
							
								<div class="form-row">
									<div calss="col-md-12" style="margin-bottom: 15px;">
										<b><h5>계정 정보</h5></b>
									</div>
								</div>
								<div class="form-row">
									<div class="col-md-6">
										<label>이름</label> <input type="text" value="<%=empl.getE_name()%>"
											class="form-control" readonly />
									</div>
									<div class="col-md-6">
										<label>이메일</label> <input type="text" value="<%=empl.getE_mail()%>"
											class="form-control" readonly />
									</div>
								</div>


								<hr class="my-5">
								
								
							<div class="form-row">
									<div calss="col-md-8" style="margin-bottom: 15px;">
										<b><h5>이메일</h5></b>
									</div>
									<div class="col-md-4">
										<h10> 이메일 주소를 변경하세요 </h10>
									</div>
								</div>
								<form id="form1">
								<input type="hidden" value="<%=employee.getE_pk()%>" name="e_pk">
									<div class="form-row">
										<div class="col-md-7">
											<input type="text" placeholder="Email" class="form-control" id="email"  name="e_mail"/>
										</div>
										<div class="col-md-5">
										<button type="button" class="btn btn-primary rounded-0" disabled="true" id="c_mail">변경</button></div>
									</div>								
								</form>
								
								
								<hr class="my-5">


								<div class="form-row">
									<div calss="col-md-8" style="margin-bottom: 15px;">
										<b><h5>비밀번호</h5></b>
									</div>
									<div class="col-md-4">
										<h10> 비밀번호를 변경하세요 </h10>
									</div>
								</div>
								
								<div class="form-row">
									<div class="col-md-7" style="margin-bottom: 10px;">
										<input type="text"
											placeholder="현재 비밀번호" class="form-control" id="orgin_pwd"/>
									</div>
									<div class="col-md-5"></div>
								</div>

								<div class="form-row">
									<div class="col-md-7" style="margin-bottom: 10px;">
										<input type="text"
											placeholder="새 비밀번호" class="form-control" id="new_pwd"  />
									</div>
									<div class="col-md-5"></div>
								</div>

								<div class="form-row">
									<div class="col-md-7">
										<input type="text"
											placeholder="새 비밀번호 확인" class="form-control" id="new_pwd_second"/>
									</div>
									<div class="col-md-5">
										<button type="button" class="btn btn-primary rounded-0" disabled="true" id="pwd">비밀번호
											변경</button>
									</div>
								</div>
								
								
								<hr class="my-5">


								<div class="form-row">
									<div calss="col-md-8" style="margin-bottom: 15px;">
										<b><h5>회원 탈퇴</h5></b>
									</div>
									<div class="col-md-4">
										<h10> 삭제된 계정은 되돌릴 수 없습니다. </h10>
									</div>
								</div>

								<div class="form-row">
									<div class="col-md-7">
										<input type="text" placeholder="비밀번호 확인"
											class="form-control" id="out"/>
									</div>
									<div class="col-md-5">
									<button type="button" class="btn btn-danger rounded-0" disabled="true" id="out_bt">계정
											탈퇴</button></div>
								</div>


								<hr class="my-5">

							</form>
						</div>
					</div>
				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<%@include file="../inc/footer.jsp"%>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<%@include file="../inc/logout_modal.jsp"%>

		<!-- Bootstrap core JavaScript-->
		<script src="/resources/client/vendor/jquery/jquery.min.js"></script>
		<script
			src="/resources/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script
			src="/resources/client/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/resources/client/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="/resources/client/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="/resources/client/js/demo/chart-area-demo.js"></script>
		<script src="/resources/client/js/demo/chart-pie-demo.js"></script>
		
		<script type="text/javascript">
			$(function(){
				/* 메일을 입력하면 버튼 활성화 */
				$("#email").on('input',function(){
					if($("#email").val()=='')
						$("#c_mail").attr("disabled",true);
					else
						$("#c_mail").attr("disabled",false);
				});
				
				/* 마지막 비밀번호 입력하면 버튼 활성화 */
				$("#new_pwd_second").on('input',function(){
					if($("#new_pwd_second").val()=='')
						$("#pwd").attr("disabled",true);
					else
						$("#pwd").attr("disabled",false);
				});
				
				/* 비밀번호입력하면 버튼활성화 */
				$("#out").on('input',function(){
					if($("#out").val()=='')
						$("#out_bt").attr("disabled",true);
					else
						$("#out_bt").attr("disabled",false);
				});
				
				/*메일변경 버튼 클릭시 */
				$("#c_mail").click(function(){
					$("form").attr({
						"action":"/client/setting/email",
						"method":"post"
					});
					$("form").submit();
				});
				
			})
			
			
		</script>
</body>

</html>