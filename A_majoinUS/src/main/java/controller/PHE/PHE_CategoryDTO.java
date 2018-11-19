package controller.PHE;

public class PHE_CategoryDTO {
	private int pjj_num;
	private int pjl_num;
	private int pj_num;
	private String category;
	
	
	public int getPjl_num() {
		return pjl_num;
	}
	public void setPjl_num(int pjl_num) {
		this.pjl_num = pjl_num;
	}
	public int getPjj_num() {
		return pjj_num;
	}
	public void setPjj_num(int pjj_num) {
		this.pjj_num = pjj_num;
	}
	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "PHE_CategoryDTO [pjj_num=" + pjj_num + ", pj_num=" + pj_num + ", category=" + category + "]";
	}
	
	
}
