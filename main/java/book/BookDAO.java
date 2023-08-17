package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



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
			"INSERT INTO book(res_code, g_id, b_status)"
					+ "VALUES(?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getRes_code());
			pstmt.setString(2, vo.getG_id());
			pstmt.setString(3, vo.getB_status());
			
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
				
				BookVO vo = new BookVO();
				
				vo.setB_id(b_id);
				vo.setRes_code(rescode);
				vo.setG_id(g_id);
				vo.setB_status(b_status);
				vo.setG_name(g_name);
				
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
			String sql = "UPDATE  `suitecare`.`book` SET b_status='거절' where res_code=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, res_code);
			
			int updeny = pstmt.executeUpdate();
			
			if(updeny>0) {
				String usql = "UPDATE  `suitecare`.`book` SET b_status='승인' where b_id=?";
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
			String sql = "UPDATE  `suitecare`.`book` SET b_status='거절' where b_id=?";
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
			String sql =  "UPDATE  `suitecare`.`reservation` SET caregiver_id=? where res_code=?";
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
	
	public List<BookVO> listbst(String g_id, String res_code) {
		List<BookVO> list= new ArrayList<BookVO>();
		
		try {
			connect();
				
			String sql = "SELECT b_status FROM book WHERE g_id=? and res_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g_id);
			pstmt.setString(2, res_code);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String b_status = rs.getString("b_status");
				
				BookVO vo = new BookVO(); 

				vo.setB_status(b_status);
				
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
				String g_representative = rs.getString("g_representative");
				String g_qualification = rs.getString("g_qualification");
				int g_location = rs.getInt("g_location");
				
				
				BookVO vo = new BookVO(); 

				vo.setG_name(g_name);
				vo.setG_gender(g_gender);
				vo.setG_birth(g_birth);
				vo.setG_address(g_address);
				vo.setG_profile(g_profile);
				vo.setG_representative(g_representative);
				vo.setG_qualification(g_qualification);
				vo.setG_location(g_location);
				
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
	
	public String gloc(int g_location) {
		String locname = null;
		
		try {
			connect();
			
			String sql = "SELECT sido FROM location WHERE sido_code=?";
			
			stmnt = conn.prepareStatement(sql);
			stmnt.setInt(1,g_location);
			
			rs = stmnt.executeQuery();
			
			if(rs.next()) {
				locname = rs.getString("sido");
				//System.out.println(locname);
			}
			rs.close();
			stmnt.close();
			pstmt.close();}
		 catch(Exception e) {
			e.printStackTrace();
			}

		return locname;
	}
}