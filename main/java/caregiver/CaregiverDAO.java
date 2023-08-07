package caregiver;

import java.sql.*;
import java.sql.Date;

import java.util.*;

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

			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
	public CaregiverVO userLogin(String id, String pw) {
		CaregiverVO vo = null;
		
		try {
			con = dataFactory.getConnection();
				
			String sql = "SELECT * FROM caregiver WHERE g_id = ? and g_pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new CaregiverVO();
				
				vo.setG_id(rs.getString("g_id"));
				vo.setG_pw(rs.getString("g_pw"));
				
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
			
			} catch(Exception e) {
				e.printStackTrace();
			}
		return vo;
	}
	
	
	public int logincheck(String id, String pw) {
		System.out.println("login 정보 확인");
		int ok = 0;
		try {
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
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ok;
	}
	
	public List<CaregiverVO> giver_info(String user_id) {
		List<CaregiverVO> list= new ArrayList<CaregiverVO>();
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM caregiver where g_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
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
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
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
	
	public void joinMember(CaregiverVO vo) {
		try {
			con = dataFactory.getConnection();

			String g_id = vo.getG_id();
			String g_pw = vo.getG_pw();
			String g_name = vo.getG_name();
			String g_gender = vo.getG_gender();
			String g_birth = vo.getG_birth();
			String g_phone = vo.getG_phone();
			String g_email = vo.getG_email();
			String g_address = vo.getG_address();
			
			String g_sms_yn = vo.getG_sms_yn();
			String g_eamil_yn = vo.getG_email_yn();
			
			String g_profile = vo.getG_profile();
			String g_representative = vo.getG_representative();
			String g_qualification = vo.getG_qualification();
			String g_location = vo.getG_location();
			/* String g_signup_date = vo.getG_signup_date(); */

			String sql = "insert into caregiver ";
			sql += " (g_id, g_pw, g_name, g_gender, g_birth, g_phone, g_email, g_address, g_sms_yn, g_email_yn, g_profile, g_representative, g_qualification, g_location)";

			sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println("prepareStatement : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, g_id);
			pstmt.setString(2, g_pw);
			pstmt.setString(3, g_name);
			pstmt.setString(4, g_gender);
			pstmt.setString(5, g_birth);
			pstmt.setString(6, g_phone);
			pstmt.setString(7, g_email);
			pstmt.setString(8, g_address);
			pstmt.setString(9, g_sms_yn);
			pstmt.setString(10, g_eamil_yn);
			pstmt.setString(11, g_profile);
			pstmt.setString(12, g_representative);
			pstmt.setString(13, g_qualification);
			pstmt.setString(14, g_location);
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int isDuplicateID(String id) {
		System.out.println("Received id: " + id);

		try {
			con = dataFactory.getConnection();

			String sql = "select COUNT(*) from `suitecare`.`caregiver` where g_id='" + id + "'";
			System.out.println("isDuplicate(): " + sql);

			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}


