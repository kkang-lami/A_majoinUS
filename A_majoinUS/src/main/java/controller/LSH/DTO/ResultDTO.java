package controller.LSH.DTO;

public class ResultDTO {

	private String id;
	private String name;
	private String u_img;
	private String f_loc ="선호지역이 없습니다";
	private String f_cate ="관심직군이 없습니다";;
	private double eval;
	private String joindate;
	private int mem_view;
	 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getU_img() {
		return u_img;
	}
	public void setU_img(String u_img) {
		this.u_img = u_img;
	}
	public String getF_loc() {
		return f_loc;
	}
	public void setF_loc(String f_loc) {
		this.f_loc = f_loc;
	}
	public String getF_cate() {
		return f_cate;
	}
	public void setF_cate(String f_cate) {
		this.f_cate = f_cate;
	}
	public double getEval() {
		return eval;
	}
	public void setEval(double eval) {
		this.eval = eval;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate.split(" ")[0];
	}
	public int getMem_view() {
		return mem_view;
	}
	public void setMem_view(int mem_view) {
		this.mem_view = mem_view;
	}

	@Override
	public String toString() {
		return "ResultDTO [id=" + id + ", name=" + name + ", u_img=" + u_img + ", f_loc=" + f_loc + ", f_cate=" + f_cate
				+ ", eval=" + eval + ", joindate=" + joindate + ", mem_view=" + mem_view + "]";
	}

}

