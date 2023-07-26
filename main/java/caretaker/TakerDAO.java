package caretaker;

import java.sql.*;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class TakerDAO {

	private PreparedStatement pstmt;
	private Connection conn;
	private DataSource dataFactory;

	public TakerDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insert(TakerVO vo) {
		try {
			conn = dataFactory.getConnection();
			
			
			String sql = 
			"INSERT INTO caretaker(tname, tgender, tage, theight, tweight, diagnosis)"
					+ "VALUES(?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, vo.getTname());
			pstmt.setString(2, vo.getTgender());
			pstmt.setString(3, vo.getTage());
			pstmt.setString(4, vo.getTheight());
			pstmt.setString(5, vo.getTweight());
			pstmt.setString(6, vo.getDiagnosis());
			
			
			pstmt.executeUpdate();
			System.out.println("정보 등록 완료");
			
			
			pstmt.close();}
		
		 catch(Exception e) {
			e.printStackTrace();
			}

			
	}
}
	/*
	public void delTaker(String id) {
		try {
			conn = dataFactory.getConnection();
			String sql = "DELETE FROM semi_member WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	public int pwdCheck(String user_id, String user_pwd) {
		System.out.println("현재비밀번호 확인");
		int pwd = 0;
		try {
			conn = dataFactory.getConnection();
			String sql = "SELECT user_pwd FROM semi_member where user_id=?";
			pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("user_pwd").equals(user_pwd)) {
				System.out.println("pwd 일치");
				pwd=1;
			}  else {
			System.out.println("정보 불일치");
			pwd=2;
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
		
		} } catch(Exception e) {
			e.printStackTrace();
		}
		return pwd;
	}
	
	
	public int updateMember(MemberVO vo) {
		int result = 0;
		try {
			conn = dataFactory.getConnection();
			String sql = "UPDATE semi_member SET user_name=?, gender=?, birthYear=?, birthMonth=?, birthDay=?, calendar=?, hp1=?, hp2=?, hp3=?, smsyn=?, mail_ID=?, mail_Domain=?, emailyn=?,zipcode=?,roadAddr=?,jibunAddr=?, namujiAddr=? where user_id=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, vo.getUser_name());
			pstmt.setString(2, vo.getGender());
			pstmt.setString(3, vo.getBirthYear());
			pstmt.setString(4, vo.getBirthMonth());
			pstmt.setString(5, vo.getBirthDay());
			pstmt.setString(6, vo.getCalendar());
			pstmt.setString(7, vo.getHp1());
			pstmt.setString(8, vo.getHp2());
			pstmt.setString(9, vo.getHp3());
			pstmt.setString(10, vo.getSmsyn());
			pstmt.setString(11, vo.getMail_ID());
			pstmt.setString(12, vo.getMail_Domain());
			pstmt.setString(13, vo.getEmailyn());
			pstmt.setString(14, vo.getZipcode());
			pstmt.setString(15, vo.getRoadAddr());
			pstmt.setString(16, vo.getJibunAddr());
			pstmt.setString(17, vo.getNamujiAddr());
			pstmt.setString(18, vo.getUser_id());
			
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
	
	public int checkID(String id) {
		conn = dataFactory.getConnection();
		String sql = "select * from semi_member where user_id = ?";
		int idcheck=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idcheck = 0;
			} else {
				idcheck = 1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} return idcheck;
	}
}
*/