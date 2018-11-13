package controller.JHR;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.sf.json.JSONObject;

@Controller //해당 클래스가 controller임을 나타내기 위한 어노테이션
@RequestMapping("/aus/JHR")  //요청에 대해 어떤Controller,어떤 메소드가 처리할지를 맵핑하기위한 어노테이션
public class JoinController {
	
	
	@Autowired
	private JoinServiceImpl joinService;
	@Autowired
	private MailServiceImpl mailService;
	
	public void setJoinService(JoinServiceImpl joinService) {
		this.joinService = joinService;
	}

	public void setMailService(MailServiceImpl mailService) {
		this.mailService = mailService;
	}
	
	//main 페이지 test
    @RequestMapping(value="/Main")
    public void main() {
    }  
    //회원 가입 페이지
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String regist() {
		return "JHR/regist";
	}
	//회원 가입 완료 
    @RequestMapping(value="/register", method=RequestMethod.POST)
    public String register(MemberDTO dto,@RequestParam("file")MultipartFile file) throws Exception {
    	
    	System.out.println(file.getOriginalFilename());
    	
    	String path="D://item//profile//";
    	String f_name=file.getOriginalFilename();
    	f_name = f_name.substring(0, f_name.indexOf("."));
    	long now = System.currentTimeMillis();
    	String new_name=now+"_"+f_name;
    	File new_file = new File(path,new_name);
    	try {
    		file.transferTo(new_file);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	dto.setU_img(new_name);
    	System.out.println("==============join controller in==============="+dto);
    	System.out.println("controller1");
    	joinService.register(dto);
    	System.out.println("controller2");
    
        return "JHR/registMember";
    } 
    //카테고리
    @RequestMapping(value="/first_List",method=RequestMethod.POST)
	public void first_List(HttpServletResponse resp) throws Exception{
		System.out.println("[1] first_List실행");
		resp.setContentType("text/html;charset=utf-8");
		
		List<String> job_list = joinService.getLevel1("직군");
		List<String> local_list = joinService.getLevel1("지역");
		
		JSONObject jso = new JSONObject();
		jso.put("job_list", job_list);
		jso.put("local_list", local_list);
		
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	@RequestMapping(value="/second_List",method=RequestMethod.POST)
	public void second_List(HttpServletResponse resp,@RequestParam(defaultValue="0")int pageNum,String hint) throws Exception{
		System.out.println("[2] second_List실행");
		resp.setContentType("text/html;charset=utf-8");
		
		List<String> step2 = joinService.getLevel2(hint);
		JSONObject jso = new JSONObject();
		jso.put("list", step2);
		
		
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	//회원 가입 이메일 보내기
	@RequestMapping(value="/sendMail", method=RequestMethod.POST)
	@ResponseBody
	private void sendMail(HttpSession session, @RequestParam("id") String id){
		int randomCode = new Random().nextInt(1000) + 1000;
		String joinCode = String.valueOf(randomCode);
		session.setAttribute("joinCode",joinCode);

		String subject = "회원가입 승인 번호 입니다";
		StringBuilder sb = new StringBuilder();
		sb.append("회원가입 승인번호는 ").append(joinCode).append("입니다");
		
		mailService.send(subject, sb.toString(), "gpflswkd89@gmail.com",id);
		
		System.out.println("메일	보냇음");
	}
	
	//찾기
		@RequestMapping("/findMain")
		public String findMain() {
			return "JHR/findMain";
		}
		
		//ID 찾기
		@RequestMapping(value = "/findId")
		public void findId(HttpServletResponse response,@RequestParam("name")String name,@RequestParam("phone")String phone, Model md) throws Exception{
			//md.addAttribute("id", joinService.findId(dto));
			MemberDTO dto = new MemberDTO();
			dto.setName(name);
			dto.setPhone(phone);

			MemberDTO getId = joinService.findId(dto);
			
			JSONObject jso = new JSONObject();
			jso.put("id", getId.getId());
			PrintWriter out = response.getWriter();
			out.print(jso);
		}
		
		// 비밀번호 찾기
	    @RequestMapping(value = "/findMail", method = RequestMethod.POST)
	    @ResponseBody
	    public void find_pw_Mail(HttpSession session, @RequestParam("id") String id, @RequestParam("name") String name) {
	    	
	    	MemberDTO getdto = new MemberDTO();
	    	getdto.setId(id);
	    	getdto.setName(name);
	        MemberDTO dto = joinService.findPw(getdto);
	        if (dto != null) {
	            if (!dto.getName().equals(name)) {
	                //ra.addFlashAttribute("resultMsg", "입력하신 이름의 회원정보와 가입된 아이디가 일치하지 않습니다.");
	                //return "redirect:/JHR/findMain";
	            }
	            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
	            String password = String.valueOf(ran);
	            joinService.memberUpdate(dto.getId(), "password", password); // 해당 유저의 DB정보 변경
	 
	            String subject = "임시 비밀번호 발급 안내 입니다.";
	            StringBuilder sb = new StringBuilder();
	            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
	            mailService.send(subject, sb.toString(), "gpflswkd89@gmail.com", id);
	            //ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
	        } else {
	            //ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
	        }
	        //return "redirect:/JHR/findMain";
	    }
	    
}
 // 이메일 발송
 	/*@Override
 	public void send_mail(MemberDTO member) throws Exception {
 		// Mail Server 설정
 		String charSet = "utf-8";
 		String hostSMTP = "smtp.naver.com";
 		String hostSMTPid = "아이디";
 		String hostSMTPpwd = "비밀번호";

 		// 보내는 사람 EMail, 제목, 내용
 		String fromEmail = "gpflswkd89@naver.com";
 		String fromName = "Spring Homepage";
 		String subject = "내용";
 		String msg = "";

 		// 회원가입 메일 내용
 		subject = "Spring Homepage 회원가입 인증 메일입니다.";
 		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
 		msg += "<h3 style='color: blue;'>";
 		msg += member.getId() + "님 회원가입을 환영합니다.</h3>";
 		msg += "<div style='font-size: 130%'>";
 		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
 		msg += "<form method='post' action='http://localhost:8081/AMAJOINUS/aus/JHR/approval_member'>";
 		msg += "<input type='hidden' name='email' value='" + member.getId() + "'>";
 		msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
 		msg += "<input type='submit' value='인증'></form><br/></div>";

 		// 받는 사람 E-Mail 주소
 		String mail = member.getId();
 		try {
 			HtmlEmail email = new HtmlEmail();
 			email.setDebug(true);
 			email.setCharset(charSet);
 			email.setSSL(true);
 			email.setHostName(hostSMTP);
 			email.setSmtpPort(587);

 			email.setAuthentication(hostSMTPid, hostSMTPpwd);
 			email.setTLS(true);
 			email.addTo(mail, charSet);
 			email.setFrom(fromEmail, fromName, charSet);
 			email.setSubject(subject);
 			email.setHtmlMsg(msg);
 			email.send();
 		} catch (Exception e) {
 			System.out.println("메일발송 실패 : " + e);
 		}
 	}*/
    
