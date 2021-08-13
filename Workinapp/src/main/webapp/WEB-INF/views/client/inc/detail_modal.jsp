<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.koreait.workinapp.domain.Employee"%>
<%@page import="java.util.List"%>



<div class="modal fade bd-example-modal-lg" id="detailModalCenter"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog modal-lg"
		role="document">
		
		<div class="modal-content border-left-primary">

            <!-- Modal Header -->
            <div class="modal-header">
              	<%=employee.getE_name()%>               
               <div class="modal-title text-gray-900">
               </div>
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