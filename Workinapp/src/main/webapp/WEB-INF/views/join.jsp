<%@ page contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<style>
.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 2;
}

.overlay {
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.form_container.right-panel-active .overlay-container {
	transform: translateX(-100%);
}

.form_container.right-panel-active .overlay {
	transform: translateX(50%);
}

.overlay-left {
	transform: translateX(20%);
}

.form_container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.form_container.right-panel-active .overlay-right {
	transform: translateX(-20%);
}

@
keyframes show { 0%, 49.99% {
	opacity: 0;
	z-index: 1;
}
50
%
,
100
%
{
opacity
:
1;
z-index
:
5;
}
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#regist").click(function () {
		regist();
	});
	
	$("#login_btn").click(function() {
		loginCheck();
	})
})

function regist() {
	$("#registForm").attr({
		"action" : "/main/join",
		"method" : "post"
	});
	$("#registForm").submit();
}

function loginCheck(){
	//서버에 로그인 요청
	$("#loginForm").attr({
		"action" : "/main/login",
		"method" : "post"
	});
	$("#loginForm").submit();
}
</script>
</head>

<body>
	<div class="container">

		<div class="row">
			<div class="col-12" style="margin-top: 40px; margin-bottom: 20px;">
				<div class="sidebar"
					style="min-height: 1px; width: 100% !important;">
					<a
						class="sidebar-bran d-flex align-items-center justify-content-center"
						href="home.html" style="font-size: 1.5rem;">
						<div class="sidebar-brand-text">Welcome!</div>
					</a>
				</div>
			</div>
		</div>

		<div class="card o-hidden border-0 shadow-lg my-5"
			style="margin-top: 10px !important;">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row form_container" id="form_container">
					<!-- Login Form -->
					<div class="col-lg-6 sign-up-container">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
							</div>
							<form class="user" id="loginForm">
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										placeholder="ID" name="e_id">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										placeholder="Password" name="e_pwd">
								</div>
								<div class="form-group">
									<div class="custom-control custom-checkbox small">
										<input type="checkbox" class="custom-control-input"
											id="customCheck"> <label class="custom-control-label"
											for="customCheck">Remember Me</label>
									</div>
								</div>
								<button type="button" id="login_btn" class="btn btn-primary btn-user btn-block">
									Login </button>
								<hr style="margin-top: 20px; margin-bottom: 20px;">
								<a href="index.html" class="btn btn-google btn-user btn-block">
									<i class="fab fa-google fa-fw"></i> Login with Google
								</a> <a href="index.html"
									class="btn btn-facebook btn-user btn-block"> <i
									class="fab fa-facebook-f fa-fw"></i> Login with Facebook
								</a>
							</form>
							<hr style="margin-top: 30px;">
							<div class="text-center">
								<a class="small" href="#">Create an Account!</a>
							</div>
						</div>
					</div>
					<!-- /.Login Form -->
					<!-- Regist Form -->
					<div class="col-lg-6 sign-in-container">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form class="user" id="registForm">
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										placeholder="Name" name="e_name">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										placeholder="ID" name="e_id">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										placeholder="Password" name="e_pwd">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										placeholder="Repeat Password">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										placeholder="Email" name="e_mail">
								</div>
								<div class="form-group">
									<select class="form-control" name="e_level">
										<option value="0">Choose your position</option>
										<option value="Employee">Employee</option>
										<option value="Manager">Manager</option>
									</select>
								</div>
								<button id="regist" type="button" href="" class="btn btn-primary btn-user btn-block"> <i
									class="fas fa-sign-in-alt"></i> Register Account
								</button>
							</form>
						</div>
					</div>
					<!-- /.Regist Form -->

					<!-- Overlay-->
					<div class="overlay-container">
						<div class="overlay bg-primary">
							<div class="overlay-panel overlay-left">
								<!-- <img src="img/WORKINappWHITEROUND2.png" alt=""> -->
								<a id="signIn" type="button" class="btn btn-outline-light"
									style="width: 320px;">Login</a>
							</div>
							<div class="overlay-panel overlay-right">
								<a id="signUp" type="button" class="btn btn-outline-light "
									style="width: 320px;">Join</a>
							</div>
						</div>
					</div>
					<!-- /.Overlay -->
					<script type="text/javascript">
                        const signUpButton = document.getElementById('signUp');
                        const signInButton = document.getElementById('signIn');
                        const container = document.getElementById('form_container');

                        signUpButton.addEventListener('click', () => {
                            container.classList.add("right-panel-active");
                        });
                        signInButton.addEventListener('click', () => {
                            container.classList.remove("right-panel-active");
                        });
                    </script>
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
</body>

</html>