<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>아이디찾기</title>

    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <link href="./css/ie10-viewport-bug-workaround.css" rel="stylesheet">
  	<link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/style_index.css">
    <link href="./css/signin.css" rel="stylesheet">
    <link href="jumbotron.css" rel="stylesheet">
    
    <script src="./js/ie-emulation-modes-warning.js"></script>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
  
<style>
.navbar{
	background-color: white;
	border: none;
	padding: 10px;
	margin: 10px;
	margin-left: 70px;
    margin-right: 70px;
}

.btn {
	background-color: #3F2305;
	border: none;
}
.btn-primary:hover {
  	color: #fff;
  	background-color: #DFD7BF;
}
</style>


	<script src="js/bootstrap.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/d75ead5752.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="./js/script.js"></script>
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

<div class="container">
      <form action="./pFindIdCheck.jsp" class="form-signin">
       <h2 class="form-signin-heading">아이디 찾기</h2><br>
        <label for="name" class="sr-only">이름</label> 이름
        <input type="text" id="findname" name="name" class="form-control" placeholder="이름" required autofocus><br>
       
        <label for="phone" class="sr-only">핸드폰번호</label> 핸드폰번호
		<input class="form-control" name="phone" type="text" pattern="\d*" size=20 maxlength="11" placeholder = "'-'를 제외한 핸드폰 번호를 입력하시오"/>
		<br><br>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">아이디 찾기</button>
      </form>

</div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>