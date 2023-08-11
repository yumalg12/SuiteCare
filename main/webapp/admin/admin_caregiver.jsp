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
<title>간병인 회원 정보</title>
<%@ include file="/header-import.jsp"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<style>
.fc-col-header {
    margin: 0;
    padding: 0;
}
.fc-daygrid-day-number, .fc-col-header-cell-cushion {
text-decoration:none;
 cursor: default;
}
.fc-daygrid-day:hover{
font-weight: bold;
background-color: #DFD7BF50;
}
.fc-scroller{
overflow:hidden !important;
}
.fc .fc-button-primary{
background-color: transparent;
border: none;
outline: none;
}
.fc .fc-button-primary:hover{
background-color: #cccccc50;
}
.fc .fc-daygrid-day.fc-day-today{
background-color: #A4907Caa;
font-weight: bold;
}
.fc .fc-button-primary:not(:disabled):active, .fc .fc-button-primary:not(:disabled).fc-button-active{
background-color: #DFD7BFaa;
font-weight: bold;
}
.fc .fc-toolbar.fc-header-toolbar{
margin-left: 7.2rem;
}
.fc .fc-toolbar-title {
    font-size: 1.75em;
    margin: 0;
    display: inline;
    position: relative;
    top: 0.4rem;
}
</style>

</head>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>


<body>

<%@ include file="/header.jsp"%>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Eleifend vitae urna</p>
				<h2>SC SuiteCare</h2>
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
						<h2>간병인 회원 정보 조회</h2>
					</header>
					<form name="giverinfo">
					<table>
							<thead>
								<tr>
									<td>No.</td> <td>프로필 사진</td> <td>아이디</td> <td>이름</td> <td>성별</td> <td>생년월일</td>
									<td>핸드폰번호</td> <td>이메일</td> <td>주소</td> <td>sms 수신동의</td> 
									<td>email 수신동의</td> <td>대표 서비스</td> <td>자격증</td> <td>활동 지역</td> <td>가입일</td> <td>정보</td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");
							String user_id = request.getParameter("user_id");

							CaregiverDAO dao = new CaregiverDAO();

							List<CaregiverVO> list = dao.giver_info(user_id);
							for (int i = 0; i < list.size(); i++) {
								CaregiverVO listt = (CaregiverVO) list.get(i);
                                String g_profile = listt.getG_profile();
								String g_id = listt.getG_id();
								String g_name = listt.getG_name();
								String g_gender = listt.getG_gender();
								String g_birth = listt.getG_birth();
								String g_phone = listt.getG_phone();
								String g_email = listt.getG_email();
								String g_address = listt.getG_address();	
								String g_sms_yn = listt.getG_sms_yn();
								String g_email_yn = listt.getG_email_yn();
								String g_qualification = listt.getG_qualification();								
								String g_representative = listt.getG_representative();
								String g_location = listt.getG_location();
								Date g_signup_date = listt.getG_signup_date();
								
								String phone = g_phone.substring(0,3) + "-" + g_phone.substring(3,7) + "-" + g_phone.substring(7,11);
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=g_profile%></td>
								<td><%=g_id%></td>
								<td><%=g_name%></td>
								<td><%=g_gender%></td>
								<td><%=g_birth%></td>
								<td><%=g_phone%></td>
								<td><%=g_email%></td>
								<td><%=g_address%></td>
								<td><%=g_sms_yn%></td>
								<td><%=g_email_yn%></td>
								<td><%=g_qualification%></td>
								<td><%=g_representative%></td>
								<td><%=g_location%></td>
								<td><%=g_signup_date%></td>
								<td><a href='../admin/admin_tinfo.jsp?m_id=<%=g_id%>'>더보기</a></td>
							</tr>
							<%
							}
							%>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/footer.jsp"%>

</body>
</html>