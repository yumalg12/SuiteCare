package patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import reservation.CaretakerinfoVO;


public class PatientresDAO {
	private PreparedStatement pstmt;
	private PreparedStatement stmnt;
	private ResultSet rs = null;
	private Connection conn;
	

	public void connect() throws Exception {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			
			
			DataSource dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		//	dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
			
			conn=dataFactory.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<PatientresVO> listres(String m_id) {
		List<PatientresVO> list= new ArrayList<PatientresVO>();
		String caregiver = null;
		
		try {
			connect();
			
			String sql = "SELECT * FROM reservation as res, reservation_info as resinfo, CARETAKER as c WHERE res.m_id = ? and res.caretaker_code = c.t_code and res.res_code=resinfo.res_code";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String caretaker = rs.getString("t_name");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Time start_time = rs.getTime("start_time");
				Time end_time = rs.getTime("end_time");
				String res_code = rs.getString("res_code");
				caregiver = rs.getString("caregiver_id");
				String t_code = rs.getString("caretaker_code");
				
				if(caregiver==null) {
					PatientresVO vo = new PatientresVO();
					vo.setCaretaker(caretaker);
					vo.setStartdate(start_date);
					vo.setEnddate(end_date);
					vo.setStarttime(start_time);
					vo.setEndtime(end_time);
					vo.setCaregiver(caregiver);
					vo.setRes_code(res_code);
					vo.setCaretaker_code(t_code);
					
					list.add(vo);
				} else if(caregiver!=null) {
					String cgsql = "SELECT g_name FROM caregiver where g_id = ?";
					stmnt = conn.prepareStatement(cgsql);
					stmnt.setString(1, caregiver);
					
					caregiver = rs.getString("g_name");
					
					PatientresVO vo = new PatientresVO();
					vo.setCaretaker(caretaker);
					vo.setStartdate(start_date);
					vo.setEnddate(end_date);
					vo.setStarttime(start_time);
					vo.setEndtime(end_time);
					vo.setCaregiver(caregiver);
					vo.setRes_code(res_code);
					vo.setCaretaker_code(t_code);
					
					list.add(vo);
					
					stmnt.close();
				}
				
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<PatientresVO> applylist() {
		List<PatientresVO> list= new ArrayList<PatientresVO>();
		String caregiver = null;
		
		try {
			connect();
			
			String sql = "SELECT * FROM reservation as res, reservation_info as resinfo, CARETAKER as c WHERE res.caretaker_code = c.t_code and res.res_code=resinfo.res_code";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String caretaker = rs.getString("t_name");
				String t_gender = rs.getString("t_gender");
				String t_age = rs.getString("t_age");
			//	String location = rs.getString("t_location");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Time start_time = rs.getTime("start_time");
				Time end_time = rs.getTime("end_time");
				String res_code = rs.getString("res_code");
				caregiver = rs.getString("caregiver_id");
				String t_code = rs.getString("caretaker_code");
				
				if(caregiver==null) {
					PatientresVO vo = new PatientresVO();
					vo.setCaretaker(caretaker);
					vo.setT_gender(t_gender);
					vo.setT_age(t_age);
					vo.setCaretaker(caretaker);
					vo.setStartdate(start_date);
					vo.setEnddate(end_date);
					vo.setStarttime(start_time);
					vo.setEndtime(end_time);
					vo.setCaregiver(caregiver);
					vo.setRes_code(res_code);
					vo.setCaretaker_code(t_code);
					
					list.add(vo);
				} else if(caregiver!=null) {
					String cgsql = "SELECT g_name FROM caregiver where g_id = ?";
					stmnt = conn.prepareStatement(cgsql);
					stmnt.setString(1, caregiver);
					
					caregiver = rs.getString("g_name");
					
					PatientresVO vo = new PatientresVO();
					vo.setCaretaker(caretaker);
					vo.setStartdate(start_date);
					vo.setEnddate(end_date);
					vo.setStarttime(start_time);
					vo.setEndtime(end_time);
					vo.setCaregiver(caregiver);
					vo.setRes_code(res_code);
					vo.setCaretaker_code(t_code);
					
					list.add(vo);
					
					stmnt.close();
				}
				
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
