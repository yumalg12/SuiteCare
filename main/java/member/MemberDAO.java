package member;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import caretaker.TakerVO;

public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection conn;
	private DataSource dataFactory;

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public MemberVO userLogin(String m_id, String m_pw) {
		MemberVO vo = null;
		
		try {
			conn = dataFactory.getConnection();
				
			String sql = "SELECT * FROM member WHERE m_id = ? and m_pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO();
				
				vo.setM_id(rs.getString("m_id"));
				vo.setM_pw(rs.getString("m_pw"));
				
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
			
			} catch(Exception e) {
				e.printStackTrace();
			}
		return vo;
	}
	
	
	public int logincheck(String m_id, String m_pw) {
		System.out.println("login 정보 확인");
		int ok = 0;
		try {
		conn = dataFactory.getConnection();
			
		String sql = "SELECT m_pw FROM member WHERE m_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("m_pw").equals(m_pw)) {
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
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ok;
	}
	
	public List<MemberVO> listMembers(String id) {
		//아직 수정하지 않음
		List<MemberVO> list= new ArrayList<MemberVO>();
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT * FROM member where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String m_id = rs.getString("m_id");
				String m_pw = rs.getString("m_pw");
				String m_name = rs.getString("m_name");
				String m_gender = rs.getString("m_gender");
				String m_phone = rs.getString("m_phone");
				String m_email = rs.getString("m_email");
				String m_address = rs.getString("m_address");	
				String m_sms_yn = rs.getString("m_sms_yn");
				String m_email_yn = rs.getString("m_email_yn");
				
				MemberVO vo = new MemberVO();
				vo.setM_id(m_id);
				vo.setM_pw(m_pw);
				vo.setM_name(m_name);
				vo.setM_gender(m_gender);
				vo.setM_email(m_email);			
				vo.setM_address(m_address);
				vo.setM_phone(m_phone);
				vo.setM_email_yn(m_email_yn);
				vo.setM_sms_yn(m_sms_yn);
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

	
	   public void update(MemberVO vo) {
		      try {
		         
		         conn = dataFactory.getConnection();
		         
		         String sql = "UPDATE member SET m_phone=?, m_email=?, m_address=?, m_sms_yn=?, m_email_yn=? where m_id=?"; 
		         pstmt = conn.prepareStatement(sql);

		         pstmt.setString(1, vo.getM_phone());
		         pstmt.setString(2, vo.getM_email());
		         pstmt.setString(3, vo.getM_address());
		         pstmt.setString(4, vo.getM_sms_yn());
		         pstmt.setString(5, vo.getM_email_yn());
		         pstmt.setString(6, vo.getM_id());
		         
		         
		         pstmt.executeUpdate();
		         System.out.println("정보 등록 완료");
		         
		         
		         pstmt.close();}
		      
		       catch(Exception e) {
		         e.printStackTrace();
		         }

		         
		   }
	   
	   public void updatePw(MemberVO vo) {
		      try {
		         
		         conn = dataFactory.getConnection();
		         
		         String sql = "UPDATE member SET m_pw=? where m_id=?"; 
		         pstmt = conn.prepareStatement(sql);

		         pstmt.setString(1, vo.getM_pw());
		         pstmt.setString(2, vo.getM_id());
		         
		         
		         pstmt.executeUpdate();
		         System.out.println("비밀번호 변경 완료");
		         
		         
		         pstmt.close();}
		      
		       catch(Exception e) {
		         e.printStackTrace();
		         }

		         
		   }
	   
	   
	public boolean addMember(MemberVO vo) {
		
		try {
			conn = dataFactory.getConnection();
			
			String m_id = vo.getM_id();
			String m_pw = vo.getM_pw();
			String m_name = vo.getM_name();
			String m_gender = vo.getM_gender();
			String m_phone = vo.getM_phone();
			String m_email = vo.getM_email();
			String m_address = vo.getM_address();
			String m_sms_yn = vo.getM_sms_yn();
			String m_email_yn = vo.getM_email_yn();

			String sql = "insert into `campusDB`.`member`(m_id, m_pw, m_name, m_gender, m_phone, m_email, m_address, m_sms_yn, m_email_yn) "+
					"values(?,?,?,?,?,?,?,?,?)";
			
			System.out.println("addMember(): "+sql);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			pstmt.setString(3, m_name);
			pstmt.setString(4, m_gender);
			pstmt.setString(5, m_phone);
			pstmt.setString(6, m_email);
			pstmt.setString(7, m_address);
			pstmt.setString(8, m_sms_yn);
			pstmt.setString(9, m_email_yn);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int isDuplicateID(String id) {
		System.out.println("Received id: " + id);

		try {
			conn = dataFactory.getConnection();

			String sql = "select COUNT(*) from `campusdb`.`member` where m_id='" + id + "'";
			System.out.println("isDuplicate(): " + sql);

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<MemberVO> listMembers() {
		List<MemberVO> list= new ArrayList<MemberVO>();
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String m_id = rs.getString("m_id");
				String m_pw = rs.getString("m_pw");
				String m_name = rs.getString("m_name");
				String m_gender = rs.getString("m_gender");
				String m_phone = rs.getString("m_phone");
				String m_email = rs.getString("m_email");
				String m_address = rs.getString("m_address");	
				String m_sms_yn = rs.getString("m_sms_yn");
				String m_email_yn = rs.getString("m_email_yn");
				Date m_signup_date = rs.getDate("m_signup_date");
				
				MemberVO vo = new MemberVO();
				vo.setM_id(m_id);
				vo.setM_pw(m_pw);
				vo.setM_name(m_name);
				vo.setM_gender(m_gender);
				vo.setM_email(m_email);			
				vo.setM_address(m_address);
				vo.setM_phone(m_phone);
				vo.setM_email_yn(m_email_yn);
				vo.setM_sms_yn(m_sms_yn);
				vo.setM_signup_date(m_signup_date);
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


