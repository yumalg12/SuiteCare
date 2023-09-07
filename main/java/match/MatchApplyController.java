package match;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class MatchApplyController
 */
@WebServlet("/match/apply")
public class MatchApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    MatchDAO mdao = new MatchDAO();
	
	public void init() throws ServletException {
		mdao = new MatchDAO();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		HttpSession session = request.getSession();
		String g_id = request.getParameter("g_id");
		String res_code = request.getParameter("res_code");
		String g_name = request.getParameter("g_name");
		String hourwage = request.getParameter("hourwage");
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		//System.out.println("타입 : " + type);
		
		PrintWriter out = response.getWriter();
		
			if(type==null) {
				
				RequestDispatcher dispatch = request.getRequestDispatcher("/match/match_hourwage.jsp");
				dispatch.forward(request, response);
			} else if(type.equals("hourwage")) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/match/match_mileage.jsp");
				dispatch.forward(request, response);
			} else if(type.equals("apply")) {
				String match_status = "매칭신청완료";
				
				MatchVO vo = new MatchVO();
				vo.setRes_code(res_code);
				vo.setG_id(g_id);
				vo.setMatch_status(match_status);
				vo.setHourwage(hourwage);
				
				mdao.insertMatch(vo);
				
				out.println("<script>");
			        out.println("alert('빠른매칭신청이 완료되었습니다.');");
			        out.println("window.opener.location.href = '" + context + "/member/main';");
			        out.println("window.close();");
				out.println("</script>");
			}
		
	}

}
