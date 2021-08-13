<%@page import="com.koreait.workinapp.domain.Requests"%>
<%@page import="com.koreait.workinapp.domain.TopCategory"%>
<%@page import="com.koreait.workinapp.domain.Work"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.koreait.workinapp.domain.Dayoff"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
	List <Employee> employeeList = (List)request.getAttribute("employeeList");
	List <TopCategory> topCateogryList = (List)request.getAttribute("topCategoryList");
	List <Requests> noWorkList = (List)request.getAttribute("noWorkList");
	List <Requests> noDayoffList=(List)request.getAttribute("noDayoffList");
	List <Requests> okRequestList=(List)request.getAttribute("okRequestList");
	List <Requests> dayoffList = (List)request.getAttribute("dayoffList");
	List <Requests> workList = (List)request.getAttribute("workList");
	
	List <Requests> firstList = (List)request.getAttribute("firstList");
	List <Requests> secondList = (List)request.getAttribute("secondList");
	List <Requests> thirdList = (List)request.getAttribute("thirdList");
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

<script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
		var test;
		var i=0;
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
         events:  [ 	
	        	 <%for(Requests req:okRequestList){%>
		        	 <%@include file="./inc/date.jsp"%>
	        	 <%}%> 
	         		],
	         		eventClick:function(info){
	         			alert(info.event.title);
	         		}
        });
        calendar.render();
        
        $("select[name='cate']").change(function(){      	
        	if($(this).val()==1){ //휴가일때
	        	calendar.removeAllEvents();
	        	calendar.addEventSource({
       			 events: [ 	
       	        	 <%for(Requests req:dayoffList){%>
       		        	 <%@include file="./inc/date.jsp"%>
       	        	 <%}%>
       	         		] 		
          		});
        	}else if($(this).val()==2){
        		calendar.removeAllEvents();
	        	calendar.addEventSource({
       			 events: [ 	
       	        	 <%for(Requests req:workList){%>
       	        	<%@include file="./inc/date.jsp"%>
       	        	 <%}%>
       	         		] 		
          		});
        		
        	}else if($(this).val()==0){
        		calendar.removeAllEvents();
	        	calendar.addEventSource({
       			 events: [ 	
       	        	 <%for(Requests req:okRequestList){%>
       	        	<%@include file="./inc/date.jsp"%>
       	        	 <%}%>
       	         		] 		
          		});
        	}
        });
        
        
        //직원 선택
        $("select[name='empl']").change(function(){      	
        	if($(this).val()==1){ 
	        	calendar.removeAllEvents();
	        	calendar.addEventSource({
       			 events: [ 	
       	        	 <%for(Requests req:firstList){%>
       		        	 <%@include file="./inc/date.jsp"%>
       	        	 <%}%>
       	         		] 		
          		});
        	}else if($(this).val()==2){
        		calendar.removeAllEvents();
	        	calendar.addEventSource({
       			 events: [ 	
       	        	 <%for(Requests req:secondList){%>
       	        	<%@include file="./inc/date.jsp"%>
       	        	 <%}%>
       	         		] 		
          		});
        		
        	}else if($(this).val()==3){
        		calendar.removeAllEvents();
	        	calendar.addEventSource({
       			 events: [ 	
       	        	 <%for(Requests req:thirdList){%>
       	        	<%@include file="./inc/date.jsp"%>
       	        	 <%}%>
       	         		] 		
          		});
        	}else if($(this).val()==0){
        		calendar.removeAllEvents();
	        	calendar.addEventSource({
       			 events: [ 	
       	        	 <%for(Requests req:okRequestList){%>
       	        	<%@include file="./inc/date.jsp"%>
       	        	 <%}%>
       	         		] 		
          		});
        	}
        });
        
        calendar.render();
        
    });

    </script>
    
    <script type="text/javascript">
							
    
/* 		function  regist(){
			var com_date = new Date();
			alert("출근 완료 😎😎");
			$("#comm").html("퇴근");
        	$("#com_date").val(com_date);	
		 	$("form").attr({
				action:"/client/commute/regist",
				method:"post"
			});
			$("form").submit();	
			} */
			
			function regist(){
				var com_date = new Date();
				$("#com_date").val(com_date);	
				
				$.ajax({
					url:"/client/commute/regist",
					type:"POST",
					data:{
						e_pk:$("input[name='e_pk']").val(),
						com_date:$("input[name='com_date']").val()
					},
					success:function(result,status,xhr){
						alert("출근 완료 👍👍");					
					}
					
				});
			}
			
			function out(){
				var com_date = new Date();
				$("#com_date").val(com_date);	
				
				$.ajax({
					url:"/client/commute/out",
					type:"POST",
					data:{
						e_pk:$("input[name='e_pk']").val(),
						com_date:$("input[name='com_date']").val()
					},
					success:function(result,status,xhr){
						alert("퇴근 완료 👍👍");			
						
					}
					
				});
			}
		
		
		
		
	
	</script>
    
    
