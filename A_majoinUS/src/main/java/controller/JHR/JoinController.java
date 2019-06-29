package controller.JHR;

import java.io.File;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.KMJ;
import interceptor.NoLoginCheck;
import net.sf.json.JSONObject;

@Controller // 해당 클래스가 controller임을 나타내기 위한 어노테이션
@RequestMapping("/aus") // 요청에 대해 어떤Controller,어떤 메소드가 처리할지를 맵핑하기위한 어노테이션
@NoLoginCheck
public class JoinController {

	@Autowired
	private JoinServiceImpl joinService;
	@Autowired
	private MailServiceImpl mailService;
	@Autowired
	private KMJ mj_dao;
	
	public void setJoinService(JoinServiceImpl joinService) {
		this.joinService = joinService;
	}

	public void setMailService(MailServiceImpl mailService) {
		this.mailService = mailService;
	}

	// 회원 가입 페이지
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist() {
		return "JHR/regist";
	}

	// 회원 가입 완료
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(MemberDTO dto, @RequestParam("file") MultipartFile file) throws Exception {
		if(!file.isEmpty()) {
		String path = "d://item//profile//";
		String f_name = file.getOriginalFilename();
		f_name = f_name.substring(0, f_name.indexOf("."));
		long now = System.currentTimeMillis();
		String new_name = now + "_" + f_name;
		File new_file = new File(path, new_name);
		try {
			file.transferTo(new_file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		dto.setU_img(new_name);
		}else {
			dto.setU_img("");
		}
		System.out.println(dto);
		joinService.register(dto);

		return "JHR/registMember";
	}

	/*// 카테고리
	@RequestMapping(value = "/first_List", method = RequestMethod.POST)
	public void first_List(HttpServletResponse resp) throws Exception {
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

	@RequestMapping(value = "/second_List", method = RequestMethod.POST)
	public void second_List(HttpServletResponse resp, @RequestParam(defaultValue = "0") int pageNum, String hint)
			throws Exception {
		System.out.println("[2] second_List실행");
		resp.setContentType("text/html;charset=utf-8");

		List<String> step2 = joinService.getLevel2(hint);
		JSONObject jso = new JSONObject();
		jso.put("list", step2);

		PrintWriter out = resp.getWriter();
		out.print(jso);
	}*/

	// 회원 가입 이메일 보내기
		@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
		@ResponseBody
		private void sendMail(HttpServletResponse resp, HttpSession session, @RequestParam("id") String id) throws Exception {
			resp.setContentType("text/html;charset=utf-8");
			JSONObject jso = new JSONObject();
			PrintWriter out =null;
			//실례합니다
			int count = mj_dao.idconfirm(id);
			if(count >0) {
				jso.put("string",  "다른사람이 사용중인 이메일입니다.");

				out = resp.getWriter();
				out.print(jso);
			}else {
			
			int randomCode = new Random().nextInt(10000) + 10000;
			String joinCode = String.valueOf(randomCode);
			session.setAttribute("joinCode", joinCode);

			String subject = "AMAJOINUS 회원가입 승인 번호 입니다";
			StringBuilder sb = new StringBuilder();
			sb.append("환영합니다. 회원님의 회원가입 승인번호는 ").append(joinCode).append("입니다");   
			mailService.send(subject, sb.toString(), "gpflswkd89@gmail.com", id);        
			jso.put("string",  "입력하신 이메일로 인증번호를 보냈습니다. 메일을 확인해주세요");
			jso.put("emailcode",  randomCode);
			out = resp.getWriter();
			out.print(jso); 
			}
		}

	// 찾기
	@RequestMapping("/findMain")
	public String findMain() {
		return "JHR/findMain";
	}

	// ID 찾기
	@RequestMapping(value = "/findId")
	public void findId(HttpServletResponse response, @RequestParam("name") String name,
			@RequestParam("phone") String phone, Model md) throws Exception {
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
		public String find_pw_Mail(HttpServletResponse resp, HttpSession session, @RequestParam("id") String id, @RequestParam("name") String name) {
			resp.setContentType("text/html;charset=utf-8");
			MemberDTO getdto = new MemberDTO();
			getdto.setId(id);
			getdto.setName(name);
			MemberDTO dto = joinService.findPw(getdto);
			if (dto != null) {
				if (!dto.getName().equals(name)) {
					return "no matched";
				}
				int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
				String password = String.valueOf(ran);
				joinService.memberUpdate(dto.getId(), "password", password); // 해당 유저의 DB정보 변경

				String subject = "AMAJOINUS 임시 비밀번호 발급 안내 입니다.";
				String content = "귀하의 임시 비밀번호는 "+ password + " 입니다.";
				mailService.send(subject, content, "gpflswkd89@gmail.com", id);
				return "success";
			} else {
				return "no matched";
				
			}
		}
}
