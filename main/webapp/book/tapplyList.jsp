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
	window.location.href = "../member/mMain.jsp";
}
</script>
<body>
<% String m_id = (String)session.getAttribute("m_id");
String res_code = request.getParameter("res_code");
//System.out.println(res_code);
%>

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
										<a href="./ginfoList.jsp?g_id=<%=g_id%>&res_code=<%=res_code%>&b_id=<%=b_id%>">더보기</a></td> 
									<td><%=b_status%></td> 
									<td><a href="./tapprove.jsp?res_code=<%=res_code%>&b_id=<%=b_id%>&g_id=<%=g_id%>">승인</a><br>
									<a href="./tdeny.jsp?b_id=<%=b_id%>&res_code=<%=res_code%>">거절</a></td></tr>	
								<%
									}
								%>
								</table></form>
								<input type="button" class="button special" onclick="backmain();" value="뒤로가기">
								
</body>
</html>