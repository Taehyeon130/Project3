<%@ page contentType="text/html;charset=UTF-8"%>
<%
	RuntimeException e = (RuntimeException)request.getAttribute("e"); // 에러 객체
%>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
    alert("<%=e.getMessage() %>");
    history.back();
});
</script>

