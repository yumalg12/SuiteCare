package reservation;

public class PrelocationVO {
	private int sido_code;
	private String sido;
	
	public PrelocationVO() {
		System.out.println("PrelocationVO 생성자 호출");
	}

	/**
	 * @return the sido_code
	 */
	public int getSido_code() {
		return sido_code;
	}

	/**
	 * @param sido_code the sido_code to set
	 */
	public void setSido_code(int sido_code) {
		this.sido_code = sido_code;
	}

	/**
	 * @return the sido
	 */
	public String getSido() {
		return sido;
	}

	/**
	 * @param sido the sido to set
	 */
	public void setSido(String sido) {
		this.sido = sido;
	}
	
	
}
