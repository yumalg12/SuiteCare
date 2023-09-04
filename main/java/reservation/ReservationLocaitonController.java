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
 * Servlet implementation class ReservationLocaitonController
 */
@WebServlet("/reservation/location")
public class ReservationLocaitonController extends HttpServlet {
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
		
		
		
		PrintWriter out = response.getWriter();
		if(type==null) {
			RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/rescareloc.jsp");
			dispatch.forward(request, response);
		} else if(type.equals("reshome")) {
			    if (res_code != null || r_code != null) {
			        String targetCode = (res_code != null) ? res_code : r_code;
			        //System.out.println("타겟코드 : " + targetCode);
			        int result = rdao.updatehome(targetCode);
			        out.println("<script>");
			        if (result == 1) {
						out.println("alert('간병장소를 선택합니다.');");
				        out.println("location.href='"+context+"/reservation/home';");
			        } else {
						 out.println("alert('업데이트 오류');");
					    out.println("location.href='"+context+"/member/main';");
					    
			        	}
			        out.println("</script>");
		}} else if(type.equals("reshospital")) {
			out.println("<script>");
			out.println("alert('간병장소를 선택합니다.');");
	        out.println("location.href='"+context+"/reservation/hospital';");
	        out.println("</script>");
			
		}
		
	}

}
