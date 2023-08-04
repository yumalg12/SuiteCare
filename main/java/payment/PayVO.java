package payment;

public class PayVO {
  private String m_id;
  private String m_phone;
  private String m_eamil;
  
  private String pay_method;
  private String amount;
  private String scPoint;
  private String merchant_uid;

  
  
  public PayVO(String m_id, String m_phone, String m_eamil, String pay_method, String amout, String scPoint,
		String merchant_uid) {
	super();
	this.m_id = m_id;
	this.m_phone = m_phone;
	this.m_eamil = m_eamil;
	this.pay_method = pay_method;
	this.amount = amout;
	this.scPoint = scPoint;
	this.merchant_uid = merchant_uid;
}
  public PayVO(String amount, String merchant_uid, String pay_method, String m_id) {
		
		this.amount = amount;
		this.merchant_uid = merchant_uid;
		this.pay_method = pay_method;
		this.m_id = m_id;
	}
public String getM_id() {
	return m_id;
}
public void setM_id(String m_id) {
	this.m_id = m_id;
}
public String getM_phone() {
	return m_phone;
}
public void setM_phone(String m_phone) {
	this.m_phone = m_phone;
}
public String getM_eamil() {
	return m_eamil;
}
public void setM_eamil(String m_eamil) {
	this.m_eamil = m_eamil;
}
public String getPay_method() {
	return pay_method;
}
public void setPay_method(String pay_method) {
	this.pay_method = pay_method;
}
public String getAmout() {
	return amount;
}
public void setAmout(String amout) {
	this.amount = amout;
}
public String getScPoint() {
	return scPoint;
}
public void setScPoint(String scPoint) {
	this.scPoint = scPoint;
}
public String getMerchant_uid() {
	return merchant_uid;
}
public void setMerchant_uid(String merchant_uid) {
	this.merchant_uid = merchant_uid;
}
 
}
