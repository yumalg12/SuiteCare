package payment;

public class PayVO {
	private String m_id;
	private String m_phone;
	private String m_email;
	private String m_name;
	
	private String pay_method;
	private int amount;
	private int currentMile;
	private String merchant_uid;
	
	
	

	public PayVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PayVO(String m_id, String m_phone, String m_email, String pay_method, int amout, int currentMile,
			String merchant_uid, String m_name) {
		super();
		this.m_id = m_id;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.pay_method = pay_method;
		this.amount = amout;
		this.currentMile = currentMile;
		this.merchant_uid = merchant_uid;
		this.m_name = m_name;
	}

	public PayVO(int amount, String merchant_uid, String pay_method, String m_id) {

		this.amount = amount;
		this.merchant_uid = merchant_uid;
		this.pay_method = pay_method;
		this.m_id = m_id;
			
	}
	
	public PayVO(String m_name, String m_phone, String m_email, int currentMile) {
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.currentMile = currentMile;
		
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

	public int getCurrentMile() {	
		return currentMile;
	}

	public void setCurrentMile(int currentMile) {
		this.currentMile = currentMile;
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

}
