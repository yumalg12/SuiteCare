package payment;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PayDAO {
	
	private PreparedStatement pstmt;
	private Connection conn;
	private DataSource dataFactory;
	private PreparedStatement stmnt;
	
	PayVO vo = new PayVO();
	
	public PayDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void addPay(PayVO payvo) {
		try {
			conn = dataFactory.getConnection();
			int amount = payvo.getAmout();
			String pay_method = payvo.getPay_method();
			String m_id = payvo.getM_id();
			int currentMile = vo.getCurrentMile();
			System.out.println("마일리지:" + currentMile);
			int updateMile = currentMile + amount;
			String m_phone = payvo.getM_phone();
			
			String query = "INSERT INTO payment(amount, pay_method, m_id, updateMile, m_phone)" + " VALUES(?, ? ,?, ?, ?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, amount);
			pstmt.setString(2, pay_method);
			pstmt.setString(3, m_id);
			pstmt.setInt(4, updateMile);
			pstmt.setString(5, m_phone);
			
			pstmt.executeUpdate();
			
			String usql = "UPDATE  `member` SET currentMile= '"+updateMile+"' WHERE m_id = '"+m_id+"'";
			System.out.println(usql);
			stmnt = conn.prepareStatement(usql);									
			stmnt.executeUpdate();	
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
public List<PayVO> payInfo(PayVO payvo) {
	List<PayVO> list = new ArrayList<PayVO>();
		
		try {
			conn = dataFactory.getConnection();
			String m_id = payvo.getM_id();
			String query = "select * from member WHERE m_id = '"+m_id+"'";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String m_name = rs.getString("m_name");
				String m_phone = rs.getString("m_phone");
				String m_email = rs.getString("m_email");
				int currentMile = rs.getInt("currentMile");
				//System.out.print("currentmile ="+ currentMile);
				vo.setM_name(m_name);
				vo.setM_phone(m_phone);
				vo.setM_email(m_email);
				vo.setCurrentMile(currentMile);
				list.add(vo);
				
				System.out.println("vo저장된 마일리지 : " + vo.getCurrentMile());
			}
		}catch (SQLException e) {
				e.printStackTrace();
			}
		
		return list;					
	}


}