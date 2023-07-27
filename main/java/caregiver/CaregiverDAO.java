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
					sql = "update caregiver";
					sql += " set g_pw=? where g_id = ?";
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
}


