<%@ page import = "book.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>SC 스위트케어 | 매칭 신청 리스트</title>
	<%@ include file="/header-import.jsp"%>
</head>
<script>
function backmain() {
	window.location.href = "<%=context%>/member/main";
}
</script>
<body>
<% String m_id = (String)session.getAttribute("m_id");
String res_code = request.getParameter("res_code");
//System.out.println(res_code);
%>
	<%@ include file="../header.jsp" %>

<!-- One -->
   <section id="One" class="wrapper style3">
      <div class="inner">
         <header class="align-center">
            <p>Eleifend vitae urna</p>
            <h2>Suite Care</h2>
         </header>
      </div>
   </section>

<!-- Two -->
   <section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p> SuiteCare </p>
						<h2>매칭 신청 리스트</h2>
					</header>
<form name="applyForm">
							<table>
								<thead>
									<tr>
										<td>예약코드</td> <td>매칭번호</td> <td>간병인 이름</td> <td>매칭 현황</td> <td>비고</td>
									</tr>
								</thead>
								<% BookDAO dao = new BookDAO();
									List<BookVO> applyList = dao.listTapply(res_code);
									
									for (int i = 0; i < applyList.size(); i++) {
										BookVO applyvo = (BookVO) applyList.get(i);
										
										String rescode = applyvo.getRes_code();
										String b_id = applyvo.getB_id();
										String g_id = applyvo.getG_id();
										String g_name = applyvo.getG_name();
										String b_status = applyvo.getB_status();
										%>
									<tr>
									<td><%=rescode%></td> <td><%=b_id%></td> 
									<td><%=g_name%><br>
										<a onclick="javascript:openGinfoList('<%=g_id%>','<%=res_code%>','<%=b_id%>')">더보기</a></td> 
									<td><%=b_status%></td> 
									<td>
									<a href="./tdeny.jsp?b_id=<%=b_id%>&res_code=<%=res_code%>" class="button alt">거절</a>
									<a onclick="javascript:openMileagePayment('<%=g_id%>','<%=res_code%>','<%=b_id%>')" class="button special">승인</a>
									<!-- <a href="./tapprove.jsp?res_code=<%=res_code%>&b_id=<%=b_id%>&g_id=<%=g_id%>">승인</a><br> -->
									</td></tr>	
								<%
									}
								%>
								</table></form></div></div></div></section>
					<%@ include file="../footer.jsp" %>
								
<script>
function openGinfoList(gIdVal,resCodeVal, bIdVal) {
	window.open("<%=context%>/book/ginfoList.jsp?g_id="+gIdVal+"&res_code="+resCodeVal+"&b_id="+bIdVal, "name(about:blank)", "width=800, height=800");
}
function openMileagePayment(gIdVal,resCodeVal, bIdVal) {
	window.open("<%=context%>/pay/mileage_payment.jsp?g_id="+gIdVal+"&res_code="+resCodeVal+"&b_id="+bIdVal, "name(about:blank)", "width=800, height=800");
}
</script>
</body>
</html>