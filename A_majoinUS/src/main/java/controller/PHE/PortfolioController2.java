package controller.PHE;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import controller.KMJ.PortList;
import controller.KMJ.PortimgDTO;
import dao.PHE;
import project.DTO.FileboardDTO;
import project.DTO.Port_detailDTO;
import project.DTO.PortfolioDTO;

@Controller
@RequestMapping(value = "/aus")
public class PortfolioController2{
	@Autowired
	PHE dao;

	public void setDao(PHE dao) {
		this.dao = dao;
	}
	
	/********************************* 포트폴리오 *************************************/
	/*@RequestMapping(method=RequestMethod.GET)
	public String start(HttpSession session,@RequestParam("pj_num") int pj_num,Model m) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "id 없음";
		}
		
		Map<String,String> date = dao.Project_Date(pj_num);
		m.addAttribute("pj_num",pj_num);
		m.addAttribute("date",date);
		return "PHE/portfolioModify";
	}
	*/
	//포트폴리오 리스트
	@RequestMapping(value = "/portfolioList")
	public ModelAndView PortfolioList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession(true);
		session.removeAttribute("Dday");
		session.removeAttribute("pjm_num");
		
		String sessionId =(String)session.getAttribute("id");

		List<PortfolioDTO> portfolioList = dao.getPortfolioList(sessionId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/portfolioList");
		mav.addObject("portfolioList", portfolioList);

		return mav;
	}

	@RequestMapping(value = "/portfolioContent")
	//@ResponseBody //얘는 대체 뭐길래 다른 플젝에선 되고 여기선 안되는거지
	public ModelAndView PortfolioContent(@RequestParam("port_num") int port_num, HttpSession session) throws Exception {

		PortfolioDTO portfolioContent = dao.getPortfolioContent(port_num);
		List<Port_detailDTO> portfolioContent_detail = dao.getPortfolioContent_detail(port_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("PHE/portfolioContent");
		mav.addObject("portfolioContent", portfolioContent);
		mav.addObject("portfolioContent_detail", portfolioContent_detail);

		return mav;
	}
	
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public ModelAndView download(@RequestParam("file_path")String file_path) throws Exception{
		String path = "D://item//portfolio//"+file_path;
		File downloadFile = new File(path);
		return new ModelAndView("download","downloadFile",downloadFile);
	}
	
}