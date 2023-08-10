package patient;
import java.sql.Date;
import java.sql.Time;
public class PatientresVO {
	private String caretaker;
	private String t_gender;
	private String t_age;
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
	public String getCaretaker() {
		return caretaker;
	}
	public void setCaretaker(String caretaker) {
		this.caretaker = caretaker;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public Time getStarttime() {
		return starttime;
	}
	public void setStarttime(Time starttime) {
		this.starttime = starttime;
	}
	public Time getEndtime() {
		return endtime;
	}
	public void setEndtime(Time endtime) {
		this.endtime = endtime;
	}
	public String getCaregiver() {
		return caregiver;
	}
	public void setCaregiver(String caregiver) {
		this.caregiver = caregiver;
	}
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}
	public String getCaretaker_code() {
		return caretaker_code;
	}
	public void setCaretaker_code(String caretaker_code) {
		this.caretaker_code = caretaker_code;
	}
	public String getT_gender() {
		return t_gender;
	}
	public void setT_gender(String t_gender) {
		this.t_gender = t_gender;
	}
	public String getT_age() {
		return t_age;
	}
	public void setT_age(String t_age) {
		this.t_age = t_age;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
}