package controller.KMJ;

import org.springframework.web.multipart.MultipartFile;

public class PortimgDTO {
	private MultipartFile pd_img;
	private String pd_content;
	
	public MultipartFile getPd_img() {
		return pd_img;
	}
	public void setPd_img(MultipartFile pd_img) {
		this.pd_img = pd_img;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	
}
