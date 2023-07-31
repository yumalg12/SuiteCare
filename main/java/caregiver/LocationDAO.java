package caregiver;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LocationDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	private ResultSet rs;
	
	public LocationDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<LocationVO> location() {
		List<LocationVO> list = new ArrayList<LocationVO>();
		
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM location";
			pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int sido_code = rs.getInt("sido_code");
				String sido = rs.getString("sido");
				
				LocationVO vo = new LocationVO();
				vo.setSido_code(sido_code);
				vo.setSido(sido);
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
}
