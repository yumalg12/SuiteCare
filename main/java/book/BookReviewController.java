package book;

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
 * Servlet implementation class BookReviewController
 */
@WebServlet("/book/review")
public class BookReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String g_id = (String) request.getParameter("g_id");
		
		mReviewDAO dao = new mReviewDAO();
		List<mReviewVO> list= new ArrayList<mReviewVO>();
		
		list =  dao.reviewavg(g_id);
		
		 if (list.isEmpty()) {
		        // 리스트가 비어있을 경우
		        request.setAttribute("message", "작성된 후기가 없습니다."); // 메세지 설정
		    }
	        // 리스트가 비어있지 않을 경우
	        request.setAttribute("reviewList", list);

		RequestDispatcher dispatch = request.getRequestDispatcher("../book/greviewCheck.jsp");
		dispatch.forward(request, response);
	}

}
