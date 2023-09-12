package match;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.util.Arrays;
import java.util.List;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recommend.*;
import reservation.*;
import member.*;

/**
 * Servlet implementation class MatchApplyController
 */
@WebServlet("/match/apply")
public class MatchApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    MatchDAO mdao = new MatchDAO();
    recommenDAO rcdao	= new recommenDAO();
    ReservationDAO rdao = new ReservationDAO();
    MemberDAO memdao = new MemberDAO();
    
	public void init() throws ServletException {
		mdao = new MatchDAO();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (ServletException | IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (ServletException | IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		String nextPage = null;
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
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
        		List<RecommendInfoVO> ginfoList = rcdao.chosenRecomInfo(res_code, g_id); //re_id === res_code
        		Integer[] wageArr = {
        				Integer.parseInt(ginfoList.get(0).getG_hourwage1()),
        				Integer.parseInt(ginfoList.get(0).getG_hourwage2()),
        				Integer.parseInt(ginfoList.get(0).getG_hourwage3())};
        		Arrays.sort(wageArr);
        		request.setAttribute("wageArr", wageArr);
        		
				RequestDispatcher dispatch = request.getRequestDispatcher("/match/match_hourwage.jsp");
				dispatch.forward(request, response);
			} else if(type.equals("hourwage")) {
				
				List<MemberVO> listmem = memdao.listMembers(m_id);
				request.setAttribute("m_name", listmem.get(0).getM_name());
				request.setAttribute("current_mile", listmem.get(0).getM_current_mile());
				
				List<ReservationVO> reslist = rdao.reslistForPayment(res_code);
				Date start_date = reslist.get(0).getS_date();
				Date end_date = reslist.get(0).getE_date();
				Time start_time = reslist.get(0).getS_time();
				Time end_time = reslist.get(0).getE_time();
				request.setAttribute("work_period", start_date+" ~ "+end_date+" ("+start_time+" ~ "+end_time+")");
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				Date startDate = format.parse(start_date + " " + start_time);
				Date endDate = format.parse(end_date + " " + end_time);

				long diffInMillies = Math.abs(endDate.getTime() - startDate.getTime());
				long diffHours = diffInMillies / (60 * 60 * 1000);
				
				request.setAttribute("total_hours", diffHours);
				
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
