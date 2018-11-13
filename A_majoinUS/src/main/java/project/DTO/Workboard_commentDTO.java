package project.DTO;

public class Workboard_commentDTO {
	private int wc_num;
	private int pw_num;
	private String id;
	private String pw_date;
	private String wc_content;
	private String name;
	
	public int getWc_num() {
		return wc_num;
	}
	public void setWc_num(int wc_num) {
		this.wc_num = wc_num;
	}
	public int getPw_num() {
		return pw_num;
	}
	public void setPw_num(int pw_num) {
		this.pw_num = pw_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw_date() {
		return pw_date;
	}
	public void setPw_date(String pw_date) {
		this.pw_date = pw_date;
	}
	public String getWc_content() {
		return wc_content;
	}
	public void setWc_content(String wc_content) {
		this.wc_content = wc_content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Workboard_commentDTO [wc_num=" + wc_num + ", pw_num=" + pw_num + ", id=" + id + ", pw_date=" + pw_date
				+ ", wc_content=" + wc_content + ", name=" + name + "]";
	}
	
}
