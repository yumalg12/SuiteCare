package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/login")
public class MemberLoginConroller extends HttpServlet {
	MemberDAO dao;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/member/mLogin.jsp");
		dispatch.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");

		dao = new MemberDAO();

		int ok = dao.logincheck(m_id, m_pw);
		System.out.println("ok = " + ok);

		MemberVO vo = new MemberVO();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String context = ((HttpServletRequest)request).getContextPath();
		
		out.println("<script>");
		if(ok==1) {
			vo = dao.userLogin(m_id, m_pw);
			session.setAttribute("m_id", vo.getM_id());

			out.println("alert('로그인에 성공하였습니다.');");
	        out.println("location.href='main?type=index';");
	        System.out.println(m_id+" 로그인 성공");
		} else if(ok==2) {
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("location.href='"+context+"/member/login';");
			System.out.println(m_id+" 비밀번호 불일치");
		}
		else if(ok==3) {
			out.println("alert('가입되지 않은 아이디입니다.');");
	        out.println("location.href='"+context+"/member/login';");
			System.out.println(m_id+" 아이디 없음");

		}
		out.println("</script>");
	}
}
