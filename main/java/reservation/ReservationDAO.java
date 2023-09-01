package reservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import caretaker.TakerVO;

public class ReservationDAO {
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
	
	public int tinfocheck(String m_id) {
		System.out.println("피간병인 정보 확인");
		int ok = 0;
		try {
		connect();
		String sql = "SELECT t_code FROM caretaker WHERE m_id = ?"; //피간병인 아이디에 등록된 피간병인 정보 갯수 확인
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			ok = 1;
			System.out.println("피간병인 정보 o"); // 정보가 있는 경우, 해당 정보 출력
		} else {
			ok = 0;
			System.out.println("피간병인 정보 x, 등록필요"); // 정보가 없는 경우 등록필요
		}
		if (rs != null) { //rs 객체 종료
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) { //pstmt 객체 종료
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (conn != null) { // conn 객체 종료
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ok;
	}
	
	public List<CaretakerinfoVO> listtname(String m_id) {
		List<CaretakerinfoVO> list= new ArrayList<CaretakerinfoVO>();
		
		try {
			connect();
				
			String sql = "SELECT t_name FROM caretaker WHERE m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String t_name = rs.getString("t_name");
				
				CaretakerinfoVO vo = new CaretakerinfoVO(); 
				vo.setT_name(t_name);
				
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
	
	public List<CaretakerinfoVO> listtinfo(String m_id, String t_name) {
		List<CaretakerinfoVO> list= new ArrayList<CaretakerinfoVO>();
		try {
			connect();
				
			String sql = "SELECT * FROM caretaker WHERE m_id = ? and t_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, t_name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String tname = rs.getString("t_name");
				String t_code = rs.getString("t_code");
				int t_age = rs.getInt("t_age");
				int t_height = rs.getInt("t_height");
				int t_weight = rs.getInt("t_weight");
				String t_gender = rs.getString("t_gender");
				String diagnosis = rs.getString("diagnosis");
				
				
				CaretakerinfoVO vo = new CaretakerinfoVO();
				
				vo.setT_name(t_name);
				vo.setT_code(t_code);
				vo.setT_age(t_age);
				vo.setT_height(t_height);
				vo.setT_weight(t_weight);
				vo.setT_gender(t_gender);
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
	
	public String insert(ReservationVO vo) {
		
		String rescode = null;
		try {
			connect();
			
			
			String sql = 
			"INSERT INTO reservation(m_id, caretaker_code, consciousness, care_meal_yn, care_toilet, state_paralysis, state_mobility, bedsore_yn, suction_yn, outpatient_yn, care_night_yn, notice)"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getM_id());
			pstmt.setString(2, vo.getCaretaker_code());
			pstmt.setString(3, vo.getConsciousness());
			pstmt.setString(4, vo.getCare_meal_yn());
			pstmt.setString(5, vo.getCare_toilet());
			pstmt.setString(6, vo.getState_paralysis());
			pstmt.setString(7, vo.getState_mobility());
			pstmt.setString(8, vo.getBedsore_yn());
			pstmt.setString(9, vo.getSuction_yn());
			pstmt.setString(10, vo.getOutpatient_yn());
			pstmt.setString(11, vo.getCare_night_yn());
			pstmt.setString(12, vo.getNotice());
			
			pstmt.executeUpdate();
			
			String selectSql = "SELECT res_code FROM reservation WHERE caretaker_code=? ORDER BY res_code DESC LIMIT 1";
			//피간병인 코드별 예약번호를 내림차순으로 정렬하여 가장 최근에 만들어진 예약코드 select
			
			stmnt = conn.prepareStatement(selectSql);
			stmnt.setString(1, vo.getCaretaker_code());
			
			rs = stmnt.executeQuery();
			
			if(rs.next()) {
				rescode = rs.getString("res_code");
				System.out.println(rescode);
			}
			rs.close();
			stmnt.close();
			pstmt.close();}
		 catch(Exception e) {
			e.printStackTrace();
			}

		return rescode;
	}
	
	
	public ReservationVO getLatestReservation(String m_id, String t_code) {
	    ReservationVO reservation = null;
	    try {
	        connect();

	        String sql = "SELECT * FROM reservation WHERE m_id = ? AND caretaker_code = ? ORDER BY res_code DESC LIMIT 1";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, m_id);
	        pstmt.setString(2, t_code);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            ReservationVO vo = new ReservationVO();
	            vo.setConsciousness(rs.getString("consciousness"));
	            vo.setCare_meal_yn(rs.getString("care_meal_yn"));
	            vo.setCare_toilet(rs.getString("care_toilet"));
	            vo.setState_paralysis(rs.getString("state_paralysis"));
	            vo.setState_mobility(rs.getString("state_mobility"));
	            vo.setBedsore_yn(rs.getString("bedsore_yn"));
	            vo.setSuction_yn(rs.getString("suction_yn"));
	            vo.setOutpatient_yn(rs.getString("outpatient_yn"));
	            vo.setCare_night_yn(rs.getString("care_night_yn"));
	            vo.setNotice(rs.getString("notice"));

	            reservation = vo;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return reservation;
	}

	public int updatehome(String res_code) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE `reservation` SET location='home' where res_code=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, res_code);
			
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
	
	public int updateaddr(ReservationVO vo) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE reservation SET addr=? where res_code=?";

			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, vo.getAddr());
			pstmt.setString(2, vo.getRes_code());
			
			result=pstmt.executeUpdate();
			
			System.out.println("result : " + result);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(pstmt!=null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result;
	}
	
	public int checkres(ReservationInfoVO vo) {
		int check_ok = 0;
	
		try {
			connect();
			
			String sql = "select * from reservation_info where start_date <= ? AND end_date >= ? and start_time<=? and end_time>=? and caretaker_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEnd_date());
			pstmt.setString(2, vo.getStart_date());
			pstmt.setString(3, vo.getEnd_time());
			pstmt.setString(4, vo.getStart_time());
			pstmt.setString(5, vo.getCaretaker_code());
			
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()){
				check_ok=0;
				System.out.println("시간중복" + check_ok);
			} else {
				check_ok=1;
				System.out.println("예약가능" + check_ok);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check_ok;
	}
	
	public void insertrescode(ReservationInfoVO vo) {
		try {
			connect();
			
			String sql = 
					"INSERT INTO reservation_info(res_code, caretaker_code)"
							+ "VALUES(?,?)";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, vo.getRes_code());
					pstmt.setString(2, vo.getCaretaker_code());
					
					 pstmt.executeUpdate();
					
					System.out.println("info 코드 입력 완료");
					
					
					pstmt.close();}
				 catch(Exception e) {
					e.printStackTrace();
					}
			}
	
	public int updateresinfo(ReservationInfoVO vo) {
		
		int result = 0;
		try {
			connect();
			
			String sql = 
					 "UPDATE reservation_info SET start_date=?, end_date=?,start_time=?, end_time=? where res_code=?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, vo.getStart_date());
					pstmt.setString(2, vo.getEnd_date());
					pstmt.setString(3, vo.getStart_time());
					pstmt.setString(4, vo.getEnd_time());
					pstmt.setString(5, vo.getRes_code());
					
					result = pstmt.executeUpdate();
					
					System.out.println("예약완료" + result);
					
					
					pstmt.close();}
				 catch(Exception e) {
					e.printStackTrace();
					}
		return result;
			}
	
	
	public int updatehospaddr(ReservationVO vo) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE reservation SET location=?, addr=?, detail_addr=? where res_code=?";
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getLocation());
			pstmt.setString(2, vo.getAddr());
			pstmt.setString(3, vo.getDetail_addr());
			pstmt.setString(4, vo.getRes_code());
			System.out.println(vo.getLocation());
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
	

	public List<ReservationVO> resList(String id) {
	      List<ReservationVO> list= new ArrayList<ReservationVO>();
	      
	      try {
	    	 connect();
	         
	         String sql = "SELECT * FROM caretaker as c, reservation as r, reservation_info as rinfo "
	         		+ "WHERE r.caregiver_id=? and c.t_code=r.caretaker_code and r.res_code=rinfo.res_code";
	         //System.out.println(sql);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            String res_code = rs.getString("res_code");
	            String location = rs.getString("location");
	            
	        	String start_date = rs.getString("start_date");
	        	String end_date = rs.getString("end_date");
	        	String start_time = rs.getString("start_time");
	        	String end_time = rs.getString("end_time");
	            
	        	String tname = rs.getString("t_name");

	            ReservationVO vo = new ReservationVO();
	            vo.setRes_code(res_code);
	            vo.setLocation(location);
	            vo.setStart_date(start_date);
	            vo.setEnd_date(end_date);
	            vo.setStart_time(start_time);
	            vo.setEnd_time(end_time);
	            vo.setT_name(tname);
	            
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
	
	public List<ReservationVO> resList(String id, String res_code) {
	      List<ReservationVO> list= new ArrayList<ReservationVO>();
	      
	      try {
	    	 connect();
	         
	         String sql = "SELECT * FROM caretaker as c, reservation as r "
	         		+ "WHERE c.t_code=r.caretaker_code and r.res_code=?";
	         System.out.println(sql);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, res_code);

	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	        	String m_id = rs.getString("m_id");
	            String caretaker_code = rs.getString("caretaker_code");
	            String caregiver_id = rs.getString("caregiver_id");
	            String rescode = rs.getString("res_code");
	            String merchant_uid = rs.getString("merchant_uid");
	            String res_date = rs.getString("res_date");
	            String addr = rs.getString("addr");
	            String detail_addr = rs.getString("detail_addr");
	            String location = rs.getString("location");
	            String consciousness = rs.getString("consciousness");
	            String care_meal_yn = rs.getString("care_meal_yn");
	            String care_toilet = rs.getString("care_toilet");
	            String state_paralysis = rs.getString("state_paralysis");
	            String state_mobility = rs.getString("state_mobility");
	            String bedsore_yn = rs.getString("bedsore_yn");
	            String suction_yn = rs.getString("suction_yn");
	            String outpatient_yn = rs.getString("outpatient_yn");
	            String care_night_yn = rs.getString("care_night_yn");
	            String notice = rs.getString("notice");
	            
	        	String tname = rs.getString("t_name");
				int t_age = rs.getInt("t_age");
				int t_height = rs.getInt("t_height");
				int t_weight = rs.getInt("t_weight");
				String t_gender = rs.getString("t_gender");
				String diagnosis = rs.getString("diagnosis");
	        	
	            ReservationVO vo = new ReservationVO();
	            vo.setM_id(m_id);
	            vo.setCaretaker_code(caretaker_code);
	            vo.setCaregiver_id(caregiver_id);
	            vo.setRes_code(rescode);
	            vo.setMerchant_uid(merchant_uid);
	            vo.setRes_date(res_date);
	            vo.setLocation(location);
	            vo.setAddr(addr);
	            vo.setDetail_addr(detail_addr);
	            vo.setConsciousness(consciousness);
	            vo.setCare_meal_yn(care_meal_yn);
	            vo.setCare_toilet(care_toilet);
	            vo.setState_paralysis(state_paralysis);
	            vo.setState_mobility(state_mobility);
	            vo.setBedsore_yn(bedsore_yn);
	            vo.setSuction_yn(suction_yn);
	            vo.setOutpatient_yn(outpatient_yn);
	            vo.setCare_night_yn(care_night_yn);
	            vo.setNotice(notice);
	            
	            vo.setT_name(tname);
				vo.setT_age(t_age);
				vo.setT_height(t_height);
				vo.setT_weight(t_weight);
				vo.setT_gender(t_gender);
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

	
	public int updatepre(ReservationInfoVO vo) {
		int result = 0;
		try {
			connect();
			String sql = "UPDATE reservation_info SET pre_location_1=?, pre_location_2=?, pre_location_3=?, pre_age_1=?, pre_age_2=?, pre_age_3=?, pre_gender=?, pre_qual=?, pre_repre_1=?, pre_repre_2=?, pre_repre_3=?, pre_hourwage_1=?, pre_hourwage_2=?, pre_hourwage_3=?, rank1=?, rank2=?, rank3=?, rank4=?, rank5=? where res_code=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getPre_location_1());
			pstmt.setString(2, vo.getPre_location_2());
			pstmt.setString(3, vo.getPre_location_3());
			pstmt.setString(4, vo.getPre_age_1());
			pstmt.setString(5, vo.getPre_age_2());
			pstmt.setString(6, vo.getPre_age_3());
			pstmt.setString(7, vo.getPre_gender());
			pstmt.setString(8, vo.getPre_qual());
			pstmt.setString(9, vo.getPre_repre_1());
			pstmt.setString(10, vo.getPre_repre_2());
			pstmt.setString(11, vo.getPre_repre_3());
			pstmt.setString(12, vo.getPre_hourwage_1());
			pstmt.setString(13, vo.getPre_hourwage_2());
			pstmt.setString(14, vo.getPre_hourwage_3());
			pstmt.setString(15, vo.getRank1());
			pstmt.setString(16, vo.getRank2());
			pstmt.setString(17, vo.getRank3());
			pstmt.setString(18, vo.getRank4());
			pstmt.setString(19, vo.getRank5());
			pstmt.setString(20, vo.getRes_code());
			
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
	
	public int delresinfo(String res_code, String caretaker_code) {
		int delresinfo = 0;
		try {
			connect();
			String sql1 = "DELETE FROM reservation_info WHERE res_code=? and caretaker_code=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, res_code);
			pstmt.setString(2, caretaker_code);
			delresinfo = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		} return delresinfo;
	}
	
	public int delres(String res_code, String caretaker_code) {
		int delres = 0;
		try {
			connect();
			String sql1 = "DELETE FROM reservation WHERE res_code=? and caretaker_code=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, res_code);
			pstmt.setString(2, caretaker_code);
			delres = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		} return delres;
	}
	
	public int delresbook(String res_code) {
		int delresbook = 0;
		try {
			connect();
			String sql1 = "DELETE FROM book WHERE res_code=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, res_code);
			delresbook = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		} return delresbook;
	}
}
