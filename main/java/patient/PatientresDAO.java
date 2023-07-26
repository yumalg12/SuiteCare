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


	public List<PatientinfoVO> listpinfo(String patient_id) {
		List<PatientinfoVO> list= new ArrayList<PatientinfoVO>();
		
		try {
			connect();
			
			String sql = "SELECT * FROM CARETAKER WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, patient_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String patient_name = rs.getString("patient");
				String gender = rs.getString("gender");
				int age = rs.getInt("age");
				int height = rs.getInt("height");
				int weight = rs.getInt("weight");
				String addr = rs.getString("addr");
				String diagnosis = rs.getString("diagnosis");
				
				PatientinfoVO vo = new PatientinfoVO();
				
				vo.setPatient(patient_name);
				vo.setGender(gender);
				vo.setAge(age);
				vo.setHeight(height);
				vo.setWeight(weight);
				vo.setAddr(addr);
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
