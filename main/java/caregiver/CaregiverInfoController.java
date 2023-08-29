package caregiver;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CaregiverInfoController
 */
@WebServlet("/caregiverInfo")
public class CaregiverInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaregiverInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("g_id");
		
		System.out.println("Controller!!!!!");
		String upPath = "assets/profile";
		String rootPath = getServletContext().getRealPath("");
		String path = rootPath + upPath;
			
		String encoding = "utf-8";
		int maxSize = 1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding);
		File file = multi.getFile("g_profile");
		
		String name = multi.getParameter("name");
		String gender = multi.getParameter("gender");
		String phone = multi.getParameter("phone");
		String email = multi.getParameter("email");
		String address = multi.getParameter("g_address");
		String location1 = multi.getParameter("g_location1");
		String location2 = multi.getParameter("g_location2");
		String location3 = multi.getParameter("g_location3");
		String service1 = multi.getParameter("g_service1");
		String service2 = multi.getParameter("g_service2");
		String service3 = multi.getParameter("g_service3");
		String hourwage1 = multi.getParameter("g_hourwage1");
		String hourwage2 = multi.getParameter("g_hourwage2");
		String hourwage3 = multi.getParameter("g_hourwage3");
		
		String[] qual = multi.getParameterValues("qual");
		String qualification = "";
		
		for(int i=0; i<qual.length; i++) {
			if (qual[i] != "") {
				qualification += qual[i];
				if(!(i == qual.length-1)) {
					qualification += "&";
				}
			}
		}
		
        String sms_yn=multi.getParameter("sms_yn") != null ? multi.getParameter("sms_yn") : "N";
		String email_yn=multi.getParameter("email_yn") != null ? multi.getParameter("email_yn") : "N";
		
		String g_profile = "";
		if(file != null) {
			g_profile = file.getName();
			String fileName = file.getName();
			File oldFile = new File(path + "/" + fileName);
			int index = fileName.lastIndexOf(".");
			String saveName= user_id + fileName.substring(index);
			File newFile = new File(path + "/" + saveName);
		    oldFile.renameTo(newFile); // 파일명 변경
			g_profile = saveName;
		} else if(file == null){
			g_profile = multi.getParameter("origin_profile");
		}
		
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
		vo.setG_profile(g_profile);
		
		CaregiverDAO dao = new CaregiverDAO();
		dao.update(user_id, vo);
		out. println("<script>alert('회원 정보가 변경되었습니다.'); location.href='caregiver';</script>");
	
	}

}
