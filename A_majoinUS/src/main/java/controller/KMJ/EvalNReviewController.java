package controller.KMJ;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.KMJ;
import project.DTO.Pj_memDTO;
import project.DTO.PointDTO;
import project.DTO.ReviewDTO;
import project.DTO.Review_adminDTO;

@Controller
@RequestMapping("/aus/ProejctRoom/EnR")
public class EvalNReviewController {

	@Autowired
	private KMJ mj_dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public String start(Model m,@RequestParam("pj_num") int pj_num, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "KMJ/error";
		}
		
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("pj_num", pj_num);
		map.put("id", id);
		
		int check = mj_dao.ReviewWriteCheck(map);
		
		if(check > 0) {
			return "KMJ/AlreadyWrite";
		}
		
		List<Pj_memDTO> memberList = mj_dao.selectMember(map);
		
		int count = mj_dao.reviewcount();
		
		
		m.addAttribute("pj_num",pj_num);
		m.addAttribute("count",count+1);
		m.addAttribute("memberList",memberList);
		
		return "KMJ/EvalNReview";
	}
  
	@RequestMapping(value="/EnRInsert", method=RequestMethod.POST)
	public String EnRInsert(@ModelAttribute("Review_Eval")Review_adminDTO admin,ReviewList review_List,HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "KMJ/error";
		}
		
		if(!admin.getRa_content().equals("")) {
			admin.setId(id);
			mj_dao.Review2Admin(admin);
		}
		
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		if(review_List.getReviewList() != null) {
			for(int i = 0; i<review_List.getReviewList().size();i++) {
				MJreviewDTO reviewList = new MJreviewDTO();
				ReviewDTO review = new ReviewDTO();
				reviewList = review_List.getReviewList().get(i);
				
				review.setReview_num(Integer.parseInt(reviewList.getReview_num()));
				review.setId(reviewList.getId());
				review.setPj_num(Integer.parseInt(reviewList.getPj_num()));
				review.setReview_content(reviewList.getReview_content());
				review.setScore(Double.parseDouble(reviewList.getScore()));
				review.setTarget_id(reviewList.getTarget_id());
				
				list.add(review);
			}
			Map<String,List<ReviewDTO>> map = new HashMap<String,List<ReviewDTO>>();
			map.put("list", list);
			
			mj_dao.MemberReview(map);
			
			PointDTO point = new PointDTO();
			point.setId(id);
			mj_dao.presentPoint(point);
		}
		
		//프로젝트 룸 메인
		return "redirect:/aus/ProejctRoom/Main?pj_Num="+admin.getPj_num();
	}
	
	
	
	
	public void setMj_dao(KMJ mj_dao) {
		this.mj_dao = mj_dao;
	}
}
