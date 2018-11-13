package project.DTO;

public class PortfolioDTO {
	private int port_num;
	private String id;
	private String subject;
	private String tech_info;
	private String start_d;
	private String end_d;
	private String file_path;
	private String p_private;
	private int pj_num;
	
	public int getPort_num() {
		return port_num;
	}
	public void setPort_num(int port_num) {
		this.port_num = port_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTech_info() {
		return tech_info;
	}
	public void setTech_info(String tech_info) {
		this.tech_info = tech_info;
	}
	public String getStart_d() {
		return start_d;
	}
	public void setStart_d(String start_d) {
		this.start_d = start_d;
	}
	public String getEnd_d() {
		return end_d;
	}
	public void setEnd_d(String end_d) {
		this.end_d = end_d;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getP_private() {
		return p_private;
	}
	public void setP_private(String p_private) {
		this.p_private = p_private;
	}
	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	
	public PortfolioDTO() {}
	public PortfolioDTO(Object port_num, Object subject,Object start_d,Object end_d,Object p_private) {
		super();
		this.port_num = (int) port_num;
		this.subject = (String) subject;
		this.start_d = (String) start_d;
		this.end_d = (String) end_d;
		this.p_private = (String) p_private;
	}
	
	@Override
	public String toString() {
		return "PortfolioDTO [port_num=" + port_num + ", id=" + id + ", subject=" + subject + ", tech_info=" + tech_info
				+ ", start_d=" + start_d + ", end_d=" + end_d + ", file_path=" + file_path + ", p_private=" + p_private
				+ ", pj_num=" + pj_num + "]";
	}
	
	
}
