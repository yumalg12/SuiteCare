package review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

@WebServlet("/member/review")
public class MemberReviewController extends HttpServlet {
	mReviewDAO dao;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/member/mReview.jsp");
		dispatch.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		String res_code = request.getParameter("res_code");
		String g_id = request.getParameter("g_id");
		
		dao = new mReviewDAO();

		String type = request.getParameter("type");
		System.out.println(m_id);
		System.out.println(res_code);
		System.out.println(g_id);
		
		if (type.equals("review")) {
		
	
		int re_kind = Integer.parseInt(request.getParameter("re_kind"));
		int re_time = Integer.parseInt(request.getParameter("re_time"));
		int re_pro = Integer.parseInt(request.getParameter("re_pro"));
		int re_speed = Integer.parseInt(request.getParameter("re_speed"));
		int re_com = Integer.parseInt(request.getParameter("re_com"));
		int re_price = Integer.parseInt(request.getParameter("re_price"));
		String comment = request.getParameter("comment");
		
		mReviewVO vo = new mReviewVO(m_id, res_code, g_id, re_kind, re_time, re_pro, re_speed, re_com, re_price, comment);
		
		String context = ((HttpServletRequest)request).getContextPath();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (dao.addReview(vo)) {
	        out.println("alert('후기 등록이 완료되었습니다.');");
	        out.println("window.close(); opener.location.reload();");
		} else {
	        out.println("alert('오류가 발생했습니다.');");
	        out.println("location.href='"+context+"/member/mReview.jsp';");
		}
		out.println("</script>");
        
		}

	}
	
	
}