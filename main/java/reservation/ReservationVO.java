package reservation;

public class ReservationVO {
	private String patient_id;
	private String patient_code;
	private String caragiver_id;
	private String res_code;
	private String merchant_uid;
	private String res_date;
	
	public ReservationVO() {
		System.out.println("ReservationVO 생성자 호출");
	}

	

	/**
	 * @return the patient_id
	 */
	public String getPatient_id() {
		return patient_id;
	}



	/**
	 * @param patient_id the patient_id to set
	 */
	public void setPatient_id(String patient_id) {
		this.patient_id = patient_id;
	}



	/**
	 * @return the patient_code
	 */
	public String getPatient_code() {
		return patient_code;
	}

	/**
	 * @param patient_code the patient_code to set
	 */
	public void setPatient_code(String patient_code) {
		this.patient_code = patient_code;
	}

	/**
	 * @return the caragiver_id
	 */
	public String getCaragiver_id() {
		return caragiver_id;
	}

	/**
	 * @param caragiver_id the caragiver_id to set
	 */
	public void setCaragiver_id(String caragiver_id) {
		this.caragiver_id = caragiver_id;
	}

	/**
	 * @return the res_code
	 */
	public String getRes_code() {
		return res_code;
	}

	/**
	 * @param res_code the res_code to set
	 */
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	/**
	 * @return the merchant_uid
	 */
	public String getMerchant_uid() {
		return merchant_uid;
	}

	/**
	 * @param merchant_uid the merchant_uid to set
	 */
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	/**
	 * @return the res_date
	 */
	public String getRes_date() {
		return res_date;
	}

	/**
	 * @param res_date the res_date to set
	 */
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	
	
}
