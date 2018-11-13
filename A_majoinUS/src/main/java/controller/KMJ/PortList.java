package controller.KMJ;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PortList {
	List<PortimgDTO> portList;
	

	public List<PortimgDTO> getPortList() {
		return portList;
	}

	public void setPortList(List<PortimgDTO> portList) {
		this.portList = portList;
	}

	@Override
	public String toString() {
		return "PortList [portList=" + portList + "]";
	}      
}
