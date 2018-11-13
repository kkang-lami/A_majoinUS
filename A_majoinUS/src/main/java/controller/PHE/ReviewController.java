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
import project.DTO.ReviewDTO;

@Controller
@RequestMapping(value = "/aus/PHE")
public class ReviewController {
	@Autowired
	PHE dao;

	public void setDao(PHE dao) {
		this.dao = dao;
	}

	/********************************* 후기 게시판 *************************************/

	// reviewListForMe
	@RequestMapping(value = "/reviewListForMe")
	public ModelAndView ReviewlistForMe(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		String sessionId = (String) session.getAttribute("userId");

		List<ReviewDTO> reviewListForMe = dao.getReviewListForMe(sessionId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/reviewListForMe");
		mav.addObject("reviewListForMe", reviewListForMe);

		return mav;
	}

	// reviewListByMe
		@RequestMapping(value = "/reviewListByMe")
		public ModelAndView ReviewlistByMe(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			session = request.getSession(true);
			String sessionId = (String) session.getAttribute("userId");

			List<ReviewByMeDTO> reviewListByMe = dao.getReviewListByMe(sessionId);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("PHE/reviewListByMe");
			mav.addObject("reviewListByMe", reviewListByMe);

			return mav;
		}

}