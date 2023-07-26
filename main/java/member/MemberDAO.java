package member;

import java.sql.*;
import java.sql.Date;

import java.util.*;

public class MemberDAO {
	private PreparedStatement pstmt;
	private Statement stmnt;
	private Connection conn;
	
	public void connect() {
		try {
			String url = "jdbc:mysql://localhost:3306/suitecare";
			String id = "root";
			String pwd = "h3219";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id ,pwd);

			System.out.println("MySQL DB 연결 성공");
		} catch(Exception e) {}
	}
		
	
	public MemberVO userLogin(String id, String pw) {
		MemberVO vo = null;
		
		try {
			connect();
				
			String sql = "SELECT * FROM Member WHERE id = ? and pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO();
				
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				
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
	
	
	public int logincheck(String id, String pw) {
		System.out.println("login 정보 확인");
		int ok = 0;
		try {
		connect();
		String sql = "SELECT pw FROM patient WHERE id = ?";
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
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ok;
	}
	
	public List<MemberVO> listMembers(String user_id) {
		List<MemberVO> list= new ArrayList<MemberVO>();
		try {
			connect();
			
			String sql = "SELECT * FROM patient where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String sms_yn = rs.getString("sms_yn");
				String email_yn = rs.getString("email_yn");
				Date signup_date = rs.getDate("signup_date");
				
				
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPw(pw);
				vo.setName(name);
				vo.setGender(gender);
				vo.setEmail(email);
				vo.setAddress(address);
				vo.setPhone(phone);
				vo.setEmail_yn(email_yn);
				vo.setSms_yn(sms_yn);
				vo.setSignup_date(signup_date);
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


