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
int gPage = request.getParameter("gPage") != null ? Integer.parseInt(request.getParameter("gPage")) : 1;
CaregiverDAO dao = new CaregiverDAO();
int giverCnt = dao.giverCnt();
int gPages = 0;
if(giverCnt%15==0) {
	gPages = giverCnt/15;
} else {
	gPages = giverCnt/15 +1;
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
					<table>
							<thead>
								<tr>
									<td>No.</td> <td>아이디</td> <td>이름</td> <td>성별</td> <td>생년월일</td>
									<td>핸드폰번호</td> <td>이메일</td> <td>상세정보</td> <td></td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");
							List<CaregiverVO> list = dao.giver_admin_info((gPage-1)*15);
							for (int i = 0; i < list.size(); i++) {
								CaregiverVO listt = (CaregiverVO) list.get(i);
								
								g_id = listt.getG_id();
								String g_name = listt.getG_name();
								String g_gender = listt.getG_gender();
								String g_birth = listt.getG_birth();
								String g_phone = listt.getG_phone();
								String g_email = listt.getG_email();								
								
								//String phone = g_phone.substring(0,3) + "-" + g_phone.substring(3,7) + "-" + g_phone.substring(7,11);
							%>
							<tr>
								<td><%=(gPage-1)*15 + i + 1%></td>
								<td><%=g_id%></td>
								<td><%=g_name%></td>
								<td><%=g_gender%></td>
								<td><%=g_birth%></td>
								<td><%=g_phone%></td>
								<td><%=g_email%></td>
								<td><a onclick="javascript:openAdGinfo('<%=g_id %>')">더보기</a></td>
								<td><a href="../admin/ad_gUpdate.jsp?g_id=<%=g_id%>">수정</a><br><br>
								<a onclick="javascript:memberDelete('<%=g_id%>')">삭제</a></td>
							</tr>
							<%
							}
							%>
						</table>
					</form>
					<div>
						<ul class="pagination pagination-lg">
							<%
								for(int i = 1; i <= gPages; i++) {
							%>
								<li class="page-item" onclick="gPage(<%= i %>);">
									<%= i %>
								</li>
							<%		
								}
							%>
						</ul>
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
	</script>

	<%@include file="/footer.jsp"%>

</body>
</html>

<script>
	function gPage(page) {
		var path = "${context}/admin/admin_caregiver.jsp?gPage=" + page;
		location.href = path;
	}
</script>
<style>
.pagination {
	display: flex;
	padding-left: 0;
	list-style: none;
	justify-content: center;
}

.page-item{
	padding: 0 0.8rem;
	height: fit-content;
	line-height: 2;
	cursor: pointer;
	color:#423730;
}

.page-item:hover {
	box-shadow: inset 0 0 0 2px rgba(144, 144, 144, 0.25);
    border-radius: 2px;
}
</style>