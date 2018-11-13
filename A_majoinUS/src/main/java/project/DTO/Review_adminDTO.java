package project.DTO;

public class Review_adminDTO extends ProjectroomDTO {
	private int ra_num;
	private String id;
	private String ra_content;
	private int pj_num;
	
	public int getRa_num() {
		return ra_num;
	}
	public void setRa_num(int ra_num) {
		this.ra_num = ra_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRa_content() {
		return ra_content;
	}
	public void setRa_content(String ra_content) {
		this.ra_content = ra_content;
	}
	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	
	
}
