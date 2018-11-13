package controller.KMJ;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/aus")
public class Test_Controller {
	
	@RequestMapping(value = "/sessionid1")
	public String id1(HttpSession session){
		session.setAttribute("id", "test.amajo@gmail.com");
		session.setAttribute("pjm_num", 6);
		return "KMJ/test";
	}
	@RequestMapping(value = "/sessionid2")
	public String id2(HttpSession session){
		session.setAttribute("id", "4@gmail.com");
		
		return "KMJ/test";
	}
	
	      
	@RequestMapping(value="/dateTest",method=RequestMethod.POST)
	public void check(@ModelAttribute("ed") String ed) {
		System.out.println(ed);
	}
	/*								 //파일명 받아오기위해 정의하는 변수명
	@RequestMapping(value = "/getImg/{imagePath}") 
    @ResponseBody //페이지 이동없이 로드
    public byte[] getImage(@PathVariable String imagePath) throws IOException { 
							//위에서 정의한 변수명을 갖고와서 사용
		String rpath = "D:\\item\\" + imagePath; //파일명의 전체 경로를 정의(그냥 문자열)
	    Path path = Paths.get(rpath); 			//정의한 경로(문자열)를 경로(절대경로)로 읽어들임
	    byte[] data = Files.readAllBytes(path);	//절대경로에있는 파일을 byte로 읽어온다
	   
	    return data; 
	     
	} */
}
