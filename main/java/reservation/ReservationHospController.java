package reservation;

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
 * Servlet implementation class ReservationHospController
 */
@WebServlet("/reservation/hospital")
public class ReservationHospController extends HttpServlet {
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
		String t_code =(String) session.getAttribute("t_code");
		String res_code =(String) session.getAttribute("res_code");
		String caretaker_code = (String) session.getAttribute("caretaker_code");
		String r_code = (String) session.getAttribute("r_code");
		
		String context = ((HttpServletRequest)request).getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		//System.out.println("타입 : " + type);
		
		PrintWriter out = response.getWriter();
		
			if(type==null) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/reservation/reshospital.jsp");
				dispatch.forward(request, response);
			} else if(type.equals("reshosp_addr")) {
				String hospname = request.getParameter("hospname");
				String hospaddr = request.getParameter("hospaddr");
				String hospdetail_addr = request.getParameter("hospdetail_addr");
				
				ReservationVO vo = new ReservationVO();

				vo.setLocation(hospname);
				vo.setAddr(hospaddr);
				vo.setDetail_addr(hospdetail_addr);
				
				    if (res_code != null || r_code != null) {
				        String targetCode = (res_code != null) ? res_code : r_code;
				        vo.setRes_code(targetCode);

				        int result = rdao.updatehospaddr(vo);
				        
				        out.println("<script>");
				        if (result == 1) {
				            if (res_code != null) {
				            	System.out.println("예약코드는 " + res_code);
				            	
					    			out.println("alert('간병장소 업데이트 완료.');");
					    	        out.println("location.href='"+context+"/reservation/date';");
					    	       
				            } else {
				            	session.removeAttribute("r_code");

								out.println("alert('간병장소 업데이트 완료');");
							    out.println("location.href='"+context+"/member/main';");
				            }
				        } else {
							out.println("alert('업데이트 오류');");
							out.println("location.href='"+context+"/member/main';");
						 
				        	}
				        out.println("</script>");
				        }
			} 
			
		}

	}