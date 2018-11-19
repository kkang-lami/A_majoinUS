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
import org.springframework.web.multipart.MultipartFile;

import dao.KMJ;
import project.DTO.Port_detailDTO;
import project.DTO.PortfolioDTO;

@Controller
@RequestMapping("/aus")
public class PortfolioController {

	
	@Autowired
	private KMJ mj_dao;

	@RequestMapping(value="/ProejctRoom/portfolio",method=RequestMethod.GET)
	public String start(HttpSession session,@RequestParam("pj_num") int pj_num,Model m) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "KMJ/error";
		}

		Map <String,Object> map = new HashMap<String,Object>();
		map.put("pj_num", pj_num);
		map.put("id", id);
		
		int check = mj_dao.PortfolioWriteCheck(map);
		
		if(check > 0) {
			return "KMJ/AlreadyWrite";
		}
		
		Map<String,String> date = mj_dao.Project_Date(pj_num);
		m.addAttribute("pj_num",pj_num);
		m.addAttribute("date",date);
		return "KMJ/PortfolioWriteForm";
	}
	
	@RequestMapping(value="/ProejctRoom/portfolio/complet",method=RequestMethod.POST)  
	public String portfolio(HttpSession session,@ModelAttribute("myportfolio") PortfolioDTO portfolio,@RequestParam("attached_file") MultipartFile file,@ModelAttribute() PortList portList) {
		String id = (String) session.getAttribute("id");
		
		if(file.getOriginalFilename() != "") {
			String path = "d://item//portfolio//";
			String f_name = file.getOriginalFilename();
			long now = System.currentTimeMillis();
			String new_name = now + "_" + f_name;
			File new_file = new File(path, new_name);
		
			try {
				file.transferTo(new_file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			portfolio.setFile_path(new_name);
		}else {
			portfolio.setFile_path("");
		}

		portfolio.setId(id);
		if(portfolio.getP_private()==null) {
			portfolio.setP_private("off");
		}
		  
		portfolio.setStart_d(portfolio.getStart_d().replace("-", "/"));
		portfolio.setEnd_d(portfolio.getEnd_d().replace("-", "/"));
		
		mj_dao.portfolioInsert(portfolio);
		int seq = mj_dao.pf_detail_seq();
		
		List<Port_detailDTO> list = new ArrayList<Port_detailDTO>();
		if(portList.getPortList()!=null) {
			for(int i =0; i<portList.getPortList().size() ; i++) {
				PortimgDTO pdto = new PortimgDTO();
				Port_detailDTO insert = new Port_detailDTO();
				
				pdto = portList.getPortList().get(i);
				
				if(pdto.getPd_content()==null) {
					pdto.setPd_content("");
				}
				
				String path2 = "d://item//portfolio//detail//";
				String f_name2 = pdto.getPd_img().getOriginalFilename();
				f_name2 = f_name2.substring(0, f_name2.indexOf("."));
				long now2 = System.currentTimeMillis();
				String new_name2 = now2 + "_" + f_name2;
				File new_file2 = new File(path2, new_name2);
				try {
					pdto.getPd_img().transferTo(new_file2);
				} catch (Exception e) {
					e.printStackTrace();
				}
				insert.setPd_num(seq+i);
				insert.setPort_num(portfolio.getPort_num());
				insert.setPd_img(new_name2);
				insert.setPd_content(pdto.getPd_content());
				
				list.add(insert);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			
			int i = mj_dao.portfolioDetailInsert(map);
			System.out.println("port_detail insert 완료 갯수 : " + i);
			
		}
		
		
		//프로젝트룸 메인 리턴
		return "redirect:/aus/ProejctRoom/Main?pj_Num="+portfolio.getPj_num();
	}
	
	@RequestMapping(value="/portfolio/edit",method=RequestMethod.GET)
	public String editPortfolio(HttpSession session, Model m, @RequestParam("port_num")int port_num) {
		
		String id = (String)session.getAttribute("id");
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("id", id);
		map.put("port_num", port_num);
		
		PortfolioDTO dto = mj_dao.myportfolio(map);
		dto.setStart_d(dto.getStart_d().substring(0, dto.getStart_d().indexOf(" ")));
		dto.setEnd_d(dto.getEnd_d().substring(0, dto.getEnd_d().indexOf(" ")));
		
		List<Port_detailDTO> detail = mj_dao.pofolDetail(port_num);
		
		m.addAttribute("portfolio", dto);
		m.addAttribute("detail", detail);
		m.addAttribute("port_num",port_num);
		
		return "KMJ/Edit_Portfolio";
		
	}
	@RequestMapping(value="/portfolio/edit_complet",method=RequestMethod.POST)
	public String edit_portfolio(HttpSession session,@ModelAttribute("edit_pf") PortfolioDTO portfolio,@RequestParam("attached_file") MultipartFile file,@ModelAttribute PortList new_pf_list,@ModelAttribute OldPortdetailList old_pf_list) {
		String id = (String) session.getAttribute("id");
		
		if(!file.isEmpty()) {
			String path = "d://item//portfolio//";
			String f_name = file.getOriginalFilename();
			long now = System.currentTimeMillis();
			String new_name = now + "_" + f_name;
			File new_file = new File(path, new_name);
		
			try {
				file.transferTo(new_file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			portfolio.setFile_path(new_name);
		}else {
			portfolio.setFile_path("");
		}

		if(portfolio.getP_private()==null) {
			portfolio.setP_private("off");
		}
		
		portfolio.setStart_d(portfolio.getStart_d().replace("-", "/"));
		portfolio.setEnd_d(portfolio.getEnd_d().replace("-", "/"));
		
		mj_dao.portfolioUpdate(portfolio);
		//////////////////////////////////////////////////////////////////////////////
		
		List<Port_detailDTO> detail = mj_dao.pofolDetail(portfolio.getPort_num());
		List<Port_detailDTO> delete = new ArrayList<Port_detailDTO>();
		List<Port_detailDTO> update = new ArrayList<Port_detailDTO>();
		if(old_pf_list.getOldlist()!=null) {
			for(int i =0;i<old_pf_list.getOldlist().size();i++) {
				Port_detailDTO edit_dto = old_pf_list.getOldlist().get(i);
				Port_detailDTO old_dto = detail.get(i);
				
				if(edit_dto.getPd_num() != old_dto.getPd_num()) {
					delete.add(old_dto);
				}	
				if(edit_dto.getPd_num() == old_dto.getPd_num()) {
					update.add(edit_dto);
				}
			}
			if(delete.size()>0) {
				Map<String,Object> del = new HashMap<String,Object>();
				del.put("list", delete);
				mj_dao.pf_detail_delete(del);
			}
			if(update.size()>0) {
			Map<String,Object> update_map = new HashMap<String,Object>();
			update_map.put("list", update);
			mj_dao.pf_detail_update(update_map);
			}
		}
		
		
		
		if(new_pf_list.getPortList() != null) {
			int seq = mj_dao.pf_detail_seq();
			
			List<Port_detailDTO> list = new ArrayList<Port_detailDTO>();
			
			for(int i =0; i<new_pf_list.getPortList().size() ; i++) {
				PortimgDTO pdto = new PortimgDTO();
				Port_detailDTO insert = new Port_detailDTO();
				
				pdto = new_pf_list.getPortList().get(i);
				
				if(pdto.getPd_content()==null) {
					pdto.setPd_content("");
				}
				
				String path2 = "d://item//portfolio//detail//";
				String f_name2 = pdto.getPd_img().getOriginalFilename();
				f_name2 = f_name2.substring(0, f_name2.indexOf("."));
				long now2 = System.currentTimeMillis();
				String new_name2 = now2 + "_" + f_name2;
				File new_file2 = new File(path2, new_name2);
				try {
					pdto.getPd_img().transferTo(new_file2);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				insert.setPd_num(seq+i);
				insert.setPort_num(portfolio.getPort_num());
				insert.setPd_img(new_name2);
				insert.setPd_content(pdto.getPd_content());
				
				list.add(insert);
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			
			int i = mj_dao.portfolioDetailInsert(map);
			System.out.println("port_detail insert 완료 갯수 : " + i);
		}
		return "redirect:/aus/portfolioList";
	}
	
	
	public void setMj_dao(KMJ mj_dao) {
		this.mj_dao = mj_dao;
	}
	
}
