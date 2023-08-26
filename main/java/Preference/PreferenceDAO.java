package Preference;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class PreferenceDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	private ResultSet rs;
	
	public PreferenceDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Pair<List<PreferenceVO>, List<PreferenceVO>> pMatching(String res_code) {
		List<PreferenceVO> fullList = new ArrayList<>();
		List<PreferenceVO> partList = new ArrayList<>();
		
		try {
			con = dataFactory.getConnection();
		
			String sql = "SELECT * FROM reservation_info as r, caregiver as c WHERE r.res_code=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, res_code);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
			    int count = 0;
			  
				String g_id = rs.getString("g_id");
				String g_name = rs.getString("g_name");
				String g_email = rs.getString("g_email");
				String g_address = rs.getString("g_address");
				String g_profile = rs.getString("g_profile");
				String g_service2 = rs.getString("g_service2");
				String g_service3 = rs.getString("g_service3");
				String g_qualification = rs.getString("g_qualification");
				String rescode = rs.getString("res_code");
			    String pre_location_1 = rs.getString("pre_location_1");
			    String pre_age_1 = rs.getString("pre_age_1");
			    String pre_gender = rs.getString("pre_gender");
			    String pre_repre_1 = rs.getString("pre_repre_1");
			    String pre_hourwage_1 = rs.getString("pre_hourwage_1");
			    String g_service1 = rs.getString("g_service1");
			    String g_location1 = rs.getString("g_location1");
			    String g_hourwage1 = rs.getString("g_hourwage1");
			    String g_gender = rs.getString("g_gender");
			    String g_birth = rs.getString("g_birth");
			    
			    String[] pageparts = pre_age_1.split("~");
			    if(pageparts.length == 2) {
			    	String fage = pageparts[0];
			    	String sage = pageparts[1];
			    	int start_page = Integer.parseInt(fage);
			    	int end_page = Integer.parseInt(sage);	    
			    
			    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			    Date birthDate = dateFormat.parse(g_birth);
			     
			     Calendar birthCalendar = Calendar.getInstance();
			    birthCalendar.setTime(birthDate); // 생년월일 Caelendar 객체에 저장
			     
			     Calendar currentCalendar = Calendar.getInstance(); // 현재시간 기준
			     
			     int birthYear = birthCalendar.get(Calendar.YEAR);
			     int currentYear = currentCalendar.get(Calendar.YEAR);
			     
			     int giverage = currentYear - birthYear; // 나이 계산
			  
			     int birthMonth = birthCalendar.get(Calendar.MONTH);
			     int currentMonth = currentCalendar.get(Calendar.MONTH);
			     
			     int birthDay = birthCalendar.get(Calendar.DAY_OF_MONTH);
			     int currentDay = currentCalendar.get(Calendar.DAY_OF_MONTH);
			     
			  // 생일이 지났는지 체크
			     if (currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay)) {
			    	 giverage--; } // 아직 생일이 지나지 않았으면 나이에서 1을 뺌 
			     
			     
			     
			     if(pre_location_1.equals(g_location1) &&
			     ( pre_gender.equals(g_gender) || pre_gender.equals("상관없음"))&&
			     pre_repre_1.equals(g_service1) &&
			     pre_hourwage_1.equals(g_hourwage1) &&
			     start_page <= giverage &&
			     giverage<= end_page
			     ) {
			    	 PreferenceVO vo = new PreferenceVO();
			    	 
			    	 vo.setG_name(g_name);
			    	 vo.setG_id(g_id);
			    	 vo.setG_email(g_email);
			    	 vo.setG_address(g_address);
			    	 vo.setG_profile(g_profile);
			    	 vo.setG_service1(g_service1);
			    	 vo.setG_service2(g_service2);
			    	 vo.setG_service3(g_service3);
			    	 vo.setG_qualification(g_qualification);
			    	 vo.setG_location1(g_location1);
			    	 vo.setG_hourwage1(g_hourwage1);
			    	 vo.setG_birth(g_birth);
			    	 vo.setG_gender(g_gender);
			    	 vo.setRes_code(rescode);
			    	 vo.setPre_location_1(pre_location_1);
			    	 vo.setPre_age_1(pre_age_1);
			    	 vo.setPre_gender(pre_gender);
			    	 vo.setPre_repre_1(pre_repre_1);
			    	 vo.setPre_hourwage_1(pre_hourwage_1);
			    	 
			    	 fullList.add(vo);
			     } else {
			    	 if(pre_location_1.equals(g_location1)) count++;
					if( pre_gender.equals(g_gender) || pre_gender.equals("상관없음")) count++;
					if(pre_repre_1.equals(g_service1)) count++;
					if(pre_hourwage_1.equals(g_hourwage1)) count++;
					if(start_page <= giverage &&
					 giverage<= end_page ) count++;
					
					if(count == 4 || count == 3) {
						PreferenceVO vo = new PreferenceVO();
				    	 
				    	 vo.setG_name(g_name);
				    	 vo.setG_id(g_id);
				    	 vo.setG_email(g_email);
				    	 vo.setG_address(g_address);
				    	 vo.setG_profile(g_profile);
				    	 vo.setG_service1(g_service1);
				    	 vo.setG_service2(g_service2);
				    	 vo.setG_service3(g_service3);
				    	 vo.setG_qualification(g_qualification);
				    	 vo.setG_location1(g_location1);
				    	 vo.setG_hourwage1(g_hourwage1);
				    	 vo.setG_birth(g_birth);
				    	 vo.setG_gender(g_gender);
				    	 vo.setRes_code(rescode);
				    	 vo.setPre_location_1(pre_location_1);
				    	 vo.setPre_age_1(pre_age_1);
				    	 vo.setPre_gender(pre_gender);
				    	 vo.setPre_repre_1(pre_repre_1);
				    	 vo.setPre_hourwage_1(pre_hourwage_1);
				    	 
				    	 partList.add(vo);
					}
						     
			     }
			}
		} rs.close();
		pstmt.close();
		con.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
		 return new Pair<>(fullList, partList);
		
	}
}
