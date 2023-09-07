package review;

public class mReviewVO {
	private int review_num;
	private String m_id;
	public String res_code;
	private String g_id;
	private int re_kind;
	private int re_time;
	private int re_pro;
	private int re_speed;
	private int re_com;
	private int re_price;
	private String comment;

	
	public mReviewVO(String m_id, String res_code, String g_id,  int re_kind, int re_time, int re_pro, int re_speed, int re_com, int re_price, String comment){
		
		this.m_id=m_id;
		this.res_code=res_code;
		this.g_id=g_id;		
		this.re_kind = re_kind;
		this.re_time = re_time;
		this.re_pro = re_pro;
		this.re_speed = re_speed;
		this.re_com = re_com;
		this.re_price = re_price;
		this.comment = comment;

	}
	
	public mReviewVO(int re_kind, int re_time, int re_pro, int re_speed, int re_com, int re_price, String comment){
		
		this.re_kind = re_kind;
		this.re_time = re_time;
		this.re_pro = re_pro;
		this.re_speed = re_speed;
		this.re_com = re_com;
		this.re_price = re_price;
		this.comment = comment;

	}
	public mReviewVO() {
		System.out.println("mReviewVO 생성자 호출");
	}


	public int getReview_num() {
		return review_num;
	}


	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public String getRes_code() {
		return res_code;
	}


	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}


	public String getG_id() {
		return g_id;
	}


	public void setG_id(String g_id) {
		this.g_id = g_id;
	}


	public int getRe_kind() {
		return re_kind;
	}


	public void setRe_kind(int re_kind) {
		this.re_kind = re_kind;
	}


	public int getRe_time() {
		return re_time;
	}


	public void setRe_time(int re_time) {
		this.re_time = re_time;
	}


	public int getRe_pro() {
		return re_pro;
	}


	public void setRe_pro(int re_pro) {
		this.re_pro = re_pro;
	}


	public int getRe_speed() {
		return re_speed;
	}


	public void setRe_speed(int re_speed) {
		this.re_speed = re_speed;
	}

	
	public int getRe_com() {
		return re_com;
	}


	public void setRe_com(int re_com) {
		this.re_com = re_com;
	}


	public int getRe_price() {
		return re_price;
	}


	public void setRe_price(int re_price) {
		this.re_price = re_price;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}

	
	
}
