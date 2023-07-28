package reservation;

public class CaretakerinfoVO {
	private String m_id;
	private String t_name;
	private String t_code;
	private int t_age;
	private int t_height;
	private int t_weight;
	private String t_gender;
	private String diagnosis;
	
	
	public CaretakerinfoVO() {
		System.out.println("CaretakerinfoVO 생성자 호출");
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
	 * @return the t_name
	 */
	public String getT_name() {
		return t_name;
	}


	/**
	 * @param t_name the t_name to set
	 */
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}


	/**
	 * @return the t_code
	 */
	public String getT_code() {
		return t_code;
	}


	/**
	 * @param t_code the t_code to set
	 */
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}


	/**
	 * @return the t_age
	 */
	public int getT_age() {
		return t_age;
	}


	/**
	 * @param t_age the t_age to set
	 */
	public void setT_age(int t_age) {
		this.t_age = t_age;
	}


	/**
	 * @return the t_height
	 */
	public int getT_height() {
		return t_height;
	}


	/**
	 * @param t_height the t_height to set
	 */
	public void setT_height(int t_height) {
		this.t_height = t_height;
	}


	/**
	 * @return the t_weight
	 */
	public int getT_weight() {
		return t_weight;
	}


	/**
	 * @param t_weight the t_weight to set
	 */
	public void setT_weight(int t_weight) {
		this.t_weight = t_weight;
	}


	/**
	 * @return the t_gender
	 */
	public String getT_gender() {
		return t_gender;
	}


	/**
	 * @param t_gender the t_gender to set
	 */
	public void setT_gender(String t_gender) {
		this.t_gender = t_gender;
	}


	/**
	 * @return the diagnosis
	 */
	public String getDiagnosis() {
		return diagnosis;
	}


	/**
	 * @param diagnosis the diagnosis to set
	 */
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}


	
}

