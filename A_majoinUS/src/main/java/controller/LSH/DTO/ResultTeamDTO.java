package controller.LSH.DTO;

public class ResultTeamDTO {

	private int pj_num;
	private String pj_loc ="선호지역이 없습니다";
	private String pj_cate ="관심직군이 없습니다";
	private String pj_name;
	private String name;
	private String id;
	private String start_d;
	private String end_d;
	private String regdate;
	private int pj_view;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	public String getPj_loc() {
		return pj_loc;
	}
	public void setPj_loc(String pj_loc) {
		this.pj_loc = pj_loc;
	}
	public String getPj_cate() {
		return pj_cate;
	}
	public void setPj_cate(String pj_cate) {
		this.pj_cate = pj_cate;
	}
	public String getPj_name() {
		return pj_name;
	}
	public void setPj_name(String pj_name) {
		this.pj_name = pj_name;
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
		
		if(end_d.split("-")[0].equals("2099")) {
			this.end_d="무기한";
		}else {
			this.end_d = end_d.split(" ")[0];
		}
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate.split(" ")[0];
	}
	public int getPj_view() {
		return pj_view;
	}
	public void setPj_view(int pj_view) {
		this.pj_view = pj_view;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@Override
	public String toString() {
		return "ResultTeamDTO [pj_num=" + pj_num + ", pj_loc=" + pj_loc + ", pj_cate=" + pj_cate + ", pj_name="
				+ pj_name + ", name=" + name + ", id=" + id + ", start_d=" + start_d + ", end_d=" + end_d + ", regdate="
				+ regdate + ", pj_view=" + pj_view + "]";
	}

	
	


}

