package project.DTO;

public class IssueDTO extends ProjectroomDTO {
	private int is_num;
	private String id;
	private String issue_id;
	private int pj_num;
	private String is_content;
	private String is_date;
	
	public int getIs_num() {
		return is_num;
	}
	public void setIs_num(int is_num) {
		this.is_num = is_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(String issue_id) {
		this.issue_id = issue_id;
	}
	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	public String getIs_content() {
		return is_content;
	}
	public void setIs_content(String is_content) {
		this.is_content = is_content;
	}
	public String getIs_date() {
		return is_date;
	}
	public void setIs_date(String is_date) {
		this.is_date = is_date;
	}
	
	
	public IssueDTO() {}
	

	public IssueDTO(String id, String issue_id, int pj_num, String is_content) {
		super();
		this.id = id;
		this.issue_id = issue_id;
		this.pj_num = pj_num;
		this.is_content = is_content;
	}
	
	@Override
	public String toString() {
		return "IssueDTO [is_num=" + is_num + ", id=" + id + ", issue_id=" + issue_id + ", pj_num=" + pj_num
				+ ", is_content=" + is_content + ", is_date=" + is_date + "]";
	}
	
}
