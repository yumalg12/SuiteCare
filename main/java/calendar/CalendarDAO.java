package calendar;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CalendarDAO {
	private PreparedStatement pstmt;
	   private Connection conn;
	   private ResultSet rs = null;
	   private DataSource dataFactory;

	   public CalendarDAO() {
	      try {
	         Context ctx = new InitialContext();
	         Context envContext = (Context) ctx.lookup("java:/comp/env");
	         dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	   
	   public List<CalendarVO> listSchedule(String m_id) {
			List<CalendarVO> list= new ArrayList<CalendarVO>();
			
			try {
				conn = dataFactory.getConnection();
					
				String sql = "SELECT * FROM caretaker as c, reservation as r, reservation_info as ri WHERE c.m_id = ? and c.t_code=r.caretaker_code and r.res_code = ri.res_code";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String res_code = rs.getString("res_code");
					String caretaker_code = rs.getString("caretaker_code");
					Date start_date = rs.getDate("start_date");
					Date end_date = rs.getDate("end_date");
					Time start_time = rs.getTime("start_time");
					Time end_time = rs.getTime("end_time");
					String t_name = rs.getString("t_name");
					
					CalendarVO vo = new CalendarVO(); 
					vo.setRes_code(res_code);
					vo.setCaretaker_code(caretaker_code);
					vo.setStart_date(start_date);
					vo.setEnd_date(end_date);
					vo.setStart_time(start_time);
					vo.setEnd_time(end_time);
					vo.setT_name(t_name);
					
					list.add(vo);
				}
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	   
	   public List<CalendarVO> listgSchedule(String g_id) {
			List<CalendarVO> list= new ArrayList<CalendarVO>();
			
			try {
				conn = dataFactory.getConnection();
					
				String sql = "SELECT * FROM caretaker as c, reservation as r, reservation_info as ri WHERE r.caregiver_id = ? and c.t_code=r.caretaker_code and r.res_code = ri.res_code";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, g_id);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String res_code = rs.getString("res_code");
					String caretaker_code = rs.getString("caretaker_code");
					Date start_date = rs.getDate("start_date");
					Date end_date = rs.getDate("end_date");
					Time start_time = rs.getTime("start_time");
					Time end_time = rs.getTime("end_time");
					String t_name = rs.getString("t_name");
					
					CalendarVO vo = new CalendarVO(); 
					vo.setRes_code(res_code);
					vo.setCaretaker_code(caretaker_code);
					vo.setStart_date(start_date);
					vo.setEnd_date(end_date);
					vo.setStart_time(start_time);
					vo.setEnd_time(end_time);
					vo.setT_name(t_name);
					
					list.add(vo);
				}
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
}
