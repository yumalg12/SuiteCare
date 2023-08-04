package payment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
/**
 * Servlet implementation class PayController
 */
@WebServlet("/Payment/*")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	PayDAO payDAO = new PayDAO();
	PayVO payvo;

    public PayController() {
        super();
        
    }

    /**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
		
		
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		  doHandle(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
	
		System.out.println("컨트롤러도착");
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String url = request.getRequestURI();
		int index = url.lastIndexOf("/");		
		String path=url.substring(index);		
		System.out.println(path);
		String m_id = (String)request.getSession().getAttribute("m_id");
		System.out.println(m_id);
		
		//List<PayVO> addpay = new ArrayList<PayVO>();
		
		if(path.equals("/addpay.do")) {
			
			String amount = request.getParameter("amountRsp");
			String merchant_uid = request.getParameter("merchant_uidRsp");
			String pay_method = request.getParameter("pay_method");
			//addpay = PayService.insorder();
	        
	        out.write(amount + "," + pay_method + "," + merchant_uid+ "," + m_id);
	        
	        PayVO payvo = new PayVO(amount, merchant_uid, pay_method, m_id);
	        PayDAO payDAO = new PayDAO();
			payDAO.addPay(payvo);
	        
		}
		else if(path.equals("/kakao.do")){
			
			
			if(m_id != null) {
			String kakao = "/payment/kakaopay.jsp"; 
			response.sendRedirect(kakao);
			}else {
				String msg = "로그인 정보가 없습니다";
				out.write("<script>alert('"+msg+"');</script>");
				String gomain = "/index.jsp";
				response.sendRedirect(gomain);
			}
		}
		else if(path.equals("/card.do")){
			
			
			if(m_id != null) {
			String card = "/payment/card.jsp"; 
			response.sendRedirect(card);
			}else {
				String msg = "로그인 정보가 없습니다";
				out.write("<script>alert('"+msg+"');</script>");
				String gomain = "/index.jsp";
				response.sendRedirect(gomain);
			}
			
		}
		
		
	

}}

