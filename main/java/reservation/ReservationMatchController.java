package reservation;

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
 * Servlet implementation class ReservationMatchController
 */
@WebServlet("/reservation/match")
public class ReservationMatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
ReservationDAO rdao;
	
	
	public void init() throws ServletException {
		rdao = new ReservationDAO();
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
		String m_id = (String) session.getAttribute("m_id");
		String res_code = (String) session.getAttribute("res_code");
		String r_code = (String) session.getAttribute("r_code");
		
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		
		PrintWriter out = response.getWriter();
		
		if(type==null) {
			RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/matchService.jsp");
			dispatch.forward(request, response);
		} else if(type.equals("matchService")) {
			 String pre_location_1 = request.getParameter("pre_location_1");
			 String pre_location_2 = request.getParameter("pre_location_2");
			 String pre_location_3 = request.getParameter("pre_location_3");
			 String pre_age_1 = request.getParameter("pre_age_1");
			 String pre_age_2 = request.getParameter("pre_age_2");
			 String pre_age_3 = request.getParameter("pre_age_3");
			 String pre_gender = request.getParameter("pre_gender");
			 String pre_qual = request.getParameter("pre_qual");
			 String pre_repre_1 = request.getParameter("pre_repre_1");
			 String pre_repre_2 = request.getParameter("pre_repre_2");
			 String pre_repre_3 = request.getParameter("pre_repre_3");
			 String pre_hourwage_1 = request.getParameter("pre_hourwage_1");
			 String pre_hourwage_2 = request.getParameter("pre_hourwage_2");
			 String pre_hourwage_3 = request.getParameter("pre_hourwage_3");
			 String rank1 = request.getParameter("rank1");
			 String rank2 = request.getParameter("rank2");
			 String rank3 = request.getParameter("rank3");
			 String rank4 = request.getParameter("rank4");
			 String rank5 = request.getParameter("rank5");
			 
			 System.out.println("장소1순위 : " + pre_location_1);
			 System.out.println("pre_location_2 : " + pre_location_2);
			 System.out.println("pre_location_3 : " + pre_location_3);
			 
			 ReservationInfoVO vo = new ReservationInfoVO();
			 
			 vo.setPre_location_1(pre_location_1);
			 vo.setPre_location_2(pre_location_2);
			 vo.setPre_location_3(pre_location_3);
			 vo.setPre_age_1(pre_age_1);
			 vo.setPre_age_2(pre_age_2);
			 vo.setPre_age_3(pre_age_3);
			 vo.setPre_gender(pre_gender);
			 vo.setPre_qual(pre_qual);
			 vo.setPre_repre_1(pre_repre_1);
			 vo.setPre_repre_2(pre_repre_2);
			 vo.setPre_repre_3(pre_repre_3);
			 vo.setPre_hourwage_1(pre_hourwage_1);
			 vo.setPre_hourwage_2(pre_hourwage_2);
			 vo.setPre_hourwage_3(pre_hourwage_3);
			 vo.setRank1(rank1);
			 vo.setRank2(rank2);
			 vo.setRank3(rank3);
			 vo.setRank4(rank4);
			 vo.setRank5(rank5);
			 
			 if(res_code!=null) {
				 vo.setRes_code(res_code);


				int result = rdao.updatepre(vo);
				out.println("<script>");
				if(result == 1) {
					session.removeAttribute("res_code");
					out.println("alert('매칭서비스 정보 등록이 완료되었습니다.');");
				    out.println("location.href='"+context+"/member/main';");
						
				} else {
					out.println("alert('에러, 정보 등록을 완료하지 못했습니다.\\n다시 시도해주세요.');");
				    out.println("location.href='"+context+"/reservation/match';");
				
				}
				out.println("</script>");
			 } else if(res_code==null) {
					vo.setRes_code(r_code);


					int result = rdao.updatepre(vo);
					out.println("<script>");
					if(result == 1) {
						session.removeAttribute("r_code");
						
						out.println("alert('매칭서비스 정보 등록이 완료되었습니다.');");
					    out.println("location.href='"+context+"/member/main';");
					} else {
						out.println("<script>");
						out.println("alert('에러, 정보 등록을 완료하지 못했습니다.\\n다시 시도해주세요.');");
					    out.println("location.href='"+context+"/reservation/match';");
					    
					}
					out.println("</script>");
			 }
		
		}
		
	}
}
