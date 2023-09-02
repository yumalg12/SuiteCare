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
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		
		
			if(type==null) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/res_hourwage.jsp");
				dispatch.forward(request, response);
			
			} else if(type.equals("apply")) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/book/applybook.jsp");
				dispatch.forward(request, response);
			}
			
	}
}
