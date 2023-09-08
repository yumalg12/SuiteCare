package match;

import java.sql.Time;
import java.util.Date;

public class MatchVO {
	private String match_id;
	private String res_code;
	private String g_id;
	private String match_status;
	private String hourwage;
	private int totalSalary;
	
	private String t_gender;
	private String t_age;
	private String addr;
	private Date start_date;
	private Date end_date;
	private Time start_time;
	private Time end_time;
	private String caretaker_code;
	
	
	public MatchVO() {
		System.out.println("MatchVO");
	}

	
	/**
	 * @return the totalSalary
	 */
	public int getTotalSalary() {
		return totalSalary;
	}


	/**
	 * @param totalSalary the totalSalary to set
	 */
	public void setTotalSalary(int totalSalary) {
		this.totalSalary = totalSalary;
	}


	/**
	 * @return the match_id
	 */
	public String getMatch_id() {
		return match_id;
	}

	/**
	 * @param match_id the match_id to set
	 */
	public void setMatch_id(String match_id) {
		this.match_id = match_id;
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
	 * @return the g_id
	 */
	public String getG_id() {
		return g_id;
	}

	/**
	 * @param g_id the g_id to set
	 */
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	/**
	 * @return the match_status
	 */
	public String getMatch_status() {
		return match_status;
	}

	/**
	 * @param match_status the match_status to set
	 */
	public void setMatch_status(String match_status) {
		this.match_status = match_status;
	}

	/**
	 * @return the hourwage
	 */
	public String getHourwage() {
		return hourwage;
	}

	/**
	 * @param hourwage the hourwage to set
	 */
	public void setHourwage(String hourwage) {
		this.hourwage = hourwage;
	}

	/**
	 * @return the t_gender
	 */
	public String getT_gender() {
		return t_gender;
	}

	/**
	 * @param t_gender the t_gender to set
	 */
	public void setT_gender(String t_gender) {
		this.t_gender = t_gender;
	}

	/**
	 * @return the t_age
	 */
	public String getT_age() {
		return t_age;
	}

	/**
	 * @param t_age the t_age to set
	 */
	public void setT_age(String t_age) {
		this.t_age = t_age;
	}

	/**
	 * @return the addr
	 */
	public String getAddr() {
		return addr;
	}

	/**
	 * @param addr the addr to set
	 */
	public void setAddr(String addr) {
		this.addr = addr;
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
	
	
	
}
