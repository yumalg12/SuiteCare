package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/membersignup")
public class SignUpController extends HttpServlet {
	MemberDAO dao;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		dao = new MemberDAO();
		
		String type = request.getParameter("type");
		
		//중복확인
		if (type.equals("isDuplicateID")) {
			String id = request.getParameter("id");
			 
			boolean isDuplicateID = dao.isDuplicateID(id);
			
			System.out.println(isDuplicateID);
			
			// Return results in JSON format
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("{\"isDuplicateID\": " + isDuplicateID + "}");
		}
		
		//회원가입
		else if (type.equals("signUp")) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String sms_yn = request.getParameter("sms_yn");
		String email_yn = request.getParameter("email_yn");
		
		MemberVO vo = new MemberVO(id, pw, name, gender, phone, email, address, sms_yn, email_yn);
		
		dao.addMember(vo);
		
        response.sendRedirect("index.jsp");
		}

	}
	
	
}
