package project.DTO;

public class ProjectroomDTO {
	private int pj_num;
	private String pj_name;
	private String id;
	private String start_d;
	private String end_d;
	private String regdate;
	private int mem_limit;
	private String pj_info;
	private int pj_view;
	
	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	public String getPj_name() {
		return pj_name;
	}
	public void setPj_name(String pj_name) {
		this.pj_name = pj_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStart_d() {
		return start_d;
	}
	public void setStart_d(String start_d) {
		this.start_d = start_d.split(" ")[0];
	}
	public String getEnd_d() {
		return end_d;
	}
	public void setEnd_d(String end_d) {
		this.end_d = end_d.split(" ")[0];
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getMem_limit() {
		return mem_limit;
	}
	public void setMem_limit(int mem_limit) {
		this.mem_limit = mem_limit;
	}
	public String getPj_info() {
		return pj_info;
	}
	public void setPj_info(String pj_info) {
		this.pj_info = pj_info;
	}
	public int getPj_view() {
		return pj_view;
	}
	public void setPj_view(int pj_view) {
		this.pj_view = pj_view;
	}
	@Override
	public String toString() {
		return "ProjectroomDTO [pj_num=" + pj_num + ", pj_name=" + pj_name + ", id=" + id + ", start_d=" + start_d
				+ ", end_d=" + end_d + ", regdate=" + regdate + ", mem_limit=" + mem_limit + ", pj_info=" + pj_info
				+ ", pj_view=" + pj_view + "]";
	}
	
}

