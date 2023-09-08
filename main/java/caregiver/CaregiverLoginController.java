package caregiver;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/caregiver/login")
public class CaregiverLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CaregiverLoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		RequestDispatcher dispatch = request.getRequestDispatcher("/careGiver/gLogin.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		String g_id = request.getParameter("g_id");
		String g_pw = request.getParameter("g_pw");
		System.out.println(g_id);
		System.out.println(g_pw);

		String context = ((HttpServletRequest) request).getContextPath();

		CaregiverDAO dao = new CaregiverDAO();

		int ok = dao.logincheck(g_id, g_pw);
		System.out.println("ok = " + ok);

		CaregiverVO vo = new CaregiverVO();

		out.print("<script>");
		if (ok == 1) {
			vo = dao.userLogin(g_id, g_pw);
			session.setAttribute("g_id", vo.getG_id());

			out.println("alert('로그인 성공')");
			out.println("location.href='"+context+"/caregiver/main?type=index';");
	        System.out.println(g_id+" 로그인 성공");
		} else if (ok == 2) {
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("location.href='"+context+"/caregiver/login';");
			System.out.println(g_id+"비밀번호 불일치");
		} else if (ok == 3) {
			out.println("alert('가입되지 않은 아이디입니다.');");
			out.println("location.href='"+context+"/caregiver/login';");
			
			System.out.println(g_id+"아이디 없음");
		}
		out.print("</script>");
	}

}
