<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="caretaker.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML>
<html>
<head>
<title>SC 스위트케어 | 예약정보</title>
<%@ include file="/header-import.jsp"%>
</head>

<body>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>환자 정보</p>
						<h2></h2>
					</header>
					
					<form name="tinfo">
					<%
					request.setCharacterEncoding("utf-8");
					String t_code = request.getParameter("caretaker_code");

					TakerDAO dao = new TakerDAO();
					List<TakerVO> list = dao.tCode(t_code);
					for (int i = 0; i < list.size(); i++) {
						TakerVO listvo = (TakerVO) list.get(i);
			            
						String name = listvo.getT_name();
						String gender = listvo.getT_gender();
						String age = listvo.getT_age();
						String height = listvo.getT_height();
						String weight = listvo.getT_weight();
						String diagnosis = listvo.getDiagnosis();
					%>

						<div class="form_wrapper">

							<div class="form_row">
								<label for="code">환자 코드</label> 
								<input type="text" value="<%=t_code%>"  readonly>
							</div>
							
							<div class="form_row">
								<label for="name">이름</label> 
								<input type="text" value="<%=name%>"  readonly>
							</div>

							<div class="form_row">
								<label for="gender">성별</label> <input type="text"
									value="<%=gender%>" readonly>
							</div>

							<div class="form_row">
								<label for="age">나이</label> <input type="text"
									value="<%=age%>세" readonly>
							</div>

							<div class="form_row">
								<label for="height">키</label> <input type="text"
									value="<%=height%>cm" readonly>
							</div>
							
							<div class="form_row">
								<label for="weight">몸무게</label> <input type="text"
									value="<%=weight%>kg" readonly>
							</div>
							
							<div class="form_row">
								<label for="diagnosis">진단명</label> <input type="text"
									value="<%=diagnosis%>" readonly>
							</div>
					
						</div>

				</form>
				<!-- form 끝 -->
				<%
				}
				%>
				</div>
			</div>
		</div>
		
	</section>

</body>

</html>