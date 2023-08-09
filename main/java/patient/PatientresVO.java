package patient;

import java.sql.Date;
import java.sql.Time;


public class PatientresVO {
	private String caretaker;
	private Date startdate;
	private Date enddate;
	private Time starttime;
	private Time endtime;
	private String caregiver;
	private String res_code;
	private String caretaker_code;
	private String location;
	private String addr;
	private String detail_addr;
	
	public PatientresVO() {
		System.out.println("PatientresVO 생성자 호출");
	}

	

	/**
	 * @return the caretaker
	 */
	public String getCaretaker() {
		return caretaker;
	}



	/**
	 * @param caretaker the caretaker to set
	 */
	public void setCaretaker(String caretaker) {
		this.caretaker = caretaker;
	}



	/**
	 * @return the startdate
	 */
	public Date getStartdate() {
		return startdate;
	}



	/**
	 * @param startdate the startdate to set
	 */
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}



	/**
	 * @return the enddate
	 */
	public Date getEnddate() {
		return enddate;
	}



	/**
	 * @param enddate the enddate to set
	 */
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}



	/**
	 * @return the starttime
	 */
	public Time getStarttime() {
		return starttime;
	}



	/**
	 * @param starttime the starttime to set
	 */
	public void setStarttime(Time starttime) {
		this.starttime = starttime;
	}



	/**
	 * @return the endtime
	 */
	public Time getEndtime() {
		return endtime;
	}



	/**
	 * @param endtime the endtime to set
	 */
	public void setEndtime(Time endtime) {
		this.endtime = endtime;
	}



	/**
	 * @return the caregiver
	 */
	public String getCaregiver() {
		return caregiver;
	}



	/**
	 * @param caregiver the caregiver to set
	 */
	public void setCaregiver(String caregiver) {
		this.caregiver = caregiver;
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
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}



	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
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
	 * @return the detail_addr
	 */
	public String getDetail_addr() {
		return detail_addr;
	}



	/**
	 * @param detail_addr the detail_addr to set
	 */
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	
}
