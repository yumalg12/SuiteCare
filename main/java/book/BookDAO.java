package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import reservation.ReservationVO;



public class BookDAO {
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
	
	public int checkbook(String res_code, String g_id) {
		int checkb = 0;
		try {
			connect();
			
			String sql = "SELECT * FROM book WHERE res_code=? and g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_code);
			pstmt.setString(2, g_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
			System.out.println("신청된 아이디 있음");
			checkb = 1;
			} else {
				checkb = 0;
				System.out.println("신청된 아이디 없음");
			}
			rs.close();
			pstmt.close();}
			catch(Exception e) {
			e.printStackTrace();
			}
		return checkb;
	}
	
	public void insertbook(BookVO vo) {
		try {
			connect();
			
			
			String sql = 
			"INSERT INTO book(res_code, g_id, b_status, hourwage)"
					+ "VALUES(?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getRes_code());
			pstmt.setString(2, vo.getG_id());
			pstmt.setString(3, vo.getB_status());
			pstmt.setString(4, vo.getHourwage());
			
			pstmt.executeUpdate();
			
			pstmt.close();}
		 catch(Exception e) {
			e.printStackTrace();
			}
	}
	
	
	public List<BookVO> listTapply(String res_code) {
		List<BookVO> list = new ArrayList<BookVO>();

		try {
			connect();

			String sql = "SELECT * FROM book as b, caregiver as cg WHERE b.res_code=? and b.g_id = cg.g_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String b_id = rs.getString("b_id");
				String rescode = rs.getString("res_code");
				String g_id = rs.getString("g_id");
				String b_status = rs.getString("b_status");
				String g_name = rs.getString("g_name");
				String hourwage = rs.getString("hourwage");
				
				BookVO vo = new BookVO();
				
				vo.setB_id(b_id);
				vo.setRes_code(rescode);
				vo.setG_id(g_id);
				vo.setB_status(b_status);
				vo.setG_name(g_name);
				vo.setHourwage(hourwage);
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public int approvebook(String res_code, String b_id) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE  `book` SET b_status='거절' where res_code=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, res_code);
			
			int updeny = pstmt.executeUpdate();
			
			if(updeny>0) {
				String usql = "UPDATE  `book` SET b_status='승인' where b_id=?";
				stmnt = conn.prepareStatement(usql);
				
				stmnt.setString(1, b_id);
				
				result = stmnt.executeUpdate();				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { 
			if(pstmt!=null ) pstmt.close();
			if(stmnt!=null) stmnt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result;
	}
	
	public int denybook(String b_id) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE `book` SET b_status='거절' where b_id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, b_id);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { 
			if(pstmt!=null ) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result;
	}
	
	public int updategid(String g_id, String res_code) {
		int result = 0;
		try {
			connect();
			String sql =  "UPDATE `reservation` SET caregiver_id=? where res_code=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, g_id);
			pstmt.setString(2, res_code);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { 
			if(pstmt!=null ) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result;
	}
	
	public String bst(String res_code, String g_id) {
		String bst = null;
	try {
		connect();

		String sql = "SELECT * FROM book WHERE res_code=? and g_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, res_code);
		pstmt.setString(2, g_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			bst = rs.getString("b_status");
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bst;
}
	
	public List<String> code(String g_id) {
		List<String> code = new ArrayList();
		try {
			connect();
				
			String sql = "SELECT res_code FROM book WHERE g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String res_code = rs.getString("res_code");
				code.add(res_code);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	public List<BookVO> gList(String g_id) {
		List<BookVO> list= new ArrayList<BookVO>();
		
		try {
			connect();
				
			String sql = "SELECT * FROM caregiver WHERE g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String g_name = rs.getString("g_name");
				String g_gender = rs.getString("g_gender");
				String g_birth = rs.getString("g_birth");
				String g_address = rs.getString("g_address");
				String g_profile = rs.getString("g_profile");
				String g_service1 = rs.getString("g_service1");
				String g_service2 = rs.getString("g_service2");
				String g_service3 = rs.getString("g_service3");
				String g_qualification = rs.getString("g_qualification");
				String g_location1 = rs.getString("g_location1");
				String g_location2 = rs.getString("g_location2");
				String g_location3 = rs.getString("g_location3");
				String g_hourwage1 = rs.getString("g_hourwage1");
				String g_hourwage2 = rs.getString("g_hourwage2");
				String g_hourwage3 = rs.getString("g_hourwage3");
				
				BookVO vo = new BookVO(); 

				vo.setG_name(g_name);
				vo.setG_gender(g_gender);
				vo.setG_birth(g_birth);
				vo.setG_address(g_address);
				vo.setG_profile(g_profile);
				vo.setG_service1(g_service1);
				vo.setG_service2(g_service2);
				vo.setG_service3(g_service3);
				vo.setG_qualification(g_qualification);
				vo.setG_location1(g_location1);
				vo.setG_location2(g_location2);
				vo.setG_location3(g_location3);
				vo.setG_hourwage1(g_hourwage1);
				vo.setG_hourwage2(g_hourwage2);
				vo.setG_hourwage3(g_hourwage3);
				
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
	
	public int serviceComplete(String res_code, String g_id) {
		int result =0;
		try {
			connect();
			String sql = "UPDATE book SET b_status='서비스이용 완료' WHERE res_code=? AND g_id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, res_code);
			pstmt.setString(2, g_id);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { 
			if(pstmt!=null ) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public String status(String res_code, String g_id) {
		String b_status = "";
		try {
			connect();
				
			String sql = "SELECT b_status FROM book WHERE res_code=? AND g_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_code);
			pstmt.setString(2, g_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				b_status = rs.getString("b_status");
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return b_status;
  }
  
	public String ghourwage(String res_code, String g_id) {
			String ghourwage = null;
		try {
			connect();

			String sql = "SELECT * FROM book WHERE res_code=? and g_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_code);
			pstmt.setString(2, g_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ghourwage = rs.getString("hourwage");
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ghourwage;
	}
	public void delMatch(String g_id, String res_code) {
		try {
			connect();
			String sql = "DELETE FROM book WHERE g_id=? and res_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g_id);
			pstmt.setString(2, res_code);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ReservationVO> myApply(String g_id) {
		List<ReservationVO> list = new ArrayList<ReservationVO>();

		try {
			connect();

			String sql = "SELECT r.caretaker_code, b.res_code, c.t_name, r.addr, ri.start_date, ri.end_date, ri.start_time, ri.end_time, b.hourwage, b.b_status FROM book as b, reservation_info as ri, reservation as r, caretaker as c WHERE c.m_id=r.m_id AND c.t_code=ri.caretaker_code AND b.g_id=? AND b.res_code = r.res_code AND r.res_code = ri.res_code";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String caretaker_code = rs.getString("caretaker_code");
				String res_code = rs.getString("res_code");
				String caretakerName = rs.getString("t_name");
				String address = rs.getString("addr");
				String start_date = rs.getString("start_date");
				String end_date = rs.getString("end_date");
				String start_time = rs.getString("start_time");
				String end_time = rs.getString("end_time");
				String hourwage = rs.getString("hourwage");
				String b_status = rs.getString("b_status");
				
				ReservationVO vo = new ReservationVO(caretaker_code, res_code, caretakerName, address, start_date, end_date, start_time, end_time, hourwage, b_status);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}