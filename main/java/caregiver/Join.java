package caregiver;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class Join
 */
@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Join() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String type = request.getParameter("type");
		CaregiverDAO dao = new CaregiverDAO();
		if(type == null) {
			LocationDAO loc = new LocationDAO();
			List<LocationVO> location;
			location = loc.location();
			request.setAttribute("location", location);
			
			ServiceDAO ser_dao = new ServiceDAO();
			List<ServiceVO> service;
			service = ser_dao.service();
			request.setAttribute("service", service);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("careGiver/gSignup.jsp");
			dispatch.forward(request, response);
		} else if (type.equals("isDuplicateID")) {
			String id = request.getParameter("id");
			 
			int isDuplicateID = dao.isDuplicateID(id);
			
			System.out.println("count(*) = " + isDuplicateID);
			
			// Return results in JSON format
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("{\"isDuplicateID\": " + isDuplicateID + "}");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String upPath = "assets/profile";
		String rootPath = getServletContext().getRealPath("/");
		String path = rootPath + upPath;
			
		String encoding = "utf-8";
		int maxSize = 1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
		File file = multi.getFile("g_profile");
		
		String g_profile = "";
		if(file != null) {
			g_profile = file.getName();
			System.out.println("profile : " + g_profile);
		} else {
			g_profile = "man.png";
		}
		
		System.out.println("request : " + request);
		System.out.println("path : " + path);
		System.out.println("maxSize : " + request);
		System.out.println("encoding : " + encoding);
		
		String g_id = multi.getParameter("g_id");
		String g_pw = multi.getParameter("g_pw");
		String g_name = multi.getParameter("g_name");
		String g_gender = multi.getParameter("g_gender");
		String g_birth = multi.getParameter("g_birth");
		String g_phone = multi.getParameter("g_phone");
		String g_email = multi.getParameter("g_email");
		String g_address = multi.getParameter("g_address");
		
		int service1 = Integer.parseInt(multi.getParameter("g_service1"));
		int service2 = Integer.parseInt(multi.getParameter("g_service2"));
		int service3 = Integer.parseInt(multi.getParameter("g_service3"));
		
		int g_location1 = Integer.parseInt(multi.getParameter("g_location1"));
		int g_location2 = Integer.parseInt(multi.getParameter("g_location2"));
		int g_location3 = Integer.parseInt(multi.getParameter("g_location3"));
		
		String g_hourwage1 = multi.getParameter("g_hourwage1");
		String g_hourwage2 = multi.getParameter("g_hourwage2");
		String g_hourwage3 = multi.getParameter("g_hourwage3");
		
		
		String[] qual = multi.getParameterValues("qual");
		String qualification = "";
		for(int i=0; i<qual.length; i++) {
			qualification += qual[i];
			if(!(i == qual.length-1)) {
				qualification += "&";
			}
		}
		
        String g_sms_yn=multi.getParameter("g_sms_yn") != null ? multi.getParameter("g_sms_yn") : "N";
		String g_email_yn=multi.getParameter("g_email_yn") != null ? multi.getParameter("g_email_yn") : "N";
		
		CaregiverVO vo = new CaregiverVO();
		CaregiverDAO dao = new CaregiverDAO();
		vo.setG_id(g_id);
		vo.setG_pw(g_pw);
		vo.setG_name(g_name);
		vo.setG_gender(g_gender);
		vo.setG_birth(g_birth);
		vo.setG_phone(g_phone);
		vo.setG_email(g_email);
		vo.setG_address(g_address);
		vo.setG_sms_yn(g_sms_yn);
		vo.setG_email_yn(g_email_yn);
		vo.setG_profile(g_profile);
		vo.setG_service1(service1);
		vo.setG_service2(service2);
		vo.setG_service3(service3);
		vo.setG_qualification(qualification);
		vo.setG_location1(g_location1);
		vo.setG_location2(g_location2);
		vo.setG_location3(g_location3);
		vo.setG_hourwage1(g_hourwage1);
		vo.setG_hourwage2(g_hourwage2);
		vo.setG_hourwage3(g_hourwage3);
		
		dao.joinMember(vo);
		
		String context = ((HttpServletRequest)request).getContextPath();
		out. println("<script>alert('회원가입이 완료되었습니다.'); location.href='" +context+ "/index.jsp';</script>");
	}

}
