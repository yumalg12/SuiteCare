package caregiver;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.BookDAO;
import patient.PatientresDAO;
import patient.PatientresVO;
import reservation.ReservationVO;

@WebServlet("/caregiver/main")
public class CaregiverMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CaregiverMainController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = (String) request.getParameter("type");
		if (type != null && type.equals("index")) {
			RequestDispatcher dispatch = request.getRequestDispatcher("/index-caregiver.jsp");
			dispatch.forward(request, response);
			
		} else {
			HttpSession session = request.getSession();
			String user_id = (String)session.getAttribute("g_id");
			int current = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
			System.out.println("!!!!!!!!!!!!!");
			System.out.println(request.getParameter("page"));
			int start =0;
			if(current != 1) {
				start = (current-1)*5;
				System.out.println("start === "  + start);
			}
			
			List<ReservationVO> list = new ArrayList<ReservationVO>();
			BookDAO dao = new BookDAO();
			list = dao.myApply(user_id);
			
			PatientresDAO patientres = new PatientresDAO();
			List<PatientresVO> listres = patientres.applylist(start);
			
			List<String> code = dao.code(user_id);
			
			int count = patientres.applyCount();
			int pages = 0;
			if(count%5 == 0) {
				pages = count/5;
			} else {
				pages = (count/5)+1;
			}
			
			request.setAttribute("pages", pages);
			request.setAttribute("myApply", list);
			request.setAttribute("listresA", listres);
			request.setAttribute("MyResCode", code);
			RequestDispatcher dispatch = request.getRequestDispatcher("/careGiver/gMain.jsp");
			dispatch.forward(request, response);
		}
	}
}
