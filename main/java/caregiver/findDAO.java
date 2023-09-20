package caregiver;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Date;
import java.util.*;

public class findDAO {
	private PreparedStatement pstmt;
	private Statement stmnt;
	private Connection conn;
	private DataSource dataFactory;

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
		
		
	
	// 환자
	public String pFindId(String name, String phone) {
		String find_id = null;
		
		try {
			connect();
				
			String sql = "SELECT m_id FROM member WHERE m_name=? and m_phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone.replace("-", ""));
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_id = rs.getString("m_id");
				System.out.println(find_id);
				
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
		return find_id;
	}
	
	//pIdcheck는 핸드폰 번호가 중복될 경우 오류가 생기기 때문에 제거
	
	public String pFindPw(String name, String id, String phone) {
		String find_pw = null;
		
		try {
			connect();
				
			String sql = "SELECT * FROM member WHERE m_name=? and m_id=? and m_phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, phone.replace("-", ""));
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_pw = rs.getString("m_pw");
				System.out.println(find_pw);
				
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
		return find_pw;
	}
	
	public int pPwcheck(String name, String id, String phone) {
		System.out.println("비밀번호 정보 확인");
		int ok_pwd = 0;
		try {
		connect();
		String sql = "SELECT m_id FROM member WHERE m_phone=? and m_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone.replace("-", ""));
		pstmt.setString(2, name);
		//System.out.println("SELECT m_id FROM member WHERE m_phone='"+phone.replace("-", "")+"' and m_name='"+name+"'");
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("m_id").equals(id)) {
				System.out.println("정보 일치");
				ok_pwd=1;
			} else {
				System.out.println("아이디 정보 불일치");
				ok_pwd=2;
			}
		} else {
			System.out.println("정보 불일치");
			ok_pwd=3;
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
		return ok_pwd;
	}
	
	
	// 간병인
	public String cFindId(String name, String phone) {
		String find_id = null;
		
		try {
			connect();
				
			String sql = "SELECT g_id FROM caregiver WHERE g_name=? and g_phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone.replace("-", ""));
			System.out.println("SELECT g_id FROM caregiver WHERE g_name='"+name+"' and g_phone='"+phone.replace("-", "")+"'");
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_id = rs.getString("g_id");
				System.out.println(find_id);
				
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
		return find_id;
	}
	
	public int cIdcheck(String name, String phone) {
		System.out.println("아이디 정보 확인");
		int ok = 0;
		try {
		connect();
		String sql = "SELECT g_name FROM caregiver WHERE g_phone=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone.replace("-", ""));
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("g_name").equals(name)) {
				System.out.println("이름, 휴대전화정보 일치");
				ok=1;
			} else {
				System.out.println("이름정보 불일치");
				ok=2;
			}
		} else {
			System.out.println("휴대전화정보 불일치");
			ok=3;
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
	
	public String gFindPw(String name, String id, String phone) {
		String find_pw = null;
		
		try {
			connect();
				
			String sql = "SELECT g_pw FROM caregiver WHERE g_name=? and g_id=? and g_phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, phone.replace("-", ""));
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_pw = rs.getString("g_pw");
				System.out.println(find_pw);
				
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
		return find_pw;
	}
	
	public int cPwcheck(String name, String id, String phone) {
		System.out.println("비밀번호 정보 확인");
		int ok_pwd = 0;
		try {
		connect();
		String sql = "SELECT g_id FROM caregiver WHERE g_phone=? and g_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone.replace("-", ""));
		pstmt.setString(2, name);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("g_id").equals(id)) {
				System.out.println("정보 일치");
				ok_pwd=1;
			} else {
				System.out.println("아이디 정보 불일치");
				ok_pwd=2;
			}
		} else {
			System.out.println("정보불일치");
			ok_pwd=3;
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
		return ok_pwd;
	}
}