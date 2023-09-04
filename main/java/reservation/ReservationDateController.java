package reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReservationDateController
 */
@WebServlet("/reservation/date")
public class ReservationDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
ReservationDAO rdao;
	
	
	public void init() throws ServletException {
		rdao = new ReservationDAO();
	}
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String t_code = (String) session.getAttribute("t_code");
		String res_code = (String) session.getAttribute("res_code");
		String caretaker_code = (String) session.getAttribute("caretaker_code");
		String r_code = (String) session.getAttribute("r_code");
		
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		System.out.println("타입은 " + type);
		
		PrintWriter out = response.getWriter();
		
		if(type==null) {
			RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/res_date.jsp");
			dispatch.forward(request, response);
		} else {
			String start_date = request.getParameter("startdate");
			String end_date = request.getParameter("enddate");
			String start_time = request.getParameter("starttime");
			String end_time = request.getParameter("endtime");
			
			System.out.println(start_date);
			System.out.println(start_time);

			ReservationInfoVO vo = new ReservationInfoVO();

			vo.setStart_date(start_date);
			vo.setEnd_date(end_date);
			vo.setStart_time(start_time);
			vo.setEnd_time(end_time);

			if(res_code!=null) {
				vo.setRes_code(res_code);
				vo.setCaretaker_code(t_code);

				int check_ok = rdao.checkres(vo);
				
				out.println("<script>");
				if(check_ok==0) {
					out.println("alert('기존 예약과 중복되었습니다. \\n 확인해주세요.');");
				    out.println("location.href='"+context+"/reservation/date';");
				} else {
				int result = rdao.updateresinfo(vo);

				if(result>0) {
					session.removeAttribute("t_code");
									
        			out.println("alert('예약이 완료되었습니다.');");
				    out.println("location.href='"+context+"/reservation/match';");
					
				} else {
					out.println("alert('예약 실패');");
				    out.println("location.href='"+context+"/reservation/date';");
					
				} }
				 out.println("</script>");
				}

				else if(res_code==null) {
					
				vo.setRes_code(r_code);
				vo.setCaretaker_code(caretaker_code);

				int check_ok = rdao.checkres(vo);

				out.println("<script>");
				if(check_ok==0) {
					out.println("alert('기존 예약과 중복되었습니다. \\n 확인해주세요.');");
				    out.println("location.href='"+context+"/reservation/date';");
				    
				} else {
				int result = rdao.updateresinfo(vo);

				if(result>0) {
					session.removeAttribute("r_code");
					session.removeAttribute("caretaker_code");
					out.println("alert('일시 지정 완료');");
				    out.println("location.href='"+context+"/member/main';");
				} else {
					out.println("alert('일시 지정 실패');");
					out.println("location.href='"+context+"/reservation/date';");
				} } 
				out.println("</script>");
		}
		
	}}
}
