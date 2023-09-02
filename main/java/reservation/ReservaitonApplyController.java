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
 * Servlet implementation class ReservaitonApplyController
 */
@WebServlet("/reservation/apply")
public class ReservaitonApplyController extends HttpServlet {
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
		String t_code =(String) session.getAttribute("t_code");
		String res_code =(String) session.getAttribute("res_code");
		String caretaker_code = (String) session.getAttribute("caretaker_code");
		String r_code = (String) session.getAttribute("r_code");
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		//System.out.println("타입 : " + type);
		
		PrintWriter out = response.getWriter();
		
			if(type==null) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/res_hourwage.jsp");
				dispatch.forward(request, response);
			
			} else if(type.equals("apply")) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/book/applybook.jsp");
				dispatch.forward(request, response);
			}
			
	}
}
