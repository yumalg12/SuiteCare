<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "caretaker.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>SC 스위트케어 | 간병 신청</title>
<%@ include file="/header-import.jsp" %>

	</head>
	<body>
<%@ include file="/header.jsp" %>


	<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>Eleifend vitae urna</p>
						<h2>SC SuitCare</h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>간병 서비스를 제공받을 분</p>
								<h2>Information</h2>
							</header>
      <% 
      request.setCharacterEncoding("utf-8");
		String res_code = request.getParameter("res_code");
      
      TakerDAO dao = new TakerDAO();

      List<TakerVO> list = dao.gtresList(res_code);
      for(int i=0; i<list.size(); i++) {
         TakerVO listt = (TakerVO) list.get(i);
   
         String t_name = listt.getT_name();
         String t_gender = listt.getT_gender();
         String t_age = listt.getT_age();
         String t_height = listt.getT_height();
         String t_weight = listt.getT_weight();
         String diagnosis = listt.getDiagnosis();
   
         %>
      
      
  	<!-- form 시작 -->
	<form name="Registform" method="post" onSubmit="return validateForm();" action="./takerInfoCheck.jsp">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="t_name">이름</label>
				<input type="text" value="<%=t_name %>" disabled>
			</div>
			
			<div class="form_row">
				<label for="t_gender">성별</label>
					<input type="text" value="<%=t_gender %>" disabled>
			</div>
			
			<div class="form_row">
				<label for="t_age">나이</label>
				<input type="number"  value="<%=t_age%>" disabled>
			</div>
			
			<div class="form_row">
				<label for="t_height">키 (cm)</label>
				<input type="number" value="<%=t_height%>" disabled>
			</div>
				
			<div class="form_row">
				<label for="t_weight">몸무게 (kg)</label>
				<input type="number" value="<%=t_weight%>" disabled>
			</div>
				
			<div class="form_row">
				<label for="diagnosis">진단명</label>
				<input type="text" value="<%=diagnosis%>" disabled>
			</div>
			<div class="form_button" >
			<input class="button alt" type="button" value=뒤로가기>
			<input class="button special" type="submit" value= 간병지원하기>
			</div>
		</div>
		</div>
		
	</form>
	<!-- form 끝 -->
		<%} %>
</div>
</div>
</div>
</section>

<%@ include file="../footer.jsp" %>

</body>

</html>