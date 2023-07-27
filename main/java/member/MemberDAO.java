package member;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	public MemberVO userLogin(String id, String pw) {
		MemberVO vo = null;
		
		try {
			conn = dataFactory.getConnection();
				
			String sql = "SELECT * FROM patient WHERE id = ? and pw = ?";
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
		conn = dataFactory.getConnection();
			
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
			conn = dataFactory.getConnection();
			
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


	public void addMember(MemberVO vo) {
		
		try {
			conn = dataFactory.getConnection();
			
			String id = vo.getId();
			String pw = vo.getPw();
			String name = vo.getName();
			String gender = vo.getGender();
			String phone = vo.getPhone();
			String email = vo.getEmail();
			String address = vo.getAddress();
			String sms_yn = vo.getSms_yn();
			String email_yn = vo.getEmail_yn();
			
			String sql = "insert into `suitecare`.`member`(id, pw, name, gender, phone, email, address, sms_yn, email_yn) "+
					"values(?,?,?,?,?,?,?,?,?)";
			
			System.out.println("addMember(): "+sql);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, phone);
			pstmt.setString(6, email);
			pstmt.setString(7, address);
			pstmt.setString(8, sms_yn);
			pstmt.setString(9, email_yn);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isDuplicateID(String id) {
		System.out.println("Received id: " + id);

		try {
			conn = dataFactory.getConnection();

			String sql = "select COUNT(*) from `suitecare`.`member` where id='" + id + "'";
			System.out.println("isDuplicate(): " + sql);

			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int count = rs.getInt(1);
				if (count > 0) {
					pstmt.close();
					conn.close();
					return true;
				};
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}


