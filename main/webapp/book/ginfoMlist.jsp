<%@ page import = "book.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SC 스위트케어 | 매칭간병인 정보</title>
	<%@ include file="/header-import.jsp"%>

<script>
function backmMain() {
	window.location.href = "${context}/member/main";
}
</script>

<link rel="stylesheet" href="${context}/assets/css/popup.css" />

</head>

<body>
<% 
g_id = request.getParameter("g_id");

String file_repo = "../assets/profile/";

BookDAO dao = new BookDAO();

List<BookVO> glist = dao.gList(g_id);
for (int i = 0; i < glist.size(); i++) {
	BookVO gvo = (BookVO) glist.get(i);
	
	String g_profile = gvo.getG_profile();
	String g_name = gvo.getG_name();
	String g_gender = gvo.getG_gender();
	String g_birth = gvo.getG_birth();
	String g_address = gvo.getG_address();
	String g_service1 = gvo.getG_service1();
	String g_service2 = gvo.getG_service2();
	String g_service3 = gvo.getG_service3();
	String g_qualification = gvo.getG_qualification();
	String g_location1 = gvo.getG_location1();
	String g_location2 = gvo.getG_location2();
	String g_location3 = gvo.getG_location3();
	String g_hourwage1 = gvo.getG_hourwage1();
	String g_hourwage2 = gvo.getG_hourwage2();
	String g_hourwage3 = gvo.getG_hourwage3();
	
	String profile = file_repo + g_profile;

	
	//String[] parts = g_address.split("/");
	//String g_addr = parts[2];
	//String[] addrparts = g_addr.split(" ");
	//String g_addrloc = addrparts[0]+" " + addrparts[1];

	 int idx = g_address.indexOf(" ");
	 String gaddress = g_address.substring(idx + 1);
	 int fidx = gaddress.indexOf(" ");
	 String address = gaddress.substring(0, fidx);
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
   Date birthDate = dateFormat.parse(g_birth);
    
    Calendar birthCalendar = Calendar.getInstance();
   birthCalendar.setTime(birthDate); // 생년월일 Caelendar 객체에 저장
    
    Calendar currentCalendar = Calendar.getInstance(); // 현재시간 기준
    
    int birthYear = birthCalendar.get(Calendar.YEAR);
    int currentYear = currentCalendar.get(Calendar.YEAR);
    
    int age = currentYear - birthYear; // 나이 계산
 
    int birthMonth = birthCalendar.get(Calendar.MONTH);
    int currentMonth = currentCalendar.get(Calendar.MONTH);
    
    int birthDay = birthCalendar.get(Calendar.DAY_OF_MONTH);
    int currentDay = currentCalendar.get(Calendar.DAY_OF_MONTH);
    
 // 생일이 지났는지 체크
    if (currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay)) {
        age--; } // 아직 생일이 지나지 않았으면 나이에서 1을 뺌 
 
    
%>

	<form name="ginfoForm">
	<div style="border: 1px solid #ccc; border-radius: 10rem; background: white; width: 10rem; padding: 10px; height: 10rem; margin: 3rem auto 2rem auto;">
		<img src="<%=profile %>" style="width: 100%;">
	</div>
		<table>
			<tr><td>이름</td><td><%=g_name%></td></tr>
			<tr><td>성별</td><td><% if(g_gender.equals("W")) { %> 여 <% }else { %> 남 <% } %></td></tr>
			<tr><td>나이</td><td><%=age%>세</td></tr>
			<tr><td>거주지역</td><td><%=address %></td></tr>
			<tr><td>활동지역</td><td>1순위 : <%=g_location1 %><br>
			2순위 : <%=g_location2 %><br>
			3순위 : <%=g_location3 %>
		</td></tr>
			<tr><td>주요서비스</td><td>1순위 : <%=g_service1 %><br>
			2순위 : <%=g_service2 %><br>
			3순위 : <%=g_service3 %>
		</td></tr>
			<tr><td>보유자격증</td><td><%=g_qualification %></td></tr>
			<tr><td>간병후기</td>
			<td>
			<a href="../book/review?g_id=<%=g_id%>">확인</a>
			</td>
		</table>
	</form>
	
	<% }%>
	<div class="form_button">
	<input type="button" class="button special" onclick="window.close();" value="닫기">
	</div>

</body>
</html>
