package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class MatchDAO {
	private PreparedStatement pstmt;
	private PreparedStatement stmnt;
	private PreparedStatement stnt;
	private Connection con;
	private DataSource dataFactory;
	private ResultSet rs;


	public MatchDAO() {
		
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertMatch(MatchVO vo) {
		try {
			con = dataFactory.getConnection();
			
			
			String sql = 
			"INSERT INTO quickmatch(res_code, g_id, match_status, hourwage)"
					+ "VALUES(?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getRes_code());
			pstmt.setString(2, vo.getG_id());
			pstmt.setString(3, vo.getMatch_status());
			pstmt.setString(4, vo.getHourwage());
			
			pstmt.executeUpdate();
			
			pstmt.close();}
		 catch(Exception e) {
			e.printStackTrace();
			}
	}
	
	public int approveMatch(String res_code, String g_id) {
		int result = 0;
		try {
			con = dataFactory.getConnection();
			String sql = "UPDATE `quickmatch` SET match_status='거절' where res_code=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, res_code);
			
			int updeny = pstmt.executeUpdate();
			
			if(updeny>0) {
				String bsql = "UPDATE `book` SET b_status='거절' where res_code=?";
				stmnt = con.prepareStatement(bsql);
				
				stmnt.setString(1, res_code);
				
				int bookdeny = stmnt.executeUpdate();
				
				if(bookdeny>=0) {
					String usql = "UPDATE  `quickmatch` SET match_status='승인' where res_code=? and g_id=?";
					stnt = con.prepareStatement(usql);
					
					stnt.setString(1, res_code);
					stnt.setString(2, g_id);
					
					result = stnt.executeUpdate();	
				}
							
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
	
	public int denyMatch(String res_code, String g_id) {
		int result = 0;
		try {
			con = dataFactory.getConnection();
			String sql = "UPDATE `quickmatch` SET match_status='거절' where res_code=? and g_id=?";
			pstmt = con.prepareStatement(sql);

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
		} return result;
	}
	
	public int updategid(String g_id, String res_code) {
		int result = 0;
		try {
			con = dataFactory.getConnection();
			String sql =  "UPDATE `reservation` SET caregiver_id=? where res_code=?";
			pstmt = con.prepareStatement(sql);

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
	
	
	public List<MatchVO> tInfo(String g_id) {
		List<MatchVO> list= new ArrayList<MatchVO>();
		
		try {
			con = dataFactory.getConnection();
				
			String sql =  "SELECT * FROM quickmatch AS qm, caretaker AS c, reservation AS r, reservation_info AS ri WHERE qm.g_id = ? AND qm.res_code = r.res_code AND r.res_code = ri.res_code AND r.caretaker_code = c.t_code";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, g_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String res_code = rs.getString("res_code");
				String t_gender = rs.getString("t_gender");
				String t_age = rs.getString("t_age");
				String addr = rs.getString("addr");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Time start_time = rs.getTime("start_time");
				Time end_time = rs.getTime("end_time");
				String hourwage = rs.getString("hourwage");
				String caretaker_code = rs.getString("caretaker_code");
				
				int g_hourwage = Integer.parseInt(hourwage.replaceAll("[^0-9]", ""));

				// 근무 시간 계산
				long startTimeMillis = start_time.getTime();
				long endTimeMillis = end_time.getTime();
				long workTimeMillis = endTimeMillis - startTimeMillis;

				// 근무 일수 계산
				long dayInMillis = 24 * 60 * 60 * 1000; // 1일을 밀리초로 표현
				long workDays = (end_date.getTime() - start_date.getTime()) / dayInMillis;

				// 총 급여 계산
				int totalSalary = (int) (workTimeMillis * workDays * g_hourwage / (60 * 60 * 1000));
				
				MatchVO vo = new MatchVO(); 
				
				vo.setRes_code(res_code);
				vo.setT_gender(t_gender);
				vo.setT_age(t_age);
				vo.setAddr(addr);
				vo.setStart_date(start_date);
				vo.setEnd_date(end_date);
				vo.setStart_time(start_time);
				vo.setEnd_time(end_time);
				vo.setHourwage(hourwage);
				vo.setCaretaker_code(caretaker_code);
				vo.setTotalSalary(totalSalary);
				
				list.add(vo);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String mst(String res_code, String g_id) {
		String mst = null;
	try {
		con = dataFactory.getConnection();

		String sql = "SELECT * FROM quickmatch WHERE res_code=? and g_id =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, res_code);
		pstmt.setString(2, g_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			mst = rs.getString("match_status");
		}
		rs.close();
		pstmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return mst;
}
	
	
	public int quickCount() {
		int cnt = 0;
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT count(*) as cnt FROM quickmatch WHERE res_code=? and g_id =?";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				cnt = rs.getInt("cnt");
			}

			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
