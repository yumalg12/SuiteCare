package caregiver;

import java.sql.Date;

public class CaregiverVO {
	private String g_id;
	private String g_pw;
	private String g_name;
	private String g_gender;
	private String g_birth;
	private String g_phone;
	private String g_email;
	private String g_address;
	private String g_sms_yn; 
	private String g_email_yn;
	private String g_profile;
	private String g_service1;
	private String g_service2;
	private String g_service3;
	private String g_qualification;
	private String g_location1;
	private String g_location2;
	private String g_location3;
	private String g_hourwage1;
	private String g_hourwage2;
	private String g_hourwage3;
	private Date g_signup_date;
	private int g_current_mileage;
	
	public CaregiverVO() {
		System.out.println("CaregiverVO 생성자 호출");
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public String getG_pw() {
		return g_pw;
	}

	public void setG_pw(String g_pw) {
		this.g_pw = g_pw;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_gender() {
		return g_gender;
	}

	public void setG_gender(String g_gender) {
		this.g_gender = g_gender;
	}

	public String getG_birth() {
		return g_birth;
	}

	public void setG_birth(String g_birth) {
		this.g_birth = g_birth;
	}

	public String getG_phone() {
		return g_phone;
	}

	public void setG_phone(String g_phone) {
		this.g_phone = g_phone;
	}

	public String getG_email() {
		return g_email;
	}

	public void setG_email(String g_email) {
		this.g_email = g_email;
	}

	public String getG_address() {
		return g_address;
	}

	public void setG_address(String g_address) {
		this.g_address = g_address;
	}

	public String getG_sms_yn() {
		return g_sms_yn;
	}

	public void setG_sms_yn(String g_sms_yn) {
		this.g_sms_yn = g_sms_yn;
	}

	public String getG_email_yn() {
		return g_email_yn;
	}

	public void setG_email_yn(String g_email_yn) {
		this.g_email_yn = g_email_yn;
	}

	public String getG_profile() {
		return g_profile;
	}

	public void setG_profile(String g_profile) {
		this.g_profile = g_profile;
	}

	public String getG_service1() {
		return g_service1;
	}

	public void setG_service1(String g_service1) {
		this.g_service1 = g_service1;
	}

	public String getG_service2() {
		return g_service2;
	}

	public void setG_service2(String g_service2) {
		this.g_service2 = g_service2;
	}

	public String getG_service3() {
		return g_service3;
	}

	public void setG_service3(String g_service3) {
		this.g_service3 = g_service3;
	}

	public String getG_qualification() {
		return g_qualification;
	}

	public void setG_qualification(String g_qualification) {
		this.g_qualification = g_qualification;
	}

	public String getG_location1() {
		return g_location1;
	}

	public void setG_location1(String g_location1) {
		this.g_location1 = g_location1;
	}

	public String getG_location2() {
		return g_location2;
	}

	public void setG_location2(String g_location2) {
		this.g_location2 = g_location2;
	}

	public String getG_location3() {
		return g_location3;
	}

	public void setG_location3(String g_location3) {
		this.g_location3 = g_location3;
	}

	public String getG_hourwage1() {
		return g_hourwage1;
	}

	public void setG_hourwage1(String g_hourwage1) {
		this.g_hourwage1 = g_hourwage1;
	}

	public String getG_hourwage2() {
		return g_hourwage2;
	}

	public void setG_hourwage2(String g_hourwage2) {
		this.g_hourwage2 = g_hourwage2;
	}

	public String getG_hourwage3() {
		return g_hourwage3;
	}

	public void setG_hourwage3(String g_hourwage3) {
		this.g_hourwage3 = g_hourwage3;
	}

	public Date getG_signup_date() {
		return g_signup_date;
	}

	public void setG_signup_date(Date g_signup_date) {
		this.g_signup_date = g_signup_date;
	}

	public int getG_current_mileage() {
		return g_current_mileage;
	}

	public void setG_current_mileage(int g_current_mileage) {
		this.g_current_mileage = g_current_mileage;
	}
	
}
