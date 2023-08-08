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
			String merchant_uid = payvo.getMerchant_uid();
			int amount = payvo.getAmout();
			String pay_method = payvo.getPay_method();
			String m_id = payvo.getM_id();
			double scPoint = payvo.getScPoint();
			String m_phone = payvo.getM_phone();
			String query = "INSERT INTO t_payment(merchant_uid, amount, pay_method, m_id, scPoint, m_phone)" + " VALUES(?, ? ,?, ?, ?,?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, merchant_uid);
			pstmt.setInt(2, amount);
			pstmt.setString(3, pay_method);
			pstmt.setString(4, m_id);
			pstmt.setDouble(5, scPoint);
			pstmt.setString(6, m_phone);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
public void payInfo(PayVO payvo) {
		
		try {
			conn = dataFactory.getConnection();
			String m_id = payvo.getM_id();
			String query = "select * from MEMBER WHERE m_id = '"+m_id+"'";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			String m_name = rs.getString("m_name");
			String m_phone = rs.getString("m_phone");
			String m_email = rs.getString("m_email");
			payvo.setM_name(m_name);
			payvo.setM_phone(m_phone);
			payvo.setM_email(m_email);
									
		}catch (SQLException e) {
				e.printStackTrace();
			}
		
		
	}
}