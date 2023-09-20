package match;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MatchController
 */
@WebServlet("/match")
public class MatchController extends HttpServlet {
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
			String g_id = (String) session.getAttribute("g_id");
			String res_code = request.getParameter("res_code");
			
			String context = ((HttpServletRequest)request).getContextPath();
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			String type = request.getParameter("type");
			
			//System.out.println("타입 : " + type);
			
			PrintWriter out = response.getWriter();
			
			if(type==null) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/match/tinfo.jsp");
				dispatch.forward(request, response);
			} else if(type.equals("deny")) {
					int result = mdao.denyMatch(res_code, g_id);
					out.println("<script>");
					if (result == 1) {
						out.println("alert('매칭거절이 완료되었습니다.');");
						out.println("window.opener.location.href = '" + context + "/caregiver/main';");
				        out.println("window.close();");
					} else {
						out.println("alert('오류발생');");
		    	        out.println("location.href='"+context+"../match?res_code=<%=res_code%>';");
					}
					out.println("</script>");
					
			} else if(type.equals("approve")) {
					int result = mdao.approveMatch(res_code, g_id);
					if (result > 0) {
						int gresult = mdao.updategid(g_id, res_code);
						out.println("<script>");
						if(gresult> 0) {
							out.println("alert('매칭승인이 완료되었습니다.');");
							out.println("window.opener.location.href = '" + context + "/caregiver/main';");
							out.println("window.close();");
						} else {
							out.println("alert('오류발생');");
			    	        out.println("location.href='"+context+"../match?res_code=<%=res_code%>';");
						}
						out.println("</script>");	
			} else {
				out.println("<script>");
				out.println("alert('오류발생');");
    	        out.println("location.href='"+context+"../match/tinfo.jsp?res_code=<%=res_code%>';");
    	        out.println("</script>");	
			}	
		}
	}
}
