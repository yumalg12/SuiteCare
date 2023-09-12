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
	        request.setAttribute("message", "작성된 후기가 없습니다."); // 메세지 설정
	    } else {
	        boolean allZero = true; // 모든 값이 0.0일때
	        boolean hasData = false; // 하나의 값이라도 0.0이 아니거나 null이 아닌 경우 true

	        for (mReviewVO review : list) {
	            if (review.getAvgReKind() != 0.0 ||
	                review.getAvgReTime() != 0.0 ||
	                review.getAvgRePro() != 0.0 ||
	                review.getAvgReSpeed() != 0.0 ||
	                review.getAvgReCom() != 0.0 ||
	                review.getAvgRePrice() != 0.0 ||
	                review.getRecentComments() != null) {
	                allZero = false;
	                hasData = true;
	                break;
	            }
	        }

	        if (allZero) {
	            request.setAttribute("message", "후기 정보가 없습니다."); // 메세지 설정
	        }

	        request.setAttribute("hasData", hasData);
	    }
		for (mReviewVO review : list) {
		 String recentComments = review.getRecentComments();
         if (recentComments != null && !recentComments.isEmpty()) {
             // ,를 구분자로 사용하여 줄바꿈 문자 <br>로 변환
             recentComments = recentComments.replace("/ ", "<br>");
             review.setRecentComments(recentComments);
         }
         }
	    request.setAttribute("reviewList", list);

		    RequestDispatcher dispatch = request.getRequestDispatcher("../book/greviewCheck.jsp");
		    dispatch.forward(request, response);
		}
}
