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

import reservation.ReservationDAO;

/**
 * Servlet implementation class TakerUpdateController
 */
@WebServlet("/member/takerupdate")
public class TakerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TakerDAO tdao = new TakerDAO();
	
	public void init() throws ServletException {
		tdao = new TakerDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		
		PrintWriter out = response.getWriter();
		
		if(type==null) {
		RequestDispatcher dispatch = request.getRequestDispatcher("/careTaker/tUpdate.jsp");
		dispatch.forward(request, response);
		} else if(type.equals("update")) {
			String t_code = request.getParameter("t_code");
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
			vo.setT_code(t_code);

			int result = tdao.update(vo);
			out.println("<script>");
			if(result == 1) {
				out.println("alert('회원정보 수정이 완료되었습니다.');");
				out.println("location.href='"+context+"/member/main';");
			} else {
				out.println("alert('정보 수정을 완료하지 못했습니다.\\n다시 시도해주세요.');");
				out.println("history.back();");
			}
			out.println("</script>");
		}
	}

}
