package payment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import match.*;
import member.*;
import recommend.*;
import reservation.*;
import caregiver.*;
import book.*;


@WebServlet("/Payment/*")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PayVO payvo = new PayVO();
	PayDAO payDAO = new PayDAO();

	public PayController() {
		super();

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

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String context = ((HttpServletRequest)request).getContextPath();

		PrintWriter out = response.getWriter();
		System.out.println("PayContoller 호출됨");

		String url = request.getRequestURI();
		int index = url.lastIndexOf("/");
		String path = url.substring(index);
		System.out.println(path);
		
		HttpSession session = request.getSession();
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println(m_id);

		if (path.equals("/popup")){
			
			MatchDAO mdao = new MatchDAO();
			recommenDAO rcdao	= new recommenDAO();
			ReservationDAO rdao = new ReservationDAO();
			MemberDAO memdao = new MemberDAO();
			CaregiverDAO gdao = new CaregiverDAO();
			BookDAO bdao = new BookDAO();
			
			String g_id = request.getParameter("g_id");
			String res_code = request.getParameter("res_code");
			String b_id = request.getParameter("b_id");
			
			if (m_id == null) {
				System.out.println("세션 만료됨");
				RequestDispatcher dispatch = request.getRequestDispatcher("/pay/mileage_payment.jsp");
				dispatch.forward(request, response);
			}
			
			List<MemberVO> listmem = memdao.listMembers(m_id);
			request.setAttribute("m_name", listmem.get(0).getM_name());
			request.setAttribute("m_current_mile", listmem.get(0).getM_current_mile());
			
			request.setAttribute("g_name", gdao.giver_info(g_id).get(0).getG_name());
			
			List<ReservationVO> reslist = rdao.reslistForPayment(res_code);
			Date start_date = reslist.get(0).getS_date();
			Date end_date = reslist.get(0).getE_date();
			Time start_time = reslist.get(0).getS_time();
			Time end_time = reslist.get(0).getE_time();
			request.setAttribute("start_date", start_date);
			request.setAttribute("end_date", end_date);
			request.setAttribute("start_time", start_time.toString().substring(0,5));
			request.setAttribute("end_time", end_time.toString().substring(0,5));
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date startDate = format.parse(start_date + " " + start_time);
			Date endDate = format.parse(end_date + " " + end_time);
			System.out.println(startDate +" / "+ endDate);
			
			long diffInMillies = Math.abs(endDate.getTime() - startDate.getTime());
			long diffHours = diffInMillies / (60 * 60 * 1000);
			System.out.println(diffHours);
			
			int hourwage = bdao.getRequestedHourwage(b_id);
			
			request.setAttribute("hourwage", hourwage);
			request.setAttribute("total_fee", hourwage*diffHours);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/pay/mileage_payment.jsp");
			dispatch.forward(request, response);
			
		} else if (path.equals("/addpay.do")) {
			//pay DB에 추가
			int amount = Integer.parseInt(request.getParameter("amountRsp")); //결제하는 금액
			String pay_method = request.getParameter("pay_method");
			String merchant_uid = request.getParameter("mercahnt_uid");
			int m_current_mileage = payvo.getM_current_mileage(); //현재 가지고 있는 마일리지
			System.out.println("컨트롤러 전송 마일리지:" + m_current_mileage);
			String m_phone = payvo.getM_phone();
			
			System.out.println(amount + "," + pay_method);
			
			PayVO payvo = new PayVO(amount, pay_method, m_id, merchant_uid);
			payDAO.addPay(payvo);
			
			response.sendRedirect("/Payment/popup");
		} else if (path.equals("/kakao.do")) {

			if (m_id != null) {
				payvo.setM_id(m_id);
				List<PayVO> list = payDAO.payInfo(payvo);

				String kakao = "/pay/kakaopay.jsp";
				request.setAttribute("list", list);
				RequestDispatcher dispatch = request.getRequestDispatcher(kakao);
				dispatch.forward(request, response);
			} else {
				String msg = "로그인 정보가 없습니다";
				out.write("<script>alert('" + msg + "'); window.close();</script>");
			}
		} else if (path.equals("/card.do")) {

			if (m_id != null) {
				payvo.setM_id(m_id);
				List<PayVO> list = payDAO.payInfo(payvo);

				String card = "/pay/card.jsp";
				request.setAttribute("list", list);
				RequestDispatcher dispatch = request.getRequestDispatcher(card);
				dispatch.forward(request, response);
			} else {
				String msg = "로그인 정보가 없습니다";
				out.write("<script>alert('" + msg + "'); window.close();</script>");
			}

		}
		  
		/*else if (path.equals("/startpayment")) {
			
			int netMile = Integer.parseInt(request.getParameter("netMile"));
			PayVO netvo = new PayVO(m_id, netMile);
			PayDAO.startpayment(netvo);
			
		}*/ //-> 결제 시 마일리지 차감 기능 추가 중

	}
}
