<%@ page contentType="text/html;charset=UTF-8"%>
{
<%if(req.getSubCategory().getSub_pk()==1){%>
 	color : "#87CEEB",
<%}else if(req.getSubCategory().getSub_pk()==2){%>
	color : "#90EE90",
<%}else if(req.getSubCategory().getSub_pk()==3){%>
	 color :"#CE97FB",
<%} else if(req.getSubCategory().getSub_pk()==4){%>
	color :"#FFA500",
<%} else if(req.getSubCategory().getSub_pk()==5){%>
	 color :" #F6C1CE",
<%} else if(req.getSubCategory().getSub_pk()==6){%>
 	color :"#FFD700",
<%} else if(req.getSubCategory().getSub_pk()==7){%>
	 color :"#C0C0C0",
<%}%>

<%if(req.getReq_status()==0){%>
	title:'<%=req.getSubCategory().getSub_name()%>- 요청 대기 중',
<%}else if(req.getReq_status()==3){%>
	title:'<%=req.getSubCategory().getSub_name()%>- 거절',
<%}else{%>
	title:'<%=req.getSubCategory().getSub_name()%>',
<%}%>
	start: '<%=req.getReq_date()%>', },
