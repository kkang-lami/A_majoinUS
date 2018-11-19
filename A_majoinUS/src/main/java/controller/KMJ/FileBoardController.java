package controller.KMJ;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.KMJ;
import project.DTO.FileboardDTO;
import project.DTO.Pj_memDTO;

@Controller
@RequestMapping("/aus/ProejctRoom/pr_fileboard")
public class FileBoardController {
	
	@Autowired
	private KMJ mj_dao;

	@RequestMapping(method=RequestMethod.GET)
	public String filelist(Model m,@RequestParam("pj_num") int pj_num, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "KMJ/error";
		}
		
		Pj_memDTO pm = new Pj_memDTO();
		pm.setPj_num(pj_num);
		pm.setId(id);
		
		int check = mj_dao.memcheck(pm);
		
		if(check != 1) {
			return "KMJ/error";
		}
		
		List<FileboardDTO> f_list = mj_dao.fileboardlist(pj_num);
		
		for(FileboardDTO dto:f_list) {
			dto.setFile_date(dto.getFile_date().substring(0, dto.getFile_date().indexOf(" ")));
		}
		
		m.addAttribute("pj_num",pj_num);
		m.addAttribute("f_list",f_list);
		return "KMJ/FileBoard";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String upload(HttpSession session,@RequestParam("file") MultipartFile file, @RequestParam("pj_num") int pj_num) {
		System.out.println("나 호출됨요");
		int pjm_num = (int)session.getAttribute("pjm_num");
		String id = (String)session.getAttribute("id");
		String path = "d://item//";
		String f_name = file.getOriginalFilename();
		long now = System.currentTimeMillis();
		String new_name = now + "_" + f_name;
		File new_file = new File(path, new_name);
		String f_size = "";
		int count=0;
		long size = file.getSize();
		
		while(true) {
			long update = size / 1024;
			
			if(update < 1) {
				if(count == 0)					f_size=file.getSize()+"byte";
				else if(count == 1)				f_size=size+"KB";
				else if(count == 2)				f_size=size+"MB";
				else if(count > 3)				f_size=size+"GB";
				break;
			}
			size = update;
			count++;
		}
		
		try {
			file.transferTo(new_file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		FileboardDTO fdto = new FileboardDTO();
		fdto.setPj_num(pj_num);
		fdto.setId(id);
		fdto.setFilename(file.getOriginalFilename());
		fdto.setFile_path(new_file.getPath());
		fdto.setFile_size(f_size);
		fdto.setPjm_num(pjm_num);
		mj_dao.fileupload(fdto);
		
		return "redirect:/aus/ProejctRoom/pr_fileboard?pj_num="+pj_num;
	}
	
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public ModelAndView download(@RequestParam("fb_num")int fb_num) throws Exception{
		FileboardDTO fdto = mj_dao.fileselect(fb_num);
		File downloadFile = new File(fdto.getFile_path());
		return new ModelAndView("download","downloadFile",downloadFile);
	}
     
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String filedelete(@RequestParam("fb_num")int fb_num,@RequestParam("pj_num")int pj_num) {
		mj_dao.filedelete(fb_num);
		return "redirect:/aus/ProejctRoom/pr_fileboard?pj_num="+pj_num;
	}
	
	
	public void setMj_dao(KMJ mj_dao) {
		this.mj_dao = mj_dao;
	}
	
	
}
