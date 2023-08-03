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
			String amount = payvo.getAmout();
			String pay_method = payvo.getPay_method();			
			String query = "INSERT INTO t_payment(merchant_uid, amount, pay_method)" + " VALUES(?, ? ,?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, merchant_uid);
			pstmt.setString(2, amount);
			pstmt.setString(3, pay_method);			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}