package caretaker;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class TakerDAO {
   private PreparedStatement pstmt;
   private Connection conn;
   private ResultSet rs = null;
   private DataSource dataFactory;

   public TakerDAO() {
      try {
         Context ctx = new InitialContext();
         Context envContext = (Context) ctx.lookup("java:/comp/env");
         dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   
   public void insert(TakerVO vo) {
      try {
         conn = dataFactory.getConnection();
         
         String sql = 
         "INSERT INTO caretaker(m_id, t_name, t_gender, t_age, t_height, t_weight, diagnosis)"
               + "VALUES(?,?,?,?,?,?,?)";
         
         pstmt = conn.prepareStatement(sql);
         
         
         pstmt.setString(1, vo.getM_id());
         pstmt.setString(2, vo.getT_name());
         pstmt.setString(3, vo.getT_gender());
         pstmt.setString(4, vo.getT_age());
         pstmt.setString(5, vo.getT_height());
         pstmt.setString(6, vo.getT_weight());
         pstmt.setString(7, vo.getDiagnosis());
         
         
         pstmt.executeUpdate();
         System.out.println("정보 등록 완료");
         
         
         pstmt.close();}
      
       catch(Exception e) {
         e.printStackTrace();
         }

         
   }
   
   public List<TakerVO> takerList(String id) {
      List<TakerVO> list= new ArrayList<TakerVO>();
      
      try {
         conn = dataFactory.getConnection();
         
         String sql = "SELECT * FROM caretaker where m_id=?";
         System.out.println(sql);
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
        	String m_id = rs.getString("m_id");
            String t_code = rs.getString("t_code");
            String t_name = rs.getString("t_name");
            String t_gender = rs.getString("t_gender");
            String t_age = rs.getString("t_age");
            String t_height = rs.getString("t_height");
            String t_weight = rs.getString("t_weight");
            String diagnosis = rs.getString("diagnosis");
            
            
            TakerVO vo = new TakerVO();
            vo.setM_id(m_id);
            vo.setT_code(t_code);
            vo.setT_name(t_name);
            vo.setT_gender(t_gender);
            vo.setT_age(t_age);
            vo.setT_height(t_height);
            vo.setT_weight(t_weight);
            vo.setDiagnosis(diagnosis);
            
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
   
   
   public int update(TakerVO vo) {
      int result = 0;
      try {
         
         conn = dataFactory.getConnection();
         
         String sql = "UPDATE caretaker SET t_name=?, t_gender=?, t_age=?, t_height=?, t_weight=?, diagnosis=? where m_id=?";
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, vo.getT_name());
         pstmt.setString(2, vo.getT_gender());
         pstmt.setString(3, vo.getT_age());
         pstmt.setString(4, vo.getT_height());
         pstmt.setString(5, vo.getT_weight());
         pstmt.setString(6, vo.getDiagnosis());
         pstmt.setString(7, vo.getM_id());
         
         
         result=pstmt.executeUpdate();
         
         System.out.println(result);
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try { if(pstmt!=null) pstmt.close();
         } catch(Exception e) {
            e.printStackTrace();
         }
      } return result;
   }
}