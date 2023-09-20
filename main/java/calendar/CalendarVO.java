package calendar;
import java.sql.Date;
import java.sql.Time;

public class CalendarVO {
	private String res_code;
	private Date start_date;
	private Date end_date;
	private Time start_time;
	private Time end_time;
	private String caretaker_code;
	private String m_id;
	private String t_name;
	
	public CalendarVO() {
		System.out.println("CalendarVO 생성자 호출");
	}

	/**
	 * @return the res_code
	 */
	public String getRes_code() {
		return res_code;
	}

	/**
	 * @param res_code the res_code to set
	 */
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	/**
	 * @return the start_date
	 */
	public Date getStart_date() {
		return start_date;
	}

	/**
	 * @param start_date the start_date to set
	 */
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	/**
	 * @return the end_date
	 */
	public Date getEnd_date() {
		return end_date;
	}

	/**
	 * @param end_date the end_date to set
	 */
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	/**
	 * @return the start_time
	 */
	public Time getStart_time() {
		return start_time;
	}

	/**
	 * @param start_time the start_time to set
	 */
	public void setStart_time(Time start_time) {
		this.start_time = start_time;
	}

	/**
	 * @return the end_time
	 */
	public Time getEnd_time() {
		return end_time;
	}

	/**
	 * @param end_time the end_time to set
	 */
	public void setEnd_time(Time end_time) {
		this.end_time = end_time;
	}

	/**
	 * @return the caretaker_code
	 */
	public String getCaretaker_code() {
		return caretaker_code;
	}

	/**
	 * @param caretaker_code the caretaker_code to set
	 */
	public void setCaretaker_code(String caretaker_code) {
		this.caretaker_code = caretaker_code;
	}

	/**
	 * @return the m_id
	 */
	public String getM_id() {
		return m_id;
	}

	/**
	 * @param m_id the m_id to set
	 */
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	/**
	 * @return the t_name
	 */
	public String getT_name() {
		return t_name;
	}

	/**
	 * @param t_name the t_name to set
	 */
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	
	
}
