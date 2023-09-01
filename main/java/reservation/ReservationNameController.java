package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReservationNameController
 */
@WebServlet("/reservation/name")
public class ReservationNameController extends HttpServlet {
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
		
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		
		PrintWriter out = response.getWriter();
		
		if(type==null) {
			int ok = rdao.tinfocheck(m_id);
		

		CaretakerinfoVO vo = new CaretakerinfoVO();

		if (ok == 0) {
			System.out.println("정보없음");
		
			out.println("<script>");
			 out.println("alert('등록된 회원정보가 없습니다.');");
		    out.println("location.href='"+context+"/member/main';");
		    out.println("</script>");
		} else if (ok == 1) {
		System.out.println("정보있음");
		List<CaretakerinfoVO> namelist = rdao.listtname(m_id);
		request.setAttribute("nameList", namelist);
		RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/rescaretaker.jsp");
		dispatch.forward(request, response);
		
	}
		} else if(type.equals("tinfo")) {
			String tname = request.getParameter("tname");
			session.setAttribute("t_name", tname);
			
			List<CaretakerinfoVO> listtinfo = rdao.listtinfo(m_id, tname);
			 
			for(CaretakerinfoVO listvo : listtinfo) {
				String t_code = listvo.getT_code();
				//System.out.println(t_code);
				session.setAttribute("t_code", t_code);
			}

			
			request.setAttribute("listtinfo", listtinfo);

			
			RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/rescaretaker_info.jsp");
			dispatch.forward(request, response);
		} else if(type.equals("resinsert")) {
			String t_code = (String)session.getAttribute("t_code");
			String consciousness = request.getParameter("consciousness");
			String care_meal_yn = request.getParameter("care_meal_yn");
			String care_toilet = request.getParameter("care_toilet");
			String state_paralysis = request.getParameter("state_paralysis");
			String state_mobility = request.getParameter("state_mobility");
			String bedsore_yn = request.getParameter("bedsore_yn");
			String suction_yn = request.getParameter("suction_yn");
			String outpatient_yn = request.getParameter("outpatient_yn");
			String care_night_yn = request.getParameter("care_night_yn");
			String notice = request.getParameter("notice");
			
			if(m_id !=null && t_code!=null) {
				
				ReservationVO vo = new ReservationVO();
				
				vo.setM_id(m_id);
				vo.setCaretaker_code(t_code);
				vo.setConsciousness(consciousness);
				vo.setCare_meal_yn(care_meal_yn);
				vo.setCare_toilet(care_toilet);
				vo.setState_paralysis(state_paralysis);
				vo.setState_mobility(state_mobility);
				vo.setBedsore_yn(bedsore_yn);
				vo.setSuction_yn(suction_yn);
				vo.setOutpatient_yn(outpatient_yn);
				vo.setCare_night_yn(care_night_yn);
				vo.setNotice(notice);
				
				
				String res_code = rdao.insert(vo);
				session.setAttribute("res_code", res_code);

				ReservationInfoVO infovo = new ReservationInfoVO();
				
				infovo.setCaretaker_code(t_code);
				infovo.setRes_code(res_code);
				
				rdao.insertrescode(infovo);
				
				request.setAttribute("res_code", res_code);
				
				out.println("<script>");
				out.println("alert('예약번호가 생성되었습니다.');");
		        out.println("location.href='"+context+"/reservation/location';");
		        out.println("</script>");
				
				} else {
				out.println("<script>");
				out.println("alert('정보가 없습니다');");
				out.println("location.href='"+context+"/member/main';");
				out.println("</script>");
			}

		}
	}
}
