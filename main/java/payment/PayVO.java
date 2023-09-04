package payment;

public class PayVO {
	private String m_id;
	private String m_phone;
	private String m_email;
	private String m_name;
	
	private String pay_method;
	private int amount;
	private int m_current_mileage;
	private String merchant_uid;
	private int netMile;
	
	
	



	public PayVO() {
		super();
	}

	public PayVO(String m_id, String m_phone, String m_email, String pay_method, int amout, int m_current_mileage,
			String merchant_uid, String m_name) {
		super();
		this.m_id = m_id;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.pay_method = pay_method;
		this.amount = amout;
		this.m_current_mileage = m_current_mileage;
		this.merchant_uid = merchant_uid;
		this.m_name = m_name;
	}

	public PayVO(int amount, String pay_method, String m_id, String merchant_uid) {

		this.amount = amount;
		this.pay_method = pay_method;
		this.m_id = m_id;
		this.merchant_uid = merchant_uid;
			
	}
	
	public PayVO(String m_name, String m_phone, String m_email, int m_current_mileage) {
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_current_mileage = m_current_mileage;
		
	}
	
	

	public PayVO(String m_id, int netMile) {
		super();
		this.m_id = m_id;
		this.netMile = netMile;
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

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public int getAmout() {
		return amount;
	}

	public void setAmout(int amout) {
		this.amount = amout;
	}

	public int getM_current_mileage() {
		return m_current_mileage;
	}

	public void setM_current_mile(int m_current_mileage) {
		this.m_current_mileage = m_current_mileage;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	public int getNetMile() {
		return netMile;
	}

	public void setNetMile(int netMile) {
		this.netMile = netMile;
	}

}
