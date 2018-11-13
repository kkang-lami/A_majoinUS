package controller.KMJ;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.KMJ;
import net.sf.json.JSONObject;
import project.DTO.Project_chatDTO;

@Controller
@RequestMapping("/aus/ProejctRoom/chatting")
public class ChatController {
	
	@Autowired
	private KMJ mj_dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public String start(HttpSession session,@RequestParam("pj_num") int pj_num,Model m) {
			
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "KMJ/error";
		}
		
		Date currentDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String today = sdf.format(currentDate);
		
		List<Project_chatDTO> chatdata = mj_dao.chatList(pj_num);
		
		m.addAttribute("chatdata",chatdata);
		m.addAttribute("pj_num",pj_num);
		m.addAttribute("today",today);
		return "KMJ/chatRoom";
	}

	@RequestMapping(value="/searchName",method=RequestMethod.POST)
	@ResponseBody
	public void searchName(HttpServletResponse resp,@RequestParam("pj_num") int pj_num, @RequestParam("data") String data) throws Exception {
		resp.setContentType("text/html; charset=UTF-8");
		
		String id = data.substring(0, data.indexOf(" : "));
		
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("pj_num", pj_num);
		map.put("id", id);

		String name = mj_dao.searchname(map);
		
		JSONObject jso = new JSONObject();
		jso.put("name", name);
		PrintWriter out = resp.getWriter();
		out.println(jso.toString());
	}
	
	
	@RequestMapping(value="/chatDB", method=RequestMethod.POST)
	@ResponseBody
	public void chatdb(HttpServletResponse resp, @RequestParam("pj_num") int pj_num,@RequestParam("data") String data) {
		resp.setContentType("text/html; charset=UTF-8");
		
		String id = data.substring(0, data.indexOf(" : "));
		String chat_content = data.substring(data.indexOf(":")+1,data.indexOf("["));
		
		Project_chatDTO chatdata = new Project_chatDTO();
		chatdata.setPj_num(pj_num);
		chatdata.setId(id);
		chatdata.setChat_content(chat_content);
		
		mj_dao.insertchat(chatdata);
	}
	
	public void setMj_dao(KMJ mj_dao) {
		this.mj_dao = mj_dao;
	}    
	
}
