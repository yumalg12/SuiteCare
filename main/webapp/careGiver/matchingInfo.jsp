<%@ page import = "patient.*" %>
<%@ page import = "caretaker.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Time" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 매칭정보</title>
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
	<script>
	
	</script>
	
	<body>
<%@ include file="/header.jsp" %>

	<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>Eleifend vitae urna</p>
						<h2>Generic Page Template</h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>나와 매칭된</p>
								<h2>피간병인 정보</h2>
							</header>
			<table border=1>
			<tr><td>이름</td><td>코드</td><td>성별</td><td>나이</td><td>키</td><td>몸무게</td><td>상태(병명)</td></tr>
			<%
			request.setCharacterEncoding("utf-8");
			String g_id = (String)session.getAttribute("g_id");
			String res_code = request.getParameter("res_code");
			
			ReservationDAO dao = new ReservationDAO();
			List<ReservationVO> list = dao.resList(g_id, res_code);
			for(int i=0; i<list.size(); i++) {
				ReservationVO listvo = (ReservationVO) list.get(i);

				String caretaker_code = listvo.getCaretaker_code();
	            String rescode = listvo.getRes_code();
	            String merchant_uid = listvo.getMerchant_uid();
	            String res_date = listvo.getRes_date();
	            String location = listvo.getLocation();
	        	String addr = listvo.getAddr();
	        	String detail_addr = listvo.getDetail_addr();
	        	String consciousness = listvo.getConsciousness();
	        	String care_meal_yn = listvo.getCare_meal_yn();
	        	String care_toilet = listvo.getCare_toilet();
	        	String state_paralysis = listvo.getState_paralysis();
	        	String state_mobility = listvo.getState_mobility();
	        	String bedsore_yn = listvo.getBedsore_yn();
	        	String suction_yn = listvo.getSuction_yn();
	        	String outpatient_yn = listvo.getOutpatient_yn();
	        	String care_night_yn = listvo.getCare_night_yn();
	        	String notice = listvo.getNotice();
	        	
	        	String t_name = listvo.getT_name();
    			String t_gender = listvo.getT_gender();
    			int t_age = listvo.getT_age();
    			int t_height = listvo.getT_height();
    			int t_weight = listvo.getT_weight();
    			String diagnosis = listvo.getDiagnosis();
				
        		out.println("<tr><td>" + t_name + "</td><td>" + caretaker_code + "</td><td>" + t_gender + "</td>");
				out.println("<td>" + t_age + "</td><td>" + t_height + "</td><td>" + t_weight + "</td>");
				out.println("<td>" + diagnosis + "</td></tr>");
				%>
				</table>
				
				<table border=1>
				<tr><td>식사케어 여부</td><td>대소변케어 여부</td><td>마비 상태</td><td>거동 및 운동상태</td><td>욕창 유무</td><td>석션 필요 유무</td><td>주기적 외부 치료 여부</td><td>야간케어 여부</td></tr>
				<tr><td><%=care_meal_yn%></td><td><%=care_toilet%></td><td><%=state_paralysis%></td><td><%=state_mobility%></td><td><%=bedsore_yn%></td><td><%=suction_yn%></td><td><%=outpatient_yn%></td><td><%=care_night_yn%></td></tr>
				</table>
				
				<table border=1>
				<tr><td>주소</td><td>의식상태</td><td>유의사항</td><td>예약날짜</td><td>예약코드</td><td>결제주문번호</td></tr>
				<tr><td><%=addr%> (<%=detail_addr%>)</td><td><%=consciousness%></td><td><%=notice%></td><td><%=res_date%></td><td><%=rescode%></td><td><%=merchant_uid%></td></tr>
				
			<%
			}
			%>
			</table> 
						</div>
					</div>
				</div>
			</section>
								
<%@include file="/footer.jsp"%>								
</body>
</html>