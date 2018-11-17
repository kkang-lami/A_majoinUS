package controller.JEJ;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.JEJ;
import project.DTO.Category_2DTO;

@Controller
public class CategoryManageController {

	@Autowired
	private JEJ service;
	
	public void setService(JEJ service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/aus/CategoryManage")
	public String category_manage(Model model) throws Exception {
		 List<Category_2DTO> categoryList = service.getCategoryList();
	      model.addAttribute("categoryList",categoryList);
	      model.addAttribute("cateSize",categoryList.size());
	      
	      List<Category_2DTO> categoryList1 = service.getCategoryList2();
	      model.addAttribute("categoryList1",categoryList1);
	      model.addAttribute("cateSize1",categoryList1.size());
	      
	      return "JEJ/CategoryManage";

	}
	
	//카테고리 수정
	@RequestMapping(value = "/aus/updatecategory")
	public String update_category(Model model, int c_2_num, int cate_num) {
		model.addAttribute("c_2_num",c_2_num);
		model.addAttribute("cate_num",cate_num);

		List<Category_2DTO> category = service.selectoneCate(c_2_num); 
		model.addAttribute("category",category);
		
		return "JEJ/updatecategory";
		
	}
	
	@RequestMapping(value = "/aus/updatepro")
	public String update_categoryPro(Model model, int cate_num, int cate_1_num, String c_1_name, int c_2_num, String c_2_name, String c_1_past, String c_2_past) {
		service.updateCate(cate_1_num,c_1_name,c_2_name,c_2_num);
		model.addAttribute("cate_num",cate_num);		
		
		//선호지역 변경
		if(cate_num == 91) { 
			String table1 = "Pj_location";
			String table2 = "F_location";
			String column1 = "pj_loc";
			String column2 = "f_loc";
			service.updateFavorite(table1, column1, c_1_name, c_2_name, c_1_past, c_2_past);
			service.updateFavorite(table2, column2, c_1_name, c_2_name, c_1_past, c_2_past);
		}
		
		//선호직군 변경
		if(cate_num == 90) { 
			String table1 = "Pj_job";
			String table2 = "F_job";
			String column1 = "pj_cate";
			String column2 = "f_cate";
			service.updateFavorite(table1, column1, c_1_name, c_2_name, c_1_past, c_2_past);
			service.updateFavorite(table2, column2, c_1_name, c_2_name, c_1_past, c_2_past);			
			//System.out.println("아녕:"+table1+":::"+c_1_name+":::"+c_2_name+":::"+c_1_past+":::"+c_2_past);
		}
		
		return "JEJ/updatepro";
	}
	
	//카테고리 삭제
	@RequestMapping(value = "/aus/deleteCategory")
	public String delete_Category(Model model, int c_2_num) {
		service.deleteCate(c_2_num);
		return "redirect:/aus/CategoryManage";
	}
	
	
}
