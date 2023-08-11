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
}