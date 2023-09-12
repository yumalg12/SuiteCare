<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="caregiver.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SC 스위트케어 | 간병인 회원정보</title>
<%@ include file="/header-import.jsp"%>

</head>

<body>

<%@ include file="/header.jsp"%>
<%
int gPageCurrent = request.getParameter("gPage") != null ? Integer.parseInt(request.getParameter("gPage")) : 1;
CaregiverDAO dao = new CaregiverDAO();
int giverCnt = dao.giverCnt();
int gPages = 0;
int perPage = 10;
if(giverCnt%perPage==0) {
	gPages = giverCnt/perPage;
} else {
	gPages = giverCnt/perPage +1;
}
%>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Premium Caregiver Matching Platform</p>
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
						<p>SC 스위트케어</p>
						<h2>간병인 회원정보 조회</h2>
					</header>
					<form name="giverinfo">
					<div class="table_wrapper">
					<table>
							<thead>
								<tr>
									<td>No.</td> <td>아이디</td> <td>이름</td> <td>성별</td> <td>생년월일</td>
									<td>핸드폰번호</td> <td>이메일</td> <td>상세정보</td> <td></td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");
							List<CaregiverVO> list = dao.giver_admin_info((gPageCurrent-1)*perPage, perPage);
							for (int i = 0; i < list.size(); i++) {
								CaregiverVO listt = (CaregiverVO) list.get(i);
								
								g_id = listt.getG_id();
								String g_name = listt.getG_name();
								String g_gender = listt.getG_gender();
								String g_birth = listt.getG_birth();
								String g_phone = listt.getG_phone();
								String g_email = listt.getG_email();								
								
								String gender = g_gender.equals("W")? "여": "남";
								
								String phone = g_phone.replace("-", "");
								phone = phone.substring(0,3) + "-" + phone.substring(3,7) + "-" + phone.substring(7,11);
							%>
							<tr>
								<td><%=(gPageCurrent-1)*perPage + i + 1%></td>
								<td><%=g_id%></td>
								<td><%=g_name%></td>
								<td><%=gender%></td>
								<td><%=g_birth%></td>
								<td><%=phone%></td>
								<td><%=g_email%></td>
								<td><a onclick="javascript:openAdGinfo('<%=g_id %>')">더보기</a></td>
								<td><a href="../admin/ad_gUpdate.jsp?g_id=<%=g_id%>">수정</a><br>
								<a onclick="javascript:memberDelete('<%=g_id%>')">삭제</a></td>
							</tr>
							<%
							}
							%>
						</table>
						</div>
					</form>
					<div>
						<ul class="pagination pagination-lg">
							<%
								for(int gPage = 1; gPage <= gPages; gPage++) {
							%>
							<li class="page-item <%= gPage == gPageCurrent ? "button" : "" %>" onclick="movePage('gPage', <%= gPage %>, this);">
									<%= gPage %>
								</li>
							<%		
								}
							%>
						</ul>
					</div>
					<div class="form_button">
						 <input type="button" class="button alt" onclick="adminback();" value="뒤로가기">
</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
	function openAdGinfo(g_id){
		window.open("${context}/admin/admin_ginfo.jsp?g_id=" + g_id, "name(about:blank)", "width=800, height=600");
	}
	function memberDelete(g_id){
		if(!confirm('회원을 삭제하시겠습니까?')){
			return false;
		}
		else{
			window.location.href="./ad_gDelete.jsp?g_id=" + g_id;
			return true;
		}
	}
	function adminback() {
		window.location.href = "${context}/admin/adMain.jsp";
	}
	</script>

	<%@include file="/footer.jsp"%>

</body>
</html>