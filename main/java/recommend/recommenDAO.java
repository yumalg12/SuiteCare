package recommend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class recommenDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	private ResultSet rs;

	public recommenDAO() {
		
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	 public void insertrecommendation(String re_id, String recommendations_1, String recommendations_2, String recommendations_3) throws SQLException {
	        String insertSQL = "INSERT INTO recommendations (re_id, recommendations_1, recommendations_2, recommendations_3) VALUES (?, ?, ?, ?)";
	        
	        try {
	        	con = dataFactory.getConnection();
	        	
	            pstmt = con.prepareStatement(insertSQL);
	            
	            pstmt.setString(1, re_id);
	            pstmt.setString(2, recommendations_1);
	            pstmt.setString(3, recommendations_2);
	            pstmt.setString(4, recommendations_3);
	            pstmt.executeUpdate();
	            } catch (SQLException e) {
	            throw new SQLException("Error inserting recommendation", e);
	        }
	 }
	 
	 public int updateRecommendation(String re_id, String recommendations_1, String recommendations_2, String recommendations_3) {
		 	int update = 0;
		 	
		 	try {
		 		con = dataFactory.getConnection();
		 		
		 		String sql = "UPDATE recommendations SET recommendations_1=?, recommendations_2=?, recommendations_3=? where re_id=?";
		 		
		 		pstmt = con.prepareStatement(sql);
		 		
		 		pstmt.setString(1, recommendations_1);
		 		pstmt.setString(2, recommendations_2);
		 		pstmt.setString(3, recommendations_3);
		 		pstmt.setString(4, re_id);
		 		
		 		update=pstmt.executeUpdate();
				
				System.out.println(update);
		 		
				pstmt.close();
				con.close();
		 	} catch(Exception e) {
		 		e.printStackTrace();
		 	} return update;
		 
	 }
	 
	 public int selectre(String re_id) {
		 int select = 0;
		 
		 try {
			 con = dataFactory.getConnection();
			 
			 String sql = "SELECT re_id FROM recommendations WHERE re_id = ?";
			 pstmt = con.prepareStatement(sql);
				
			 pstmt.setString(1, re_id);
			 
			 ResultSet rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 select = 1;
			 } else {
				 select = 0;
			 }
		 } catch(SQLException e) {
			 e.printStackTrace();
		 } finally {
		        try {
		            if (rs != null) {
		                rs.close();
		            }
		            if (pstmt != null) {
		                pstmt.close();
		            }
		            if (con != null) {
		                con.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		 return select;
	 }
	
	 
	 public List<RecommendInfoVO> recomList(String re_id) {
		 List<RecommendInfoVO> list = new ArrayList<RecommendInfoVO>();
		 
		 try {
			 con = dataFactory.getConnection();
			 
			 String sql = "SELECT * FROM recommendations as r, caregiver as c WHERE r.re_id=? AND (c.g_id = r.recommendations_1 OR c.g_id = r.recommendations_2 OR c.g_id = r.recommendations_3)";
			 pstmt = con.prepareStatement(sql);
				
			 pstmt.setString(1, re_id);
				
			 
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String res_code = rs.getString("re_id");
				String g_id = rs.getString("g_id");
				String g_name = rs.getString("g_name");
				String g_email = rs.getString("g_email");
				String g_address = rs.getString("g_address");
				String g_profile = rs.getString("g_profile");
				String g_service1 = rs.getString("g_service1");
				String g_service2 = rs.getString("g_service2");
				String g_service3 = rs.getString("g_service3");
				String g_qualification = rs.getString("g_qualification");
				String g_gender = rs.getString("g_gender");
				String g_birth = rs.getString("g_birth");
				String g_location1 = rs.getString("g_location1");
				String g_location2 = rs.getString("g_location2");
				String g_location3 = rs.getString("g_location3");
				String g_hourwage1 = rs.getString("g_hourwage1");
				String g_hourwage2 = rs.getString("g_hourwage2");
				String g_hourwage3 = rs.getString("g_hourwage3");
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
     		   Date birthDate = dateFormat.parse(g_birth);
     		    
     		    Calendar birthCalendar = Calendar.getInstance();
     		   birthCalendar.setTime(birthDate); // 생년월일 Caelendar 객체에 저장
     		    
     		    Calendar currentCalendar = Calendar.getInstance(); // 현재시간 기준
     		    
     		    int birthYear = birthCalendar.get(Calendar.YEAR);
     		    int currentYear = currentCalendar.get(Calendar.YEAR);
     		    
     		    int age = currentYear - birthYear; // 나이 계산
     		 
     		    int birthMonth = birthCalendar.get(Calendar.MONTH);
     		    int currentMonth = currentCalendar.get(Calendar.MONTH);
     		    
     		    int birthDay = birthCalendar.get(Calendar.DAY_OF_MONTH);
     		    int currentDay = currentCalendar.get(Calendar.DAY_OF_MONTH);
     		    
     		 // 생일이 지났는지 체크
     		    if (currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay)) {
     		        age--; } // 아직 생일이 지나지 않았으면 나이에서 1을 뺌 
				
				RecommendInfoVO vo = new RecommendInfoVO();
				
				vo.setRe_id(res_code);
				vo.setG_id(g_id);
				vo.setG_name(g_name);
				vo.setG_email(g_email);
				vo.setG_address(g_address);
				vo.setG_profile(g_profile);
				vo.setG_service1(g_service1);
				vo.setG_service2(g_service2);
				vo.setG_service3(g_service3);
				vo.setG_qualification(g_qualification);
				vo.setG_gender(g_gender);
				vo.setG_birth(g_birth);
				vo.setG_location1(g_location1);
				vo.setG_location2(g_location2);
				vo.setG_location3(g_location3);
				vo.setG_hourwage1(g_hourwage1);
				vo.setG_hourwage2(g_hourwage2);
				vo.setG_hourwage3(g_hourwage3);
				vo.setG_age(age);
				
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



