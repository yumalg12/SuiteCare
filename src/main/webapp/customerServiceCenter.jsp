<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!--          meta 선언          -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	
	<!--          link 선언          -->
	<link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="./css/style.css">
    
    <!--          script 선언          -->
	<script src="js/bootstrap.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="./js/script.js"></script>
<title>고객센터</title>
<style>
.navbar{
	background-color: white;
	border: none;
	padding: 10px;
	margin: 10px;
	margin-left: 70px;
    margin-right: 70px;
}
</style>
</head>
<body>
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class = "navbar-brand" href="index.jsp">SC 스위트케어</a>
		</div>
		
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="patientLogin.jsp">간병인찾기</a>
				<li><a href="caregiverLogin.jsp">간병일감찾기</a>
				<li><a href="customerServiceCenter.jsp">고객센터</a>
			</ul>
		</div>
</nav>
<hr>

</body>
</html>