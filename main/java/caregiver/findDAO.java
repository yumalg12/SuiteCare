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

	public void connect() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		
	
	// 환자
	public String pFindId(String name, String phone) {
		String find_id = null;
		
		try {
			connect();
				
			String sql = "SELECT id FROM patient WHERE name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_id = rs.getString("id");
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
	
	public int pIdcheck(String name, String phone) {
		System.out.println("아이디 정보 확인");
		int ok = 0;
		try {
		connect();
		String sql = "SELECT name FROM patient WHERE phone=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("name").equals(name)) {
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
	
	public String pFindPw(String name, String id, String phone) {
		String find_pw = null;
		
		try {
			connect();
				
			String sql = "SELECT pw FROM patient WHERE name=? and id=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, phone);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_pw = rs.getString("pw");
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
		String sql = "SELECT id FROM patient WHERE phone=? and name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		pstmt.setString(2, name);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("id").equals(id)) {
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
	
	
	// 간병인
	public String cFindId(String name, String phone) {
		String find_id = null;
		
		try {
			connect();
				
			String sql = "SELECT id FROM caregiver WHERE name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_id = rs.getString("id");
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
		String sql = "SELECT name FROM caregiver WHERE phone=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("name").equals(name)) {
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
				
			String sql = "SELECT pw FROM caregiver WHERE name=? and id=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, phone);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_pw = rs.getString("pw");
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
		String sql = "SELECT id FROM caregiver WHERE phone=? and name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		pstmt.setString(2, name);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("id").equals(id)) {
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