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
import match.MatchVO;
import patient.PatientresDAO;
import patient.PatientresVO;
import reservation.ReservationDAO;
import reservation.ReservationVO;
import review.mReviewDAO;

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
			int applyPageCurrent = request.getParameter("applyPage") != null ? Integer.parseInt(request.getParameter("applyPage")) : 1;
			int listresPageCurrent = request.getParameter("listresPage") != null ? Integer.parseInt(request.getParameter("listresPage")) : 1;
			int myApplyPageCurrent = request.getParameter("myApplyPage") != null ? Integer.parseInt(request.getParameter("myApplyPage")) : 1;
			int fianlPageCurrent = request.getParameter("finalPage") != null ? Integer.parseInt(request.getParameter("finalPage")) : 1;
			System.out.println("applyPage >> " + request.getParameter("applyPage"));
			System.out.println("listresPage >> " + request.getParameter("listresPage"));
			System.out.println("myApplyPage >> " + request.getParameter("myApplyPage"));
			System.out.println("finalPage >> " + request.getParameter("finalPage"));
			
			int applystart =0;
			if(applyPageCurrent != 1) {
				applystart = (applyPageCurrent-1)*5;
				System.out.println("applystart == "  + applystart);
			}
			
			int listresStart =0;
			if(listresPageCurrent != 1) {
				listresStart = (listresPageCurrent-1)*5;
				System.out.println("applystart == "  + listresStart);
			}
			
			int myApplyStart =0;
			if(myApplyPageCurrent != 1) {
				myApplyStart = (myApplyPageCurrent-1)*5;
				System.out.println("myApplyStart == "  + myApplyStart);
			}
			
			int finalStart =0;
			if(fianlPageCurrent != 1) {
				finalStart = (fianlPageCurrent-1)*5;
				System.out.println("finalStart == "  + finalStart);
			}
			
			
			ReservationDAO reservation = new ReservationDAO();
			
			// 나와 피간병인의 매칭 정보 페이징
			int listresCnt = reservation.resListCnt(user_id);
			int listresPages = 0;
			if(listresCnt%5 == 0) {
				listresPages = listresCnt/5;
			} else {
				listresPages = (listresCnt/5)+1;
			}
			
			// 나와 피간병인의 매칭 정보
			List<ReservationVO> listres = reservation.resList(user_id, listresStart);
			List<ReservationVO> finalList = reservation.finalList(user_id, finalStart);
			
			// 내가 지원한 신청 리스트
			List<ReservationVO> list = new ArrayList<ReservationVO>();
			BookDAO book = new BookDAO();
			list = book.myApply(user_id, myApplyStart);
			
			// 내가 지원한 신청 리스트 페이징
			int myApplyCnt = reservation.resListCnt(user_id);
			int myApplyPages = 0;
			if(myApplyCnt%5 == 0) {
				myApplyPages = myApplyCnt/5;
			} else {
				myApplyPages = (myApplyCnt/5)+1;
			}
			
			PatientresDAO patientres = new PatientresDAO();
			List<PatientresVO> applyList = patientres.applylist(applystart);
			
			List<String> code = book.code(user_id);
			
			// 내게 들어온 피간병인리스트 페이징
			int applyCount = patientres.applyCount();
			int applyPages = 0;
			if(applyCount%5 == 0) {
				applyPages = applyCount/5;
			} else {
				applyPages = (applyCount/5)+1;
			}
			
			int finalListCnt = reservation.finalListCnt(user_id);
			int finalPages = 0;
			if(finalListCnt%5 == 0) {
				finalPages = finalListCnt/5;
			} else {
				finalPages = (finalListCnt/5)+1;
			}
			
			mReviewDAO review = new mReviewDAO();
			List<String>reviewCode = review.reviewCode(user_id);
			
			match.MatchDAO mdao = new match.MatchDAO();
			
			List<match.MatchVO> matchList = mdao.tInfo(user_id);
			
			
			request.setAttribute("matchList", matchList);
			request.setAttribute("listres", listres);
			request.setAttribute("listresPages", listresPages);
			request.setAttribute("applyPages", applyPages);
			request.setAttribute("myApplyPages", myApplyPages);
			request.setAttribute("myApply", list);
			request.setAttribute("finalList", finalList);
			request.setAttribute("finalPages", finalPages);
			request.setAttribute("applyList", applyList);
			request.setAttribute("MyResCode", code);
			request.setAttribute("reviewCode", reviewCode);
			RequestDispatcher dispatch = request.getRequestDispatcher("../careGiver/gMain.jsp");
			dispatch.forward(request, response);
		}
	}
}
