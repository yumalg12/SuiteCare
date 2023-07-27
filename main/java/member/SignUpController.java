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
			 
			int isDuplicateID = dao.isDuplicateID(id);
			
			System.out.println("count(*) = " + isDuplicateID);
			
			// Return results in JSON format
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("{\"isDuplicateID\": " + isDuplicateID + "}");
		}
		
		//회원가입
		else if (type.equals("signUp")) {

		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_gender = request.getParameter("m_gender");
		String m_phone = request.getParameter("m_phone");
		String m_email = request.getParameter("m_email");
		String m_address = request.getParameter("m_address");
		String m_sms_yn = request.getParameter("m_sms_yn");
		String m_email_yn = request.getParameter("m_email_yn");
		
		MemberVO vo = new MemberVO(m_id, m_pw, m_name, m_gender, m_phone, m_email, m_address, m_sms_yn, m_email_yn);
		
		dao.addMember(vo);
		
		String context = ((HttpServletRequest)request).getContextPath();
		//System.out.println("context: "+context);
        response.sendRedirect(context+"/member/caretakerLogin.jsp");
		}

	}
	
	
}
