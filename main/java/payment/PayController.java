package payment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Payment/*")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PayVO payvo = new PayVO();
	PayDAO payDAO = new PayDAO();

	public PayController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		System.out.println("PayContoller 호출됨");

		String url = request.getRequestURI();
		int index = url.lastIndexOf("/");
		String path = url.substring(index);
		System.out.println(path);
		
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println(m_id);

		// List<PayVO> addpay = new ArrayList<PayVO>();

		if (path.equals("/addpay.do")) {

			int amount = Integer.parseInt(request.getParameter("amountRsp"));
			String merchant_uid = request.getParameter("merchant_uidRsp");
			String pay_method = request.getParameter("pay_method");
			int currentMile = payvo.getCurrentMile();
			System.out.println("컨트롤러 전송 마일리지:" + currentMile);
			String m_phone = payvo.getM_phone();
			// addpay = PayService.insorder();

			out.write(amount + "," + pay_method + "," + merchant_uid);

			PayVO payvo = new PayVO(amount, merchant_uid, pay_method, m_id, currentMile, m_phone);
			payDAO.addPay(payvo);

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

	}
}
