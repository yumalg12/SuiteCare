package book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookController
 */
@WebServlet("/book/complete")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String res_code = request.getParameter("code");
		String g_id = request.getParameter("caregiver");
		
		BookDAO dao = new BookDAO();
		int complete = dao.serviceComplete(res_code, g_id);
		
		System.out.println("count(*) = " + complete);
		
		// Return results in JSON format
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"complete\": " + complete + "}");
	}

}
