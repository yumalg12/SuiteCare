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

import caretaker.TakerVO;
import reservation.PatientinfoVO;


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
	
	public List<PatientresVO> listres(String patient_id) {
		List<PatientresVO> list= new ArrayList<PatientresVO>();
		String caregiver = null;
		
		try {
			connect();
			
			String sql = "SELECT * FROM reservation as res, reservation_info as resinfo, CARETAKER as c WHERE res.id = ? and res.patient_code = c.patient_code and res.res_code=resinfo.res_code";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, patient_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String patient_name = rs.getString("patient");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Time start_time = rs.getTime("start_time");
				Time end_time = rs.getTime("end_time");
				caregiver = rs.getString("caregiver_id");
				
				if(caregiver==null) {
					PatientresVO vo = new PatientresVO();
					vo.setPatient(patient_name);
					vo.setStartdate(start_date);
					vo.setEnddate(end_date);
					vo.setStarttime(start_time);
					vo.setEndtime(end_time);
					vo.setCaregiver(caregiver);
					
					list.add(vo);
				} else if(caregiver!=null) {
					String cgsql = "SELECT name FROM caregiver where id = ?";
					stmnt = conn.prepareStatement(cgsql);
					stmnt.setString(1, caregiver);
					
					caregiver = rs.getString("name");
					
					PatientresVO vo = new PatientresVO();
					vo.setPatient(patient_name);
					vo.setStartdate(start_date);
					vo.setEnddate(end_date);
					vo.setStarttime(start_time);
					vo.setEndtime(end_time);
					vo.setCaregiver(caregiver);
					
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


	public List<TakerVO> listtinfo(String mid) {
		List<TakerVO> list= new ArrayList<TakerVO>();
		
		try {
			connect();
			
			String sql = "SELECT * FROM CARETAKER WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String tname = rs.getString("tname");
				String tgender = rs.getString("tgender");
				String tage = rs.getString("tage");
				String theight = rs.getString("theight");
				String tweight = rs.getString("tweight");
			//	String addr = rs.getString("addr");
				String diagnosis = rs.getString("diagnosis");
				
				TakerVO vo = new TakerVO();
				
				vo.setTname(tname);
				vo.setTgender(tgender);
				vo.setTage(tage);
				vo.setTheight(theight);
				vo.setTweight(tweight);
			//	vo.setAddr(addr);
				vo.setDiagnosis(diagnosis);
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
