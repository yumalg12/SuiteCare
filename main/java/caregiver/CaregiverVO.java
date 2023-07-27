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
	private String g_representative;
	private String g_qualification;
	private String g_location;
	private Date g_signup_date;
	
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

	public String getG_representative() {
		return g_representative;
	}

	public void setG_representative(String g_representative) {
		this.g_representative = g_representative;
	}

	public String getG_qualification() {
		return g_qualification;
	}

	public void setG_qualification(String g_qualification) {
		this.g_qualification = g_qualification;
	}

	public String getG_location() {
		return g_location;
	}

	public void setG_location(String g_location) {
		this.g_location = g_location;
	}

	public Date getG_signup_date() {
		return g_signup_date;
	}

	public void setG_signup_date(Date g_signup_date) {
		this.g_signup_date = g_signup_date;
	}

}
