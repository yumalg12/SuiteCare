package book;

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
 * Servlet implementation class BookApplyController
 */
@WebServlet("/book/apply")
public class BookApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO bdao;
   
	public void init(ServletConfig config) throws ServletException {
		bdao = new BookDAO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String g_id = (String)session.getAttribute("g_id");
		String res_code = (String)session.getAttribute("applycode");
		String b_status = "신청완료";
		String hourwage = request.getParameter("hourwage");
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		String type = request.getParameter("type");
		
		PrintWriter out = response.getWriter();
		
		if(type.equals("apply")) {
			int checkb = bdao.checkbook(res_code, g_id);

			if(checkb==0) {
				System.out.println("g_id 정보 없음");
				
				BookVO vo = new BookVO();
				vo.setRes_code(res_code);
				vo.setG_id(g_id);
				vo.setB_status(b_status);
				vo.setHourwage(hourwage);

				bdao.insertbook(vo);
				
				out.println("<script>");
				out.println("alert('매칭신청이 완료되었습니다.');");
    	        out.println(" opener.location.reload();';");
    	        out.println("window.close();");
    	        out.println("</script>");
    	        
				session.removeAttribute("applycode");
				
				} else if (checkb==1) {
					System.out.println("g_id 정보있음");
					
					out.println("<script>");
					out.println("alert('매칭승인 대기중입니다.');");
	    	        out.println("location.href='"+context+"/caregiver/main';");
	    	        out.println("window.close();");
	    	        out.println("</script>");

				session.removeAttribute("applycode");
				} 


		}
		
	}
}
