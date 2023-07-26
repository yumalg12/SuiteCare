package reservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReservationDAO {
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
	
	public int pinfocheck(String patient_id) {
		System.out.println("피간병인 정보 확인");
		int ok = 0;
		try {
		connect();
		String sql = "SELECT count(*) FROM CARETAKER WHERE id = ?"; //피간병인 아이디에 등록된 피간병인 정보 갯수 확인
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, patient_id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			ok = 1;
			System.out.println("피간병인 정보 o"); // 정보가 있는 경우, 해당 정보 출력
		} else {
			ok = 0;
			System.out.println("피간병인 정보 x, 등록필요"); // 정보가 없는 경우 등록필요
		}
		if (rs != null) { //rs 객체 종료
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) { //pstmt 객체 종료
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (conn != null) { // conn 객체 종료
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ok;
	}
	
	public List<PatientinfoVO> listpname(String patient_id) {
		List<PatientinfoVO> list= new ArrayList<PatientinfoVO>();
		
		try {
			connect();
				
			String sql = "SELECT patient FROM CARETAKER WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, patient_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String patient_name = rs.getString("patient");
				
				PatientinfoVO vo = new PatientinfoVO();
				vo.setPatient(patient_name);
				
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
	
	public List<PatientinfoVO> listPinfo(String patient_id, String patient) {
		List<PatientinfoVO> list= new ArrayList<PatientinfoVO>();
		try {
			connect();
				
			String sql = "SELECT * FROM CARETAKER WHERE id = ? and patient = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, patient_id);
			pstmt.setString(2, patient);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String patient_name = rs.getString("patient");
				String patient_code = rs.getString("patient_code");
				int age = rs.getInt("age");
				int height = rs.getInt("height");
				int weight = rs.getInt("weight");
				String gender = rs.getString("gender");
				String addr = rs.getString("addr");
				String detail_addr = rs.getString("detail_addr");
				String diagnosis = rs.getString("diagnosis");
				String consciousness = rs.getString("consciousness");
				String care_meal_yn = rs.getString("care_meal_yn");
				String care_toilet = rs.getString("care_toilet");
				String state_paralysis = rs.getString("state_paralysis");
				String state_mobility = rs.getString("state_mobility");
				String bedsore_yn = rs.getString("bedsore_yn");
				String suction_yn = rs.getString("suction_yn");
				String outpatient_yn = rs.getString("outpatient_yn");
				String care_night_yn = rs.getString("care_night_yn");
				String notice = rs.getString("notice");
				
				PatientinfoVO vo = new PatientinfoVO();
				vo.setPatient(patient_name);
				vo.setPatient_code(patient_code);
				vo.setAge(age);
				vo.setHeight(height);
				vo.setWeight(weight);
				vo.setGender(gender);
				vo.setAddr(addr);
				vo.setDetail_addr(detail_addr);
				vo.setDiagnosis(diagnosis);
				vo.setConsciousness(consciousness);
				vo.setCare_meal_yn(care_meal_yn);
				vo.setCare_toilet(care_toilet);
				vo.setState_paralysis(state_paralysis);
				vo.setState_mobility(state_mobility);
				vo.setBedsore_yn(bedsore_yn);
				vo.setSuction_yn(suction_yn);
				vo.setOutpatient_yn(outpatient_yn);
				vo.setCare_night_yn(care_night_yn);
				vo.setNotice(notice);
				
				
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
	
	public String insert(String patient_id, String patient_code) {
		
		String rescode = null;
		try {
			connect();
			
			
			String sql = 
			"INSERT INTO RESERVATION(id, patient_code)"
					+ "VALUES(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, patient_id);
			pstmt.setString(2, patient_code);
			
			pstmt.executeUpdate();
			
			String selectSql = "SELECT res_code FROM RESERVATION WHERE patient_code=? ORDER BY res_code DESC LIMIT 1";
			//피간병인 코드별 예약번호를 내림차순으로 정렬하여 가장 최근에 만들어진 예약코드 select
			
			stmnt = conn.prepareStatement(selectSql);
			stmnt.setString(1, patient_code);
			
			rs = stmnt.executeQuery();
			
			if(rs.next()) {
				rescode = rs.getString("res_code");
				System.out.println(rescode);
			}
			rs.close();
			stmnt.close();
			pstmt.close();}
		 catch(Exception e) {
			e.printStackTrace();
			}

		return rescode;
	}
	
	public int updatehome(String home, String patient_code) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE CARETAKER SET location=? where patient_code=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, home);
			pstmt.setString(2, patient_code);
			
			
			result=pstmt.executeUpdate();
			
			System.out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(pstmt!=null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result;
	}
	
	public int updateaddr(PatientinfoVO vo) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE CARETAKER SET addr=?, detail_addr=? where patient_code=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, vo.getAddr());
			pstmt.setString(2, vo.getDetail_addr());
			pstmt.setString(3, vo.getPatient_code());
			
			result=pstmt.executeUpdate();
			
			System.out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(pstmt!=null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result;
	}
	
	public int checkres(ReservationInfoVO vo) {
		int check_ok = 0;
	
		try {
			connect();
			
			String sql = "select * from reservation_info where start_date <= ? AND end_date >= ? and start_time<? and end_time>? and patient_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEnd_date());
			pstmt.setString(2, vo.getStart_date());
			pstmt.setString(3, vo.getEnd_time());
			pstmt.setString(4, vo.getStart_time());
			pstmt.setString(5, vo.getPatient_code());
			
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()){
				check_ok=0;
				System.out.println("시간중복" + check_ok);
			} else {
				check_ok=1;
				System.out.println("예약가능" + check_ok);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check_ok;
	}

	public int insertresinfo(ReservationInfoVO vo) {
		
		int result = 0;
		try {
			connect();
			
			String sql = 
					"INSERT INTO reservation_info(res_code, start_date, end_date, start_time, end_time, patient_code)"
							+ "VALUES(?,?,?,?,?,?)";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, vo.getRes_code());
					pstmt.setString(2, vo.getStart_date());
					pstmt.setString(3, vo.getEnd_date());
					pstmt.setString(4, vo.getStart_time());
					pstmt.setString(5, vo.getEnd_time());
					pstmt.setString(6, vo.getPatient_code());
					
					result = pstmt.executeUpdate();
					
					System.out.println("예약완료" + result);
					
					
					pstmt.close();}
				 catch(Exception e) {
					e.printStackTrace();
					}
		return result;
			}
	
	
	public int updatehospaddr(PatientinfoVO vo) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE CARETAKER SET location=?, addr=?, detail_addr=? where patient_code=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getLocation());
			pstmt.setString(2, vo.getAddr());
			pstmt.setString(3, vo.getDetail_addr());
			pstmt.setString(4, vo.getPatient_code());
			
			result=pstmt.executeUpdate();
			
			System.out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(pstmt!=null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result;
	}
	
}
