package member;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private String sms_yn; 
	private String email_yn;
	private Date signup_date;
	
	
	public MemberVO() {
		System.out.println("PatientVO 생성자 호출");
	}


	public MemberVO(String id, String pw, String name, String gender, String phone, String email,
			String address, String sms_yn, String email_yn) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.sms_yn = sms_yn;
		this.email_yn = email_yn;
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


	public Date getSignup_date() {
		return signup_date;
	}
	
}
