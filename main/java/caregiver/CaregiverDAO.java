package caregiver;

import java.sql.*;
import java.sql.Date;

import java.util.*;

<<<<<<< HEAD
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CaregiverDAO {
	private PreparedStatement pstmt;
	private Statement stmnt;
	private Connection conn;
	private DataSource dataFactory;
	
	public void connect() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
=======
import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;

public class CaregiverDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	private ResultSet rs;
	
	public CaregiverDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
	public CaregiverVO userLogin(String id, String pw) {
		CaregiverVO vo = null;
		
		try {
<<<<<<< HEAD
			connect();
				
			String sql = "SELECT * FROM caregiver WHERE id = ? and pw = ?";
			pstmt = conn.prepareStatement(sql);
=======
			con = dataFactory.getConnection();
				
			String sql = "SELECT * FROM caregiver WHERE g_id = ? and g_pw = ?";
			pstmt = con.prepareStatement(sql);
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new CaregiverVO();
				
<<<<<<< HEAD
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
=======
				vo.setG_id(rs.getString("g_id"));
				vo.setG_pw(rs.getString("g_pw"));
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
				
			}
			 if (rs != null) {
		            try {
		                rs.close();
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		        if (pstmt != null) {
		            try {
		                pstmt.close();
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
<<<<<<< HEAD
		        if (conn != null) {
		            try {
		                conn.close();
=======
		        if (con != null) {
		            try {
		                con.close();
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
			
			} catch(Exception e) {
				e.printStackTrace();
			}
		return vo;
	}
	
	
	public int logincheck(String id, String pw) {
		System.out.println("login 정보 확인");
		int ok = 0;
		try {
<<<<<<< HEAD
		connect();
		String sql = "SELECT pw FROM caregiver WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("pw").equals(pw)) {
				System.out.println("login success");
				ok=1;
			} else {
				System.out.println("비번 불일치");
				ok=2;
			}
		} else {
			System.out.println("아이디 불일치");
			ok=3;
		} 
		
		if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
=======
			con = dataFactory.getConnection();
			String sql = "SELECT g_pw FROM caregiver WHERE g_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(rs.getString("g_pw").equals(pw)) {
					System.out.println("login success");
					ok=1;
				} else {
					System.out.println("비번 불일치");
					ok=2;
				}
			} else {
				System.out.println("아이디 불일치");
				ok=3;
			} 
			
			if (rs != null) {
	            try {
	                rs.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if (con != null) {
	            try {
	                con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ok;
	}
	
<<<<<<< HEAD
	public List<CaregiverVO> listMembers(String user_id) {
		List<CaregiverVO> list= new ArrayList<CaregiverVO>();
		try {
			connect();
			
			String sql = "SELECT * FROM caregiver where id=?";
			pstmt = conn.prepareStatement(sql);
=======
	public List<CaregiverVO> giver_info(String user_id) {
		List<CaregiverVO> list= new ArrayList<CaregiverVO>();
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM caregiver where g_id=?";
			pstmt = con.prepareStatement(sql);
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
			pstmt.setString(1, user_id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
<<<<<<< HEAD
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				String birth = rs.getString("birth");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String sms_yn = rs.getString("sms_yn");
				String email_yn = rs.getString("email_yn");
				String profile = rs.getString("profile");;
				String representative = rs.getString("representative");;
				String qualification = rs.getString("qualification");;
				String location = rs.getString("location");;
				Date signup_date = rs.getDate("signup_date");
				
				CaregiverVO vo = new CaregiverVO();
				vo.setId(id);
				vo.setPw(pw);
				vo.setName(name);
				vo.setGender(gender);
				vo.setBirth(birth);
				vo.setPhone(phone);
				vo.setEmail(email);
				vo.setAddress(address);
				vo.setSms_yn(sms_yn);
				vo.setEmail_yn(email_yn);
				vo.setProfile(profile);
				vo.setRepresentative(representative);
				vo.setQualification(qualification);
				vo.setLocation(location);
				vo.setSignup_date(signup_date);
=======
				String id = rs.getString("g_id");
				String pw = rs.getString("g_pw");
				String name = rs.getString("g_name");
				String gender = rs.getString("g_gender");
				String birth = rs.getString("g_birth");
				String phone = rs.getString("g_phone");
				String email = rs.getString("g_email");
				String address = rs.getString("g_address");
				String sms_yn = rs.getString("g_sms_yn");
				String email_yn = rs.getString("g_email_yn");
				String profile = rs.getString("g_profile");;
				String representative = rs.getString("g_representative");;
				String qualification = rs.getString("g_qualification");;
				String location = rs.getString("g_location");;
				Date signup_date = rs.getDate("g_signup_date");
				
				CaregiverVO vo = new CaregiverVO();
				vo.setG_id(id);
				vo.setG_pw(pw);
				vo.setG_name(name);
				vo.setG_gender(gender);
				vo.setG_birth(birth);
				vo.setG_phone(phone);
				vo.setG_email(email);
				vo.setG_address(address);
				vo.setG_sms_yn(sms_yn);
				vo.setG_email_yn(email_yn);
				vo.setG_profile(profile);
				vo.setG_representative(representative);
				vo.setG_qualification(qualification);
				vo.setG_location(location);
				vo.setG_signup_date(signup_date);
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
				list.add(vo);
			}
			rs.close();
			pstmt.close();
<<<<<<< HEAD
			conn.close();
=======
			con.close();
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
<<<<<<< HEAD
=======
	
	
	public boolean pwupdate(String id, String originPW, String newPW) {
		try {
			con = dataFactory.getConnection();

			String sql = "SELECT g_pw FROM caregiver WHERE g_id = '" + id + "'";
			System.out.println("prepareStatement : " + sql);
			pstmt = con.prepareStatement(sql);
			// 4) 실행
			rs = pstmt.executeQuery();
			// 5) 결과를 테이블에 출력
			if (rs.next()) {
				String pw = rs.getString("g_pw");
				if(pw.equals(originPW)) {
					sql = "UPDATE caregiver";
					sql += " SET g_pw=? WHERE g_id = ?";
					System.out.println("prepareStatement : " + sql);
		
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, newPW);
					pstmt.setString(2, id);
		
					pstmt.executeUpdate();
					pstmt.close();
					
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	public void update(String id, String name, String gender, String phone, String sms_yn, String email, String email_yn, String address, String location, String representative, String qualification) {
		try {
			con = dataFactory.getConnection();

			String sql = "UPDATE caregiver";
			sql += " SET g_name=?, g_gender=?, g_phone=?, g_sms_yn=?, g_email=?, g_email_yn=?, g_address=?, g_location=?, g_representative=?, g_qualification=?";
			sql += " WHERE g_id = ?";
			System.out.println("prepareStatement : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, phone);
			pstmt.setString(4, sms_yn);
			pstmt.setString(5, email);
			pstmt.setString(6, email_yn);
			pstmt.setString(7, address);
			pstmt.setString(8, location);
			pstmt.setString(9, representative);
			pstmt.setString(10, qualification);
			pstmt.setString(11, id);

			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
>>>>>>> 65c6c60319db5c0d6ca4a12765261e941b53b4e4
}


