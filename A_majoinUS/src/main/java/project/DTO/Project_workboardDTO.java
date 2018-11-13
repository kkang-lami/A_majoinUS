package project.DTO;

public class Project_workboardDTO {
	private int pw_num;
	private int pj_num;
	private String w_subject;
	private String id;
	private String w_content;
	private String w_date;
	private String state;
	private String name;
	private int pjm_num;
	
	public int getPjm_num() {
		return pjm_num;
	}
	public void setPjm_num(int pjm_num) {
		this.pjm_num = pjm_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPw_num() {
		return pw_num;
	}
	public void setPw_num(int pw_num) {
		this.pw_num = pw_num;
	}
	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	public String getW_subject() {
		return w_subject;
	}
	public void setW_subject(String w_subject) {
		this.w_subject = w_subject;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getW_content() {
		return w_content;
	}
	public void setW_content(String w_content) {
		this.w_content = w_content;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
