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
		<title>SC 스위트케어 | 마이페이지</title>
<%@ include file="/header-import.jsp" %>

	</head>
	
	<script>

		function insertTinfo() {
			window.location.href = "../careTaker/takerInfo.jsp";
		}
		function rescaregiver() {
			window.location.href = "../reservation/rescaretaker.jsp";
		}
		
		function rescalendar() {
			window.location.href = "../member/mMain_calendar.jsp";
		}
		
		function delok() {
			if(!confirm("예약을 취소하시겠습니까?")) {
				
				return false;
			}
		}
		</script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	<body>
<%@ include file="/header.jsp" %>

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
								<p>간병 받을 분</p>
								<h2>기본 정보</h2>
							</header>
							
	 <form name="patientinfo">
      <table>
      <thead>
      <tr><td>No.</td><td>이름</td><td> 성별</td> <td> 나이 </td> <td> 키</td> <td> 몸무게 </td><td> 진단명 </td><td> 수정 </td></tr>
      </thead>
      <% 
      request.setCharacterEncoding("utf-8");
      String m_id = (String)session.getAttribute("m_id");				

	      TakerDAO dao = new TakerDAO();

	      List<TakerVO> list = dao.takerList(m_id);
	      for(int i=0; i<list.size(); i++) {
	         TakerVO listt = (TakerVO) list.get(i);
	   
	         String t_name = listt.getT_name();
	         String t_gender = listt.getT_gender();
	         String t_age = listt.getT_age();
	         String t_height = listt.getT_height();
	         String t_weight = listt.getT_weight();
	         String diagnosis = listt.getDiagnosis();
	   
	         %>
	      <tr><td> <%=i+1 %> </td><td> <%=t_name %> </td><td> <%=t_gender %> </td><td> <%=t_age %>세 </td> <td> <%=t_height %>cm </td> <td> <%=t_weight %>kg </td> <td> <%=diagnosis %> </td><td><a href='../careTaker/tUpdate.jsp?t_name=<%=t_name %>'>수정하기</a></td></tr>
	      <%
	      }
	      %>
	      </table> 
	      </form>


		     <div style="text-align: center;" class="form_btn">
      <input type="button" class = "button special" onclick="insertTinfo();" value="피간병인 정보 등록하기">
         </div>
         </div>
         </div>
         </div>
         </section>
                  
                     
      <!-- three -->
         <section id="three" class="wrapper style2">
            <div class="inner">
               <div class="box">
                  <div class="content">
                     <header class="align-center">
                        <p>간병인 서비스</p>
                        <h2>예약 정보</h2>
                     </header>
         <form name="resinfo">
         <table>
         <thead>
         <tr><td> 피간병인 </td><td> 간병인</td> <td> 근무기간 </td> <td> 근무시간</td> <td> 결제금액 </td> <td> 결제여부</td> <td> 비고</td></tr>
         </thead>
			<%
//아래로는 아직 확인못함
			PatientresDAO dao2 = new PatientresDAO();
			List<PatientresVO> reslist = dao2.listres(m_id);
			for(int i=0; i<reslist.size(); i++) {
				PatientresVO listvo = (PatientresVO) reslist.get(i);
	
				String patient = listvo.getCaretaker();
				Date start_date = listvo.getStartdate();
				Date end_date = listvo.getEnddate();
				Time start_time = listvo.getStarttime();
				Time end_time = listvo.getEndtime();
				String caregiver = listvo.getCaregiver();
				String res_code = "test"; //listvo.getRes_code();
				String caretaker_code = "test"; //listvo.getCaretaker_code();
	
				String workDate = start_date + "~" + end_date;
				String workTimes = start_time + "~" + end_time;
	
				long worktime = end_time.getTime() - start_time.getTime();
				int workHours = (int) (worktime / (1000 * 60 * 60));

				int totalWorkDays =  (int) ((end_date.getTime() - start_date.getTime()) / (1000 * 60 * 60 * 24)) + 1; 
	
				int salary = totalWorkDays * workHours * 10000;
	
	 			String fSalary = String.format("%,d", salary);
	
				if(caregiver==null) {
			%>

			<tr><td> <%=patient %> </td><td> 미지정 </td><td> <%=workDate %> </td> <td> <%=workTimes %> </td> <td> <%=fSalary %>원 </td> <td> ... </td>
			<td><a href="../reservation/resdelete.jsp?res_code=<%= res_code %>&caretaker_code=<%=caretaker_code %>" onclick="return delok();">취소</a></td></tr>


			<%
			} else if(caregiver!= null) {
				%>

			<tr><td> <%=patient %> </td><td> <%=caregiver %> </td><td> <%=workDate %> </td> <td> <%=workTimes %> </td> <td> <%=fSalary %>원 </td> <td> ... </td><td><a href="../reservation/resdelete.jsp?res_code=<%= res_code %>&caretaker_code=<%=caretaker_code %>" onclick="return delok();">취소</a></td></tr>

			<%
			} 

			}
			%>
			</table>
			</form>
			<div style="text-align: center;" class="form_btn">
			<input type="button" class = "button" onclick="rescalendar();" value="달력으로 보기">
			<input type="button" class = "button special" onclick="rescaregiver();" value="간병인 신청하기">
			</div>
			</div>
			</div>
			</div>
			</section>


		<!-- four -->
			<section id="four" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>스위트 케어</p>
								<h2>빠른 매칭 서비스</h2>
							</header>
							</div>
							</div>
							</div>
							</section>
							
<%@include file="/footer.jsp" %>
</body>

</html>