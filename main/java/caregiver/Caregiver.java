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
		ServiceDAO ser = new ServiceDAO();
		List<CaregiverVO> info;
		List<LocationVO> location;
		List<ServiceVO> service;
		info = dao.giver_info(user_id);
		location = loc.location();
		service = ser.service();
		
		request.setAttribute("info", info);
		request.setAttribute("location", location);
		request.setAttribute("service", service);
		
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
			int location1 = Integer.parseInt(request.getParameter("g_location1"));
			int location2 = Integer.parseInt(request.getParameter("g_location2"));
			int location3 = Integer.parseInt(request.getParameter("g_location3"));
			int service1 = Integer.parseInt(request.getParameter("g_service1"));
			int service2 = Integer.parseInt(request.getParameter("g_service2"));
			int service3 = Integer.parseInt(request.getParameter("g_service3"));
			String hourwage1 = request.getParameter("g_hourwage1");
			String hourwage2 = request.getParameter("g_hourwage2");
			String hourwage3 = request.getParameter("g_hourwage3");
			
			String[] qual = request.getParameterValues("qual");
			String qualification = "";
			
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
			
			CaregiverVO vo = new CaregiverVO();
			vo.setG_name(name);
			vo.setG_gender(gender);
			vo.setG_phone(phone);
			vo.setG_email(email);
			vo.setG_address(address);
			vo.setG_sms_yn(sms_yn);
			vo.setG_email_yn(email_yn);
			vo.setG_service1(service1);
			vo.setG_service2(service2);
			vo.setG_service3(service3);
			vo.setG_qualification(qualification);
			vo.setG_location1(location1);
			vo.setG_location2(location2);
			vo.setG_location3(location3);
			vo.setG_hourwage1(hourwage1);
			vo.setG_hourwage2(hourwage2);
			vo.setG_hourwage3(hourwage3);
			
			CaregiverDAO dao = new CaregiverDAO();
			dao.update(user_id, vo);
			out. println("<script>alert('회원 정보가 변경되었습니다.'); location.href='caregiver';</script>");
		
		}
	}
}
