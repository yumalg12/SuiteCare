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
		
		if(type==null) {
			RequestDispatcher dispatch = request.getRequestDispatcher("/book/tapplyList.jsp");
			dispatch.forward(request, response);
		} else if(type.equals("apply")) {
			int checkb = bdao.checkbook(res_code, g_id);


			if(checkb==0) {
				System.out.println("g_id 정보 없음");
				
				BookVO vo = new BookVO();
				vo.setRes_code(res_code);
				vo.setG_id(g_id);
				vo.setB_status(b_status);
				vo.setHourwage(hourwage);

				bdao.insertbook(vo);
				
				session.removeAttribute("applycode");
				out.println("<script>");
				out.println("alert('매칭신청이 완료되었습니다.');");
				out.println("opener.parent.location.href = \"/suiteCare/caregiver/main?applyPage=1#allapplylist\";");
				out.println("window.close();");
				out.println("</script>");
				
				} else if (checkb==1) {
					System.out.println("g_id 정보있음");
					
					out.println("<script>");
					out.println("alert('매칭승인 대기중입니다.');");
					out.println("opener.parent.location.href = \"/suiteCare/caregiver/main?applyPage=1#allapplylist\";");
	    	        out.println("window.close();");
	    	        out.println("</script>");
				session.removeAttribute("applycode");
				} 
		} else if(type.equals("deny")) {
			String b_id = request.getParameter("b_id");
			res_code = request.getParameter("res_code");
			
			int result = bdao.denybook(b_id);
			
			out.println("<script>");
			if (result == 1) {
				out.println("alert('매칭거절이 완료되었습니다.');");
				out.println("location.href = '" + context + "/book/apply?res_code=" + res_code + "';");
			} else {
				out.println("alert('오류발생');");
				out.println("location.href = '" + context + "/book/apply?res_code=" + res_code + "';");
			}
			out.println("</script>");
		} else if(type.equals("approve")) {
			g_id = request.getParameter("g_id");
			res_code = request.getParameter("res_code");
			String b_id = request.getParameter("b_id");
			
			int result = bdao.approvebook(res_code, b_id);
			
			if (result > 0) {
				int gresult = bdao.updategid(g_id, res_code);
				out.println("<script>");
				if(gresult> 0) {
					out.println("alert('매칭승인이 완료되었습니다.');");
					out.println("window.opener.location.href = '" + context + "/member/main';");
					out.println("window.close();");
				} else {
					out.println("alert('오류발생');");
					out.println("location.href = '" + context + "/book/apply?res_code=" + res_code + "';");
				}
				out.println("</script>");	
	} else {
		out.println("<script>");
		out.println("alert('오류발생');");
		out.println("location.href = '" + context + "/book/apply?res_code=" + res_code + "';");
        out.println("</script>");	
	}	
			
		}
		
	}
}
