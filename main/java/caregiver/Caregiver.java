package caregiver;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Caregiver
 */
@WebServlet("/caregiver")
public class Caregiver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Caregiver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		CaregiverDAO dao = new CaregiverDAO();
		List<CaregiverVO> info;
		info = dao.giver_info("dool");
		request.setAttribute("info", info);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("careGiver/caregiver_info.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String command = request.getParameter("command");
		
		if (command != null && command.equals("pw_change")) {
			HttpSession session = request.getSession();
			String user_id = (String)session.getAttribute("userID");
			String orgin_pw = request.getParameter("origin_pw");
			String new_pw = request.getParameter("new_pw");
			
			CaregiverDAO dao = new CaregiverDAO();
			
			if(dao.pwupdate(user_id, orgin_pw, new_pw)) {
				out.print("<html><body>");
				out.print("<script>"
						+ "alert('비밀번호가 변경되었습니다.'); window.close(); opener.location.reload();" + "</script>");
				out.print("</body></html>");
			} else {
				out.print("<html><body>");
				out.print("<script>"
						+ "alert('기존 비밀번호가 일치하지 않습니다.');"
						+ "history.go(-1);"
						+ "</script>");
				out.print("</body></html>");
			}
		}
	}
}
