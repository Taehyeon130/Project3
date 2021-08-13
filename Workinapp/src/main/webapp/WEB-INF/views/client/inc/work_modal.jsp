<%@page import="com.koreait.workinapp.domain.Employee"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Employee> managerList = (List)request.getAttribute("managerList");
	
%>
<script type="text/javascript">
function regist(){
	$("form").attr({
		"action":"/client/work/regist",
		"method":"post"
	});
	$("form").submit();	
}
</script>

<div class="modal fade bd-example-modal-lg" id="exampleModalCenter"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">요청사항 검토</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
			<div class="modal-body">
				<div class="row">
						<div class="col-8 col-sm-6">
							<label for="recipient-name" class="col-form-label">승인권자</label>
							<div>
								<!-- form시작 -->
								<input type="hidden" name="e_pk" value="<%=employee.getE_pk() %>">
								<select name="w_master" class="custom-select mb-3">
									<option value="nos" selected disabled hidden>==선택하세요==</option>
									 <%
									for (Employee obj:managerList) {
									%>
									<option value="<%=obj.getE_name()%>"><%=obj.getE_name()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div>
								<label for="message-text" class="col-form-label">요청 내용</label>
								<textarea class="form-control" id="message-text" name="w_note"
									style="height: 100px; resize: none"></textarea>
							</div>
						</div>
						<div class="col-4 col-sm-6">
							<div>
								<h4>
									<label for="message-text" class="col-form-label">요청사항</label>
								</h4>
							</div>
							<div>
								<label for="message-text" class="col-form-label">날짜</label> 
								<input
									type="text" class="form-control" id="date" name="w_date"
									readonly style="background-color: white;">
							</div>
							<div>
								<label for="message-text" class="col-form-label">근무유형</label> 
								<input
									type="text" class="form-control" name="w_name" id="dayoff"
									readonly style="background-color: white;">
							</div>
						</div>
				</div>						
			</div>
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onClick="regist()">보내기</button>
			</div>
		</div>
	</div>
</div>