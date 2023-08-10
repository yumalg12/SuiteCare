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
	private String t_height;
	private String t_weight;
	private String diagnosis;
	private String consciousness;
	private String care_meal_yn;
	private String care_toilet;
	private String state_paralysis;
	private String state_mobility;
	private String bedsore_yn;
	private String suction_yn;
	private String outpatient_yn;
	private String care_night_yn;
	private String notice;
	

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

	public String getT_height() {
		return t_height;
	}

	public void setT_height(String t_height) {
		this.t_height = t_height;
	}

	public String getT_weight() {
		return t_weight;
	}

	public void setT_weight(String t_weight) {
		this.t_weight = t_weight;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public String getConsciousness() {
		return consciousness;
	}

	public void setConsciousness(String consciousness) {
		this.consciousness = consciousness;
	}

	public String getCare_meal_yn() {
		return care_meal_yn;
	}

	public void setCare_meal_yn(String care_meal_yn) {
		this.care_meal_yn = care_meal_yn;
	}

	public String getCare_toilet() {
		return care_toilet;
	}

	public void setCare_toilet(String care_toilet) {
		this.care_toilet = care_toilet;
	}

	public String getState_paralysis() {
		return state_paralysis;
	}

	public void setState_paralysis(String state_paralysis) {
		this.state_paralysis = state_paralysis;
	}

	public String getState_mobility() {
		return state_mobility;
	}

	public void setState_mobility(String state_mobility) {
		this.state_mobility = state_mobility;
	}

	public String getBedsore_yn() {
		return bedsore_yn;
	}

	public void setBedsore_yn(String bedsore_yn) {
		this.bedsore_yn = bedsore_yn;
	}

	public String getSuction_yn() {
		return suction_yn;
	}

	public void setSuction_yn(String suction_yn) {
		this.suction_yn = suction_yn;
	}

	public String getOutpatient_yn() {
		return outpatient_yn;
	}

	public void setOutpatient_yn(String outpatient_yn) {
		this.outpatient_yn = outpatient_yn;
	}

	public String getCare_night_yn() {
		return care_night_yn;
	}

	public void setCare_night_yn(String care_night_yn) {
		this.care_night_yn = care_night_yn;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

}
