package caretaker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import caretaker.TakerDAO;
import caretaker.TakerVO;



@WebServlet("/member/taker")
public class TakerController extends HttpServlet {
	TakerDAO dao;


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String m_id = (String) session.getAttribute("m_id");
		
		TakerDAO dao = new TakerDAO();
		
		String type = request.getParameter("command");

		
		if (type.equals("insert")) {
		
	
			String t_name = request.getParameter("t_name");
			String t_gender = request.getParameter("t_gender");
			String t_age = request.getParameter("t_age");
			String t_height = request.getParameter("t_height");
			String t_weight = request.getParameter("t_weight");
			String diagnosis = request.getParameter("diagnosis");
		
			TakerVO vo = new TakerVO();

			vo.setM_id(m_id);
			vo.setT_name(t_name); 
			vo.setT_gender(t_gender);
			vo.setT_age(t_age); 
			vo.setT_height(t_height);
			vo.setT_weight(t_weight);
			vo.setDiagnosis(diagnosis); 

			
			dao.insert(vo);
		

		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('피간병인 정보 등록이 완료되었습니다.');");
		out.println("window.location.href='main';");
		
		out.println("</script>");
        
		}

	}
	
	
}
