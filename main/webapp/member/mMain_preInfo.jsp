<%@ page import = "patient.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/header-import.jsp"%>
  <style>
    body {
      margin: 0;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      border: 1px solid #ccc;
    }
    th, td {
      padding: 8px;
      border-bottom: 1px solid #ccc;
      text-align: left;
    }
  </style>

<meta charset="UTF-8">
<title>SC 스위트케어 | 피간병인 상세정보</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String m_id = (String) session.getAttribute("m_id");
String res_code = request.getParameter("popres_code");

PatientresDAO dao = new PatientresDAO();
List<TpreferenceVO> tpreList = dao.listtpre(res_code);
	%>
	<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>간병 받을 분</p>
						<h2>매칭서비스 정보</h2>
					</header>
	<table>
	<%
	for(TpreferenceVO vo : tpreList) {
		String gender = vo.getPre_gender();	
		
	%>
	<tr>
		<td>선호지역</td>
		<td>1순위 : <%=vo.getPre_location_1() %><br>
			2순위 : <%=vo.getPre_location_2() %><br>
			3순위 : <%=vo.getPre_location_3() %>
		</td>
	</tr>
	<tr>
		<td>선호나이대</td>
		<td>1순위 : <%=vo.getPre_age_1() %><br>
			2순위 : <%=vo.getPre_age_2() %><br>
			3순위 : <%=vo.getPre_age_3() %>
		</td>
	</tr>
	<tr>
		<td>선호성별</td>
		<td><%if( gender.equals("W")) {%> 여 <% } else { %> 남 <% } %> </td>
	</tr>
	<tr>
		<td>선호자격증</td>
		<td><%=vo.getPre_qual() %></td>
	</tr>
	<tr>
		<td>선호서비스</td>
		<td>1순위 : <%=vo.getPre_repre_1() %><br>
			2순위 : <%=vo.getPre_repre_2() %><br>
			3순위 : <%=vo.getPre_repre_3() %>
		</td>
	</tr>
	<tr>
		<td>시급</td>
		<td>1순위 : <%=vo.getPre_hourwage_1() %><br>
			2순위 : <%=vo.getPre_hourwage_2() %><br>
			3순위 : <%=vo.getPre_hourwage_3() %>
		</td>
	</tr>
	<%
	}
	
	List<TpreferenceVO> rankList = dao.ranklist(res_code);
	%>
	<tr>
		<td>선호항목순위</td>
		
		<% for (TpreferenceVO tvo : rankList) {
		 	%>
		 	<td> 1순위 : <%=tvo.getRank1() %><br>
		 		 2순위 : <%=tvo.getRank2() %><br>
		 		 3순위 : <%=tvo.getRank3() %><br>
		 		 4순위 : <%=tvo.getRank4() %><br>
		 		 5순위 : <%=tvo.getRank5() %><br>
		 	</td>
                <%  } %>
		
	</tr>
	</table>	
</div></div></div>
</body>
</html>
