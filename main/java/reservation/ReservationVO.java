package reservation;

public class ReservationVO {
	private String m_id;
	private String caretaker_code;
	private String caregiver_id;
	private String res_code;
	private String merchant_uid;
	private String res_date;
	private String location;
	private String addr;
	private String detail_addr;
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
	
	private String start_date;
	private String end_date;
	private String start_time;
	private String end_time;
	
	private String t_name;
	private int t_age;
	private int t_height;
	private int t_weight;
	private String t_gender;
	private String diagnosis;
	
	public ReservationVO() {
		System.out.println("ReservationVO 생성자 호출");
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
	 * @return the caretaker_code
	 */
	public String getCaretaker_code() {
		return caretaker_code;
	}


	/**
	 * @param caretaker_code the caretaker_code to set
	 */
	public void setCaretaker_code(String caretaker_code) {
		this.caretaker_code = caretaker_code;
	}


	/**
	 * @return the caragiver_id
	 */
	public String getCaregiver_id() {
		return caregiver_id;
	}

	/**
	 * @param caragiver_id the caragiver_id to set
	 */
	public void setCaregiver_id(String caregiver_id) {
		this.caregiver_id = caregiver_id;
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


	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}


	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}


	/**
	 * @return the addr
	 */
	public String getAddr() {
		return addr;
	}


	/**
	 * @param addr the addr to set
	 */
	public void setAddr(String addr) {
		this.addr = addr;
	}


	/**
	 * @return the detail_addr
	 */
	public String getDetail_addr() {
		return detail_addr;
	}


	/**
	 * @param detail_addr the detail_addr to set
	 */
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}


	/**
	 * @return the consciousness
	 */
	public String getConsciousness() {
		return consciousness;
	}


	/**
	 * @param consciousness the consciousness to set
	 */
	public void setConsciousness(String consciousness) {
		this.consciousness = consciousness;
	}


	/**
	 * @return the care_meal_yn
	 */
	public String getCare_meal_yn() {
		return care_meal_yn;
	}


	/**
	 * @param care_meal_yn the care_meal_yn to set
	 */
	public void setCare_meal_yn(String care_meal_yn) {
		this.care_meal_yn = care_meal_yn;
	}


	/**
	 * @return the care_toilet
	 */
	public String getCare_toilet() {
		return care_toilet;
	}


	/**
	 * @param care_toilet the care_toilet to set
	 */
	public void setCare_toilet(String care_toilet) {
		this.care_toilet = care_toilet;
	}


	/**
	 * @return the state_paralysis
	 */
	public String getState_paralysis() {
		return state_paralysis;
	}


	/**
	 * @param state_paralysis the state_paralysis to set
	 */
	public void setState_paralysis(String state_paralysis) {
		this.state_paralysis = state_paralysis;
	}


	/**
	 * @return the state_mobility
	 */
	public String getState_mobility() {
		return state_mobility;
	}


	/**
	 * @param state_mobility the state_mobility to set
	 */
	public void setState_mobility(String state_mobility) {
		this.state_mobility = state_mobility;
	}


	/**
	 * @return the bedsore_yn
	 */
	public String getBedsore_yn() {
		return bedsore_yn;
	}


	/**
	 * @param bedsore_yn the bedsore_yn to set
	 */
	public void setBedsore_yn(String bedsore_yn) {
		this.bedsore_yn = bedsore_yn;
	}


	/**
	 * @return the suction_yn
	 */
	public String getSuction_yn() {
		return suction_yn;
	}


	/**
	 * @param suction_yn the suction_yn to set
	 */
	public void setSuction_yn(String suction_yn) {
		this.suction_yn = suction_yn;
	}


	/**
	 * @return the outpatient_yn
	 */
	public String getOutpatient_yn() {
		return outpatient_yn;
	}


	/**
	 * @param outpatient_yn the outpatient_yn to set
	 */
	public void setOutpatient_yn(String outpatient_yn) {
		this.outpatient_yn = outpatient_yn;
	}


	/**
	 * @return the care_night_yn
	 */
	public String getCare_night_yn() {
		return care_night_yn;
	}


	/**
	 * @param care_night_yn the care_night_yn to set
	 */
	public void setCare_night_yn(String care_night_yn) {
		this.care_night_yn = care_night_yn;
	}


	/**
	 * @return the notice
	 */
	public String getNotice() {
		return notice;
	}


	/**
	 * @param notice the notice to set
	 */
	public void setNotice(String notice) {
		this.notice = notice;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public String getStart_time() {
		return start_time;
	}


	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}


	public String getEnd_time() {
		return end_time;
	}


	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}


	public String getT_name() {
		return t_name;
	}


	public void setT_name(String t_name) {
		this.t_name = t_name;
	}


	public int getT_age() {
		return t_age;
	}


	public void setT_age(int t_age) {
		this.t_age = t_age;
	}


	public int getT_height() {
		return t_height;
	}


	public void setT_height(int t_height) {
		this.t_height = t_height;
	}


	public int getT_weight() {
		return t_weight;
	}


	public void setT_weight(int t_weight) {
		this.t_weight = t_weight;
	}


	public String getT_gender() {
		return t_gender;
	}


	public void setT_gender(String t_gender) {
		this.t_gender = t_gender;
	}


	public String getDiagnosis() {
		return diagnosis;
	}


	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	
	
}
