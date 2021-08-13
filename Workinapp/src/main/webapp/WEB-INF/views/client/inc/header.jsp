<%@page import="com.koreait.workinapp.domain.Employee"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Employee employee = (Employee)session.getAttribute("Employee");
%>
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Navbar -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center">
		<div class="sidebar-brand-text mx-4">
			WorkIn <sup>app</sup>
		</div>
	</a> <a class="nav-item active"> <a class="nav-link"
		href="/client/main"> <span>스케줄</span></a>
	</a> <a class="nav-item active"> <a class="nav-link"
		href="/client/request/list"> <span>내 요청들</span></a>
	</a> <a class="nav-item"> <a class="nav-link"
		href="/client/commute/list"> <span>출퇴근 기록</span></a>
	</a>
	<ul class="navbar-nav ml-auto">
		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small"><%=employee.getE_name()%>님 환영합니다</span> <i
				class="fas fa-cog"></i>
		</a> 
		<!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
					<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
				<a class="dropdown-item" href="/client/setting"> 
					<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					설정
				</a>
			</div></li>
	</ul>

</nav>