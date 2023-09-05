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

import review.mReviewDAO;
import review.mReviewVO;

/**
 * Servlet implementation class CaregiverReviewController
 */
@WebServlet("/caregiver/review")
public class CaregiverReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaregiverReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("g_id");
		String res_code = (String) request.getParameter("res_code");
		
		mReviewDAO dao = new mReviewDAO();
		List<mReviewVO> list= new ArrayList<mReviewVO>();
		list = dao.review(res_code, user_id);
		
		request.setAttribute("review", list);
		RequestDispatcher dispatch = request.getRequestDispatcher("../careGiver/gReview.jsp");
		dispatch.forward(request, response);
	}

}