<style>
#calendar-container {
	width: 100%;
	height: 500px;
	margin: 20px auto;
	/* padding: 0 10px; */
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
				<%@include file="./inc/header.jsp"%>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fulid">
					<!-- Content Row -->
					<form>
						<input type="hidden" name="e_pk" value="<%=employee.getE_pk()%>">	
						<input type="hidden" name="com_date"  id="com_date" value= new Date()>
									
					</form>
					<div class="row">
						<div class="col-xl-3">
							<!-- 휴가통계 start -->
							<div class="row" style="margin-left:10px;">
							<div class="col-12" >
								<div class="card">
										<div class="card-header bg-secondary text-white">
											<h6 class="card-title" style="height:10px;">미승인 근무요청</h6>
											<div class="card-tools">
												<div class="input-group input-group-sm"
													style="width: 120px;">
													
												</div>
											</div>
										</div>
										<!-- /.card-header -->
										<div class="card-body table-responsive p-0"
											style="height: 250px;">
											<table class="table table-head-fixed text-nowrap">
												<thead>
													<tr>
														<th>유형</th>
														<th>날짜</th>
														<th>승인권자</th>
														<th>상태</th>
													</tr>
												</thead>
												<tbody>
													<%for(Requests req:noWorkList){ %>
													<tr>
														<td><%=req.getSubCategory().getSub_name()%></td>
														<td><%=req.getReq_date()%></td>
														<td><%=req.getReq_master()%></td>
														<td><button class="btn btn-warning">대기중</button></td>													
													</tr>
													<%} %>

												</tbody>
											</table>
										</div>
										<!-- /.card-body -->
									</div>
								
							</div>
							
							<hr class="my-5">
								<div class="col-12" style="margin-top:20px;">
									<div class="card">
										<div class="card-header bg-secondary text-white">
											<h6 class="card-title" style="height:10px;">미승인 휴가요청</h6>
											<div class="card-tools">
												<div class="input-group input-group-sm"
													style="width: 120px;">
													
												</div>
											</div>
										</div>
										<!-- /.card-header -->
										<div class="card-body table-responsive p-0"
											style="height: 250px;">
											<table class="table table-head-fixed text-nowrap">
												<thead>
													<tr>
														<th>유형</th>
														<th>날짜</th>
														<th>승인권자</th>
														<th>상태</th>
													</tr>
												</thead>
												<tbody>

													<%for(Requests req:noDayoffList){ %>
													<tr>
														<td><%=req.getSubCategory().getSub_name()%></td>
														<td><%=req.getReq_date()%></td>
														<td><%=req.getReq_master()%></td>
														<td><button class="btn btn-warning">대기중</button></td>	
													</tr>
													<%} %>
												</tbody>
											</table>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								</div>
								
							</div>
							<!-- 휴가통계 end -->
						</div>
						<div class="col-xl-9">
							<!-- Page Heading -->

							<div class="card shadow">
								<div class="card-body">
									<div class="row">
										<div class="col-md-2">
											<select class="custom-select mb-3" name="empl">
												<option value="0">== 직원 선택 ==</option>
												<%for(Employee obj:employeeList){ %>
													<option value="<%=obj.getE_pk()%>"><%=obj.getE_name() %></option>
												<%} %>
											</select>
										</div>
										
										<div class="col-md-2">
											<select class="custom-select mb-3" name="cate">
												<option value="0">== 필터 선택 ==</option>
												<%for(TopCategory obj:topCateogryList){ %>
													<option value="<%=obj.getTop_pk()%>"><%=obj.getTop_name() %></option>												
												<%} %>
											</select>
										</div>
										<div class="col-md-4"></div>
										
										<div class="col-md-4">
											<a href="#" onClick="regist();"
												class="btn btn-primary btn-icon-split"> <span
												class="icon text-white-50"> 
												<i class="fas fa-id-card"></i>
												
											</span> <span class="text" id="comm" value="1">출근</span>
											</a>
											<a href="#" onClick="out();"
												class="btn btn-primary btn-icon-split"> <span
												class="icon text-white-50"> 
												<i class="fas fa-grin-alt"></i>
											</span> <span class="text" id="comm" value="1">퇴근</span>
											</a>
										</div>
									
										<div class="col-md-8"></div>
										<div class="col-md-4">			
											 <a href="/client/request/registform"
												class="btn btn-primary btn-icon-split"> <span
												class="icon text-white-50"> 
												<i class="fas fa-calendar"></i>
											</span> <span class="text">휴가 • 근무일정 요청</span>
											</a>
										
										
										</div>
									</div>

									<!-- Calendar -->
									<div id='calendar-container'>
										<div id='calendar'></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				
				

				
				
				
				
				<%for(int i=0;i<10;i++){ %>
				<p>
					<%} %>

					<!-- End of Main Content -->

					<!-- Footer -->
					<%@include file="./inc/footer.jsp"%>
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
		<%@include file="./inc/logout_modal.jsp"%>

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
			
			
	
</body>

</html>