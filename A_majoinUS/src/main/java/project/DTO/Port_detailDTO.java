package project.DTO;

public class Port_detailDTO extends PortfolioDTO{
	private int pd_num;
	private int port_num;
	private String pd_img;
	private String pd_content;
	
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	public int getPort_num() {
		return port_num;
	}
	public void setPort_num(int port_num) {
		this.port_num = port_num;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	@Override
	public String toString() {
		return "Port_detailDTO [pd_num=" + pd_num + ", port_num=" + port_num + ", pd_img=" + pd_img + ", pd_content="
				+ pd_content + "]";
	}
	

	
	
	
}
