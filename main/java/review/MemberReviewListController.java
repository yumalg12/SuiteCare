package review;

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

/**
 * Servlet implementation class MemberReviewListController
 */
@WebServlet("/member/review/list")
public class MemberReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		String res_code = (String) request.getParameter("res_code");
		
		mReviewDAO dao = new mReviewDAO();
		List<mReviewVO> list= new ArrayList<mReviewVO>();
		list = dao.mreview(res_code, m_id);
		
		request.setAttribute("mreview", list);
		RequestDispatcher dispatch = request.getRequestDispatcher("../mReviewCheck.jsp");
		dispatch.forward(request, response);
	}


}
