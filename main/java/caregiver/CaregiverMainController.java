package caregiver;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.BookDAO;
import reservation.ReservationVO;

/**
 * Servlet implementation class CaregiverMainController
 */
@WebServlet("/caregiver")
public class CaregiverMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaregiverMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("g_id");
		
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		BookDAO dao = new BookDAO();
		list = dao.myApply(user_id);
		
		request.setAttribute("myApply", list);
		RequestDispatcher dispatch = request.getRequestDispatcher("careGiver/gMain.jsp");
		dispatch.forward(request, response);
	}

}
