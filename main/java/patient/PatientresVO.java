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

	
}
