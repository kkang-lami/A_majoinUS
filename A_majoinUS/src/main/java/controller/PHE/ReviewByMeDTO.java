package controller.PHE;

public class ReviewByMeDTO {

	private String name;
	private String pj_name;
	private String review_content;
	private int score;
	private int pj_num;
	
	public int getScore() {
		return score;
	}
	public int getPj_num() {
		return pj_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPj_name() {
		return pj_name;
	}
	public void setPj_name(String pj_name) {
		this.pj_name = pj_name;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

}
