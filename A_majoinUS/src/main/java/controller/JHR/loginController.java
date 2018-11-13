package controller.JHR;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/aus/JHR")
public class loginController {
	
	@Autowired
	private loginServiceImpl service;
	
	//로그인 페이지
	@RequestMapping("/loginMain")
	public String login() {
		return "JHR/loginMain";
	}
	//로그인 확인
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute MemberDTO dto, HttpSession session) {
		
		boolean result = service.loginCheck(dto,session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("JHR/Main");
			mav.addObject("msg","success");
			session.setAttribute("id", dto.getId());
		}else {
			mav.setViewName("JHR/loginMain");
			mav.addObject("msg","failure");
		}
		return mav;
	}
	//로그 아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JHR/loginMain");
		mav.addObject("msg","logout");
		return mav;
	}
	
	//회원 정보 페이지
	@RequestMapping(value="/mypage")
	public String mypage(HttpServletRequest req,Model model, MemberDTO dto, @RequestParam("file_my")MultipartFile file){
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
		String id = req.getSession().getAttribute("id").toString();
		
		System.out.println("로그인아이디:: "+id);
		
		MemberDTO dto1 = service.mypage(id);
		model.addAttribute("dto", dto1);
		return "JHR/mypage";
	}
	//회원 정보 업데이트
	@RequestMapping(value="/memberUpdate")
    public String memberUpdate(MemberDTO dto){
        String alert= "<script>alert('";
        alert += service.memberUpdate(dto) ?  "수정이 완료되었습니다." : "수정 실패!";
        alert += "'); location.href='mypage?id="+dto.getId()+"';</script>";
        return alert;
	}
	//카테고리
    @RequestMapping(value="/my_first_List",method=RequestMethod.POST)
	public void my_first_List(HttpServletResponse resp) throws Exception{
		System.out.println("[1]my_ first_List실행");
		resp.setContentType("text/html;charset=utf-8");
		
		List<String> job_list = service.getLevel1("직군");
		List<String> local_list = service.getLevel1("지역");
		
		JSONObject jso = new JSONObject();
		jso.put("job_list", job_list);
		jso.put("local_list", local_list);
		
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	
	@RequestMapping(value="/my_second_List",method=RequestMethod.POST)
	public void my_second_List(HttpServletResponse resp,@RequestParam(defaultValue="0")int pageNum,String hint) throws Exception{
		System.out.println("[2]my_ second_List실행");
		resp.setContentType("text/html;charset=utf-8");
		
		List<String> step2 = service.getLevel2(hint);
		JSONObject jso = new JSONObject();
		jso.put("list", step2);
		
		
		PrintWriter out = resp.getWriter();
		out.print(jso);
	}
	//탈퇴 페이지
		@RequestMapping("/secession")
		public String secession(){
			return "JHR/secession"; 

		}
	//회원 탈퇴
		@RequestMapping(value="/secessionpro")
		public String deleteSecession(@RequestParam("pwd")String password, Model model, HttpSession  session) {
			
			String id = (String)session.getAttribute("id");
			
			// 비밀번호 체크
	        boolean result = service.checkPw(id,password);
	        if(result){ // 비밀번호가 맞다면 삭제 처리
	            service.deleteSecession(id);
	        	session.invalidate(); //탈퇴시 로그아웃 처리     
	        	return "/JHR/loginMain";
	        } else { // 비밀번호가 일치하지 않는다면
	            return "JHR/secession";
	        
	     }
	}
}

		

	

