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
			
			System.out.println(isDuplicateID);
			
			// Return results in JSON format
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("{\"isDuplicateID\": " + isDuplicateID + "}");
		}
		
		//회원가입
		else if (type.equals("signUp")) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mgender = request.getParameter("mgender");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		String maddress = request.getParameter("maddress");
		String msms_yn = request.getParameter("msms_yn");
		String memail_yn = request.getParameter("memail_yn");
		       
		MemberVO vo = new MemberVO(mid, mpw, mname, mgender, mphone, memail, maddress, msms_yn, memail_yn);
		
		dao.addMember(vo);
		
		String context = ((HttpServletRequest)request).getContextPath();
		//System.out.println("context: "+context);
        response.sendRedirect(context+"/member/caretakerLogin.jsp");
		}

	}
	
	
}
