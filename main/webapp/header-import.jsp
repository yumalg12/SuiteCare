<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>

<%
String context = request.getContextPath();
//System.out.println("context: "+context);
request.setCharacterEncoding("utf-8");
%>
<!--          meta 선언          -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">

<!--          script 선언          -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d75ead5752.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<!--          link 선언          -->
<link rel="stylesheet" href="<%=context %>/assets/css/main.css" />
<link rel="stylesheet" href="<%=context %>/assets/css/sc.css" />
<link rel="stylesheet" href="<%=context %>/assets/css/bootstrap.tab.css" />

<!--          로그인 체크          -->
<% String m_id = (String)session.getAttribute("m_id");
String g_id = (String)session.getAttribute("g_id");

String[] uriArr = request.getServletPath().split("/");
String uri = uriArr[uriArr.length-1];
//System.out.println("uri: "+uri);

String[] pageArray = {"index.jsp", "mSignup.jsp", "mLogin.jsp", "gSignup.jsp", "caregiverLogin.jsp"};
List<String> pageList = Arrays.asList(pageArray);

if(!pageList.contains(uri)) {
	if(m_id == null && g_id == null){
		System.out.println("로그인 세션 없음");
		out.print("<script>alert('로그인이 필요합니다.'); location.href='"+context+"/index.jsp';</script>");
	}
}%>