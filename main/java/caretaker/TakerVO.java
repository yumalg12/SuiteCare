package caretaker;

import java.sql.Date;

public class TakerVO {
	
	private int tcode;
	private String tname;
	private String tgender;
	private String tage;
	private String theight;
	private String tweight;
	private String diagnosis;
	
	
	public TakerVO() {
		System.out.println("TakerVO 생성자 호출");
	}

	/**
	 * @return the tcode
	 */
	public int getTcode() {
		return tcode;
	}


	/**
	 * @param tname the tcode to set
	 */
	public void setTcode(int tcode) {
		this.tcode = tcode;
	}

	
	/**
	 * @return the tname
	 */
	public String getTname() {
		return tname;
	}


	/**
	 * @param tname the tname to set
	 */
	public void setTname(String tname) {
		this.tname = tname;
	}


	/**
	 * @return the tgender
	 */
	public String getTgender() {
		return tgender;
	}


	/**
	 * @param tgender the tgender to set
	 */
	public void setTgender(String tgender) {
		this.tgender = tgender;
	}


	/**
	 * @return the tage
	 */
	public String getTage() {
		return tage;
	}


	/**
	 * @param tage the tage to set
	 */
	public void setTage(String tage) {
		this.tage = tage;
	}


	/**
	 * @return the theight
	 */
	public String getTheight() {
		return theight;
	}


	/**
	 * @param theight the theight to set
	 */
	public void setTheight(String theight) {
		this.theight = theight;
	}


	/**
	 * @return the tweight
	 */
	public String getTweight() {
		return tweight;
	}


	/**
	 * @param tweight the tweight to set
	 */
	public void setTweight(String tweight) {
		this.tweight = tweight;
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
