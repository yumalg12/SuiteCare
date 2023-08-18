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
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("g_id");
		
		CaregiverDAO dao = new CaregiverDAO();
		LocationDAO loc = new LocationDAO();
		List<CaregiverVO> info;
		List<LocationVO> location;
		info = dao.giver_info(user_id);
		location = loc.location();
		request.setAttribute("info", info);
		request.setAttribute("location", location);
		
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
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("g_id");
		
		if (command != null && command.equals("pw_change")) {
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
		} else if (command != null && command.equals("update")) {
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String address = request.getParameter("g_address");
			String location = request.getParameter("location");

			String[] repre = request.getParameterValues("service");
			String[] qual = request.getParameterValues("qual");
			String representative = "";
			String qualification = "";
			
			for(int i=0; i<repre.length; i++) {
				representative += repre[i];
				if(!(i == repre.length-1)) {
					representative += "&";
				}
			}
			
			for(int i=0; i<qual.length; i++) {
				if (qual[i] != "") {
					qualification += qual[i];
					if(!(i == qual.length-1)) {
						qualification += "&";
					}
				}
			}
			
            String sms_yn=request.getParameter("sms_yn") != null ? request.getParameter("sms_yn") : "N";
			String email_yn=request.getParameter("email_yn") != null ? request.getParameter("email_yn") : "N";
			
			
			CaregiverDAO dao = new CaregiverDAO();
			dao.update(user_id, name, gender, phone, sms_yn, email, email_yn, address, location, representative, qualification);
			out. println("<script>alert('회원 정보가 변경되었습니다.'); location.href='caregiver';</script>");
		
		}
	}
}
