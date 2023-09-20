package recommend;

import java.util.List;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Date;
import reservation.ReservationDAO;

/**
 * Servlet implementation class RecommendController
 */
@WebServlet("/recommend")
public class RecommendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	recommenDAO rcdao;
	
	public void init() throws ServletException {
		rcdao = new recommenDAO();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
		
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		String res_code = request.getParameter("res_code");
		String context = ((HttpServletRequest)request).getContextPath();

		String req = request.getRequestURI();
		System.out.println(req);
		request.setCharacterEncoding("utf-8");

		// ServletContext 객체 얻기
		ServletContext servletContext = request.getServletContext();

		// CSV 파일의 절대 경로 얻기
		String csvFilePath = servletContext.getRealPath("/assets/csv/recomm_df.csv");

		String type = request.getParameter("type");
		
		System.out.println("타입은 " + type);
		
		PrintWriter out = response.getWriter();
		
		if(type==null) {
			
			try (BufferedReader reader = new BufferedReader(new FileReader(csvFilePath))) {
			    String line;
			    boolean found = false;
			    while ((line = reader.readLine()) != null) {
			        String[] fields = line.split(",\"");
			        if (fields.length >= 2) {
			            String re_id = fields[0].trim();
			           
        			        if(res_code.equals(re_id)) {
        			        	 found = true;
        			        		String recommendationsData = fields[1].trim();
        			        		
			                recommendationsData = recommendationsData.substring(2, recommendationsData.length() - 3);
			                String[] recommList = recommendationsData.split("', '");
			                
			                
			                if (recommList.length >= 3) {
			                    String recommendations_1 = recommList[0].trim();
			                    String recommendations_2 = recommList[1].trim();
			                    String recommendations_3 = recommList[2].trim(); 
			                    
                        
                        try {
                        	int select = rcdao.selectre(re_id);
                        	if(select==1) {
                        	int update = rcdao.updateRecommendation(re_id, recommendations_1, recommendations_2, recommendations_3);
                        	
                        	if(update>0) {
                        		List<RecommendInfoVO> ginfoList = rcdao.recomList(re_id);
                        		
                        		request.setAttribute("ginfoList", ginfoList);
                        		
                        		
                        	}
                        } else {
                        	rcdao.insertrecommendation(re_id, recommendations_1, recommendations_2, recommendations_3);
                        	List<RecommendInfoVO> ginfoList = rcdao.recomList(re_id);
                        	
                        	request.setAttribute("ginfoList", ginfoList);
                        
                        }
                        	
                			RequestDispatcher dispatch = request.getRequestDispatcher("/member/quickMatchingservice.jsp");
                			dispatch.forward(request, response);	
                        }catch (Exception e) {
                        	e.printStackTrace();
                        }
                        }
                    }
        		 }
                }
			    if (!found) {
			        request.setAttribute("notFoundMessage", "준비중");
			        RequestDispatcher dispatch = request.getRequestDispatcher("/member/quickMatchingservice.jsp");
			        dispatch.forward(request, response);
			    }
            }catch (Exception e) {
                e.printStackTrace();
            }
	}
	}
}
