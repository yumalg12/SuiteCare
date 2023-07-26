package member;

import java.sql.Date;

public class CaregiverVO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private String address;
	private String sms_yn; 
	private String email_yn;
	private String profile;
	private String representative;
	private String qualification;
	private String location;
	private Date signup_date;
	
	public CaregiverVO() {
		System.out.println("CaregiverVO 생성자 호출");
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSms_yn() {
		return sms_yn;
	}

	public void setSms_yn(String sms_yn) {
		this.sms_yn = sms_yn;
	}

	public String getEmail_yn() {
		return email_yn;
	}

	public void setEmail_yn(String email_yn) {
		this.email_yn = email_yn;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}
	
}
