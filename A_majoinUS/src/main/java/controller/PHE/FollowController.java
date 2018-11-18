package controller.PHE;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.PHE;
import project.DTO.FollowDTO;

@Controller
@RequestMapping(value = "/aus")
public class FollowController {
	@Autowired
	PHE dao;

	public void setDao(PHE dao) {
		this.dao = dao;
	}

	/********************************* 팔로우 *************************************/
	@RequestMapping(value = "/followList")
	public ModelAndView FollowList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		String sessionId =(String)session.getAttribute("id");
		System.out.println("followListCon");
		List<FollowDTO> followList = dao.getFollowList(sessionId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/followList");
		mav.addObject("followList", followList);

		return mav;
	}
}