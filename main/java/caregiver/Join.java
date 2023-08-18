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
		
		
		String g_id = multi.getParameter("g_id");
		String g_pw = multi.getParameter("g_pw");
		String g_name = multi.getParameter("g_name");
		String g_gender = multi.getParameter("g_gender");
		String g_birth = multi.getParameter("g_birth");
		String g_phone = multi.getParameter("g_phone");
		String g_email = multi.getParameter("g_email");
		String g_address = multi.getParameter("g_address");
		String g_profile = multi.getFilesystemName("g_profile");
		String g_location = multi.getParameter("g_location");
		
		String[] repre = multi.getParameterValues("service");
		String[] qual = multi.getParameterValues("qual");
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
		vo.setG_representative(representative);
		vo.setG_qualification(qualification);
		vo.setG_location(g_location);
		
		dao.joinMember(vo);
		
		String context = ((HttpServletRequest)request).getContextPath();
		out. println("<script>alert('회원가입이 완료되었습니다.'); location.href='" +context+ "/index.jsp';</script>");
	}

}
