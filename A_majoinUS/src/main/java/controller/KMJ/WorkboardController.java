package controller.KMJ;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.*;

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

import dao.KMJ;
import net.sf.json.JSONObject;
import project.DTO.*;

@Controller
@RequestMapping("/aus/ProejctRoom/workboard")
public class WorkboardController {
	@Autowired
	private KMJ mj_dao;
	
	@ModelAttribute("workboardDTO")
	public Project_workboardDTO formBacking() {
		return new Project_workboardDTO();
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String boardlist(HttpSession session,@RequestParam("pj_num") int pj_num,Model m) {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "KMJ/error";
		}
		
		
		mj_dao.update_workstate(pj_num);
		
		List<Project_workboardDTO> board = mj_dao.workboard(pj_num);
		String master = mj_dao.searchMaster(pj_num);
		List<MemberWorkCountDTO> mwc = mj_dao.workcount(pj_num);
		List<Pj_memDTO> pmdto = mj_dao.selectMember(pj_num);
		
		for(Project_workboardDTO dto:board) {
			dto.setW_date(dto.getW_date().substring(0, dto.getW_date().indexOf(" ")));
		}
		
		m.addAttribute("pmdto",pmdto);
		m.addAttribute("mwc",mwc);
		m.addAttribute("board",board);
		m.addAttribute("master",master);
		m.addAttribute("pj_num",pj_num);
		
		return "KMJ/Workboard";
	}
	
	@RequestMapping(value="/Writework",method=RequestMethod.POST)
	public String Writework(HttpSession session,@ModelAttribute("editwork") Project_workboardDTO pdto) {
		int pjm_num = (int)session.getAttribute("pjm_num");
		pdto.setPjm_num(pjm_num);
		mj_dao.workboardwrite(pdto);
		return "redirect:/aus/ProejctRoom/workboard?pj_num="+pdto.getPj_num();
	}

	@RequestMapping(value="/memberwork", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody     
	public void Memberwork(HttpServletResponse resp,@RequestParam("id")String id,@RequestParam("pj_num")int pj_num) throws Exception {
		resp.setContentType("text/html; charset=UTF-8");
		Project_workboardDTO pwdto = new Project_workboardDTO();
		pwdto.setId(id);
		pwdto.setPj_num(pj_num);
		
		List<Project_workboardDTO> board = mj_dao.workboard(pwdto);
		
		for(Project_workboardDTO dto:board) {
			dto.setW_date(dto.getW_date().substring(0, dto.getW_date().indexOf(" ")));
		}
		
		JSONObject jso = new JSONObject();
		jso.put("data", board);
		System.out.println(jso.toString());
		PrintWriter out = resp.getWriter();
		out.println(jso.toString());
	}
	
	
	@RequestMapping(value="/workdetail", method=RequestMethod.POST)
	@ResponseBody
	public void workdetail(HttpServletResponse resp, @RequestParam("pw_num")int pw_num) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		Project_workboardDTO pwdto = mj_dao.workdetail(pw_num);
		pwdto.setW_date(pwdto.getW_date().substring(0, pwdto.getW_date().indexOf(" ")));
		
		int count = mj_dao.commentCount(pw_num);
		List<Workboard_commentDTO> commentlist = mj_dao.commentList(pw_num);
		for(Workboard_commentDTO dto:commentlist) {
			dto.setPw_date(dto.getPw_date().substring(0, dto.getPw_date().indexOf(" ")));
		}
		
		
		JSONObject jso = new JSONObject();
		jso.put("detail", pwdto);
		jso.put("comment", commentlist);
		jso.put("count", count);
		System.out.println(jso.toString());
		PrintWriter out = resp.getWriter();
		out.println(jso.toString());
	}        
	
	@RequestMapping(value="/completstate", method=RequestMethod.GET)
	public String completState(@RequestParam("pw_num")int pw_num, @RequestParam("pj_num")int pj_num) {
		
		mj_dao.completstate(pw_num);
		
		return "redirect:/aus/ProejctRoom/workboard?pj_num="+pj_num;
	}
	
	
	@RequestMapping(value="/editwork",method=RequestMethod.POST)
	public String editWork(@ModelAttribute("editwork")Project_workboardDTO pwdto) {
		mj_dao.editwork(pwdto);
		return "redirect:/aus/ProejctRoom/workboard?pj_num="+pwdto.getPj_num();
	}
	
	@RequestMapping(value="/deletework",method=RequestMethod.GET)
	public String deleteWork(@RequestParam("pw_num")int pw_num, @RequestParam("pj_num")int pj_num) {
		mj_dao.deletework(pw_num);
		return "redirect:/aus/ProejctRoom/workboard?pj_num="+pj_num;
	}
	
	
	@RequestMapping(value="/writecomment",method=RequestMethod.POST)
	@ResponseBody
	public void writeComment(HttpSession session, HttpServletResponse resp, @RequestParam("pw_num")int pw_num, @RequestParam("comment")String wc_content,@RequestParam("count")int count) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		String id = (String) session.getAttribute("id");
		
		Workboard_commentDTO wcdto = new Workboard_commentDTO();
		wcdto.setId(id);
		wcdto.setPw_num(pw_num);
		wcdto.setWc_content(wc_content);
		
		mj_dao.insertComment(wcdto);
		
		Map<String,Integer> NEW = new HashMap<String,Integer>();
		NEW.put("pw_num", pw_num);
		NEW.put("count", count);
		
		System.out.println("count : "+count);
		
		Workboard_commentDTO newWC = mj_dao.getNewComment(NEW);
		
		System.out.println(newWC);
		
		newWC.setPw_date(newWC.getPw_date().substring(0, newWC.getPw_date().indexOf(" ")));
		
		JSONObject jso = new JSONObject();
		jso.put("newWC", newWC);
		System.out.println("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
		System.out.println(jso.toString());
		System.out.println("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲\n\n");
		PrintWriter out = resp.getWriter();
		out.println(jso.toString());
	}
	
	@RequestMapping(value="/delcomment", method=RequestMethod.POST)
	@ResponseBody
	public void deleteComment(HttpSession session, HttpServletResponse resp, @RequestParam("wc_num")int wc_num) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		mj_dao.deletecomment(wc_num);
	}
	
	public void setMj_dao(KMJ mj_dao) {
		this.mj_dao = mj_dao;
	}

}
