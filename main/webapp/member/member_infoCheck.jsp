<%@ page import = "member.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피간병인 정보 등록 확인</title>
</head>
<body>
<% 

request.setCharacterEncoding("utf-8");


MemberDAO dao = new MemberDAO();

String m_id = (String)session.getAttribute("m_id");
String m_pw = request.getParameter("m_pw");
String m_name = request.getParameter("m_name");
String m_gender = request.getParameter("m_gender");
String m_phone = request.getParameter("m_phone");
String m_email = request.getParameter("m_email");
String m_address = request.getParameter("m_address");
String m_sms_yn = request.getParameter("m_sms_yn");
String m_email_yn = request.getParameter("m_email_yn");

MemberVO vo = new MemberVO();

vo.setM_id(m_id);
vo.setM_pw(m_pw); 
vo.setM_name(m_name);
vo.setM_gender(m_gender); 
vo.setM_phone(m_phone);
vo.setM_email(m_email);
vo.setM_address(m_address);
vo.setM_sms_yn(m_sms_yn); 
vo.setM_email_yn(m_email_yn); 

dao.update(vo);

%>

<script>
alert("정보 수정이 완료되었습니다.");
window.location.href='../member/mMain.jsp';
</script>

</body>
</html>