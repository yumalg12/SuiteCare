package review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class mReviewDAO {

	private PreparedStatement pstmt;
	private ResultSet rs = null;
	private Connection conn;
	private DataSource dataFactory;

	public mReviewDAO() {

		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
	
			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean addReview(mReviewVO vo) {
		
		
		try {
			conn = dataFactory.getConnection();
			
			
			String m_id = vo.getM_id();
			String res_code = vo.getRes_code();
			String g_id = vo.getG_id();	
			int re_kind = vo.getRe_kind();
			int re_time = vo.getRe_time();
			int re_pro = vo.getRe_pro();
			int re_speed = vo.getRe_speed();
			int re_com = vo.getRe_com();
			int re_price = vo.getRe_price();
			String comment = vo.getComment();
			
			String sql = "insert into `review`(m_id, res_code, g_id, re_kind, re_time, re_pro, re_speed, re_com, re_price, comment) "+
					"values(?,?,?,?,?,?,?,?,?,?)";
			
			System.out.println("addReview(): "+sql);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, res_code);
			pstmt.setString(3, g_id);
			pstmt.setInt(4, re_kind);
			pstmt.setInt(5, re_time);
			pstmt.setInt(6, re_pro);
			pstmt.setInt(7, re_speed);
			pstmt.setInt(8, re_com);
			pstmt.setInt(9, re_price);
			pstmt.setString(10, comment);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<mReviewVO> review(String res_code, String g_id) {
		List<mReviewVO> list= new ArrayList<mReviewVO>();
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT re_kind, re_time, re_pro, re_speed, re_com, re_price, comment FROM review WHERE res_code = ? AND g_id =?";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_code);
			pstmt.setString(2, g_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int re_kind = rs.getInt("re_kind");
				int re_time = rs.getInt("re_time");
				int re_pro = rs.getInt("re_pro");
				int re_speed = rs.getInt("re_speed");
				int re_com = rs.getInt("re_com");
				int re_price = rs.getInt("re_price");
				String comment = rs.getString("comment");
				System.err.println(re_kind +"/"+re_time +"/"+re_pro +"/"+re_speed +"/"+re_com +"/"+re_price +"/"+comment);
				mReviewVO vo = new mReviewVO(re_kind, re_time, re_pro, re_speed, re_com, re_price, comment);
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
	
	public List<String> reviewCode(String g_id) {
		List<String> reviewCode = new ArrayList<String>();
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT res_code FROM review WHERE g_id =?";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String res_code = rs.getString("res_code");
				reviewCode.add(res_code);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return reviewCode;
	}
}
