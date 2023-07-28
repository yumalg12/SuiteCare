package member;

import java.sql.Date;

public class MemberVO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_gender;
	private String m_phone;
	private String m_email;
	private String m_address;
	private String m_sms_yn; 
	private String m_email_yn;
	private Date m_signup_date;
	
	
	public MemberVO() {
		System.out.println("MemberVO 생성자 호출");
	}


	public MemberVO(String m_id, String m_pw, String m_name, String m_gender, String m_phone, String m_email,
			String m_address, String m_sms_yn, String m_email_yn) {
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_address = m_address;
		this.m_sms_yn = m_sms_yn;
		this.m_email_yn = m_email_yn;
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
	 * @return the m_pw
	 */
	public String getM_pw() {
		return m_pw;
	}


	/**
	 * @param m_pw the m_pw to set
	 */
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}


	/**
	 * @return the m_name
	 */
	public String getM_name() {
		return m_name;
	}


	/**
	 * @param m_name the m_name to set
	 */
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	/**
	 * @return the m_gender
	 */
	public String getM_gender() {
		return m_gender;
	}


	/**
	 * @param m_gender the m_gender to set
	 */
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}


	/**
	 * @return the m_phone
	 */
	public String getM_phone() {
		return m_phone;
	}


	/**
	 * @param m_phone the m_phone to set
	 */
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}


	/**
	 * @return the m_email
	 */
	public String getM_email() {
		return m_email;
	}


	/**
	 * @param m_email the m_email to set
	 */
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}


	/**
	 * @return the m_address
	 */
	public String getM_address() {
		return m_address;
	}


	/**
	 * @param m_address the m_address to set
	 */
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}


	/**
	 * @return the m_sms_yn
	 */
	public String getM_sms_yn() {
		return m_sms_yn;
	}


	/**
	 * @param m_sms_yn the m_sms_yn to set
	 */
	public void setM_sms_yn(String m_sms_yn) {
		this.m_sms_yn = m_sms_yn;
	}


	/**
	 * @return the m_email_yn
	 */
	public String getM_email_yn() {
		return m_email_yn;
	}


	/**
	 * @param m_email_yn the m_email_yn to set
	 */
	public void setM_email_yn(String m_email_yn) {
		this.m_email_yn = m_email_yn;
	}


	
	
}
