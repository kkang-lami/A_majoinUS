package controller.JEJ;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.JEJ;
import net.sf.json.JSONObject;
import project.DTO.PaymentDTO;

@Controller
public class PaymentListController {

	@Autowired
	private JEJ service;
	
	public void setService(JEJ service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/aus/JEJ/PaymentList")
	public void payment_list123(Model model, @RequestParam(value="d_yy", defaultValue="0")int d_yy, @RequestParam(value="d_mm", defaultValue="0")int d_mm) throws Exception {	
		Calendar cal = Calendar.getInstance();
		
		if (d_yy == 0) {
		d_yy =  cal.get(cal.YEAR) - 2000;
		d_mm = cal.get(cal.MONTH) + 1;
		}
		
		//String year = Integer.toString(d_yy);
		//String month = Integer.toString(d_mm);
		
		//if (year == null) {
		
		System.out.println("d_yy와 d_mm ::: "+service.getPaymentList(d_yy, d_mm));
		List <PaymentDTO> paylist = service.getPaymentList(d_yy, d_mm);
		model.addAttribute("paylist",paylist);
		
		model.addAttribute("d_yy",d_yy);
		model.addAttribute("d_mm",d_mm);
	}
	
	@RequestMapping(value = "/aus/JEJ/PaymentAjax", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public void payment_list(Model model, @RequestParam(value="d_yy", defaultValue="0")int d_yy, @RequestParam(value="d_mm", defaultValue="0")int d_mm) throws Exception {	
		Calendar cal = Calendar.getInstance();
		
		if (d_yy == 0) {
		d_yy =  cal.get(cal.YEAR) - 2000;
		d_mm = cal.get(cal.MONTH) + 1;
		}

		
		//String year = Integer.toString(d_yy);
		//String month = Integer.toString(d_mm);
		
		//if (year == null) {
		
		System.out.println("d_yy와 d_mm ::: "+service.getPaymentList(d_yy, d_mm));
		List <PaymentDTO> paylist = service.getPaymentList(d_yy, d_mm);
		model.addAttribute("paylist",paylist);
		
		model.addAttribute("d_yy",d_yy);
		model.addAttribute("d_mm",d_mm);
	}
	
	@RequestMapping(value = "/aus/JEJ/PaymentListPro")
	public void payment_list_submit(Model model, int d_yy, int d_mm) throws Exception {
		System.out.println("년도:"+d_yy);
		System.out.println("월:"+d_mm);
		
		List <PaymentDTO> paylist1 = service.getPaymentList(d_yy, d_mm);
		model.addAttribute("paylist1",paylist1);
		//return "redirect:/aus/JEJ/PaymentList";
		
		model.addAttribute("d_yy",d_yy);
		model.addAttribute("d_mm",d_mm);
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/aus/JEJ/PaymentAjax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String payment_list1(Model model,  HttpServletResponse resp, @RequestParam(value="d_yy", defaultValue="0")int d_yy, @RequestParam(value="d_mm", defaultValue="0")int d_mm) throws Exception {	
		
		System.out.println("suse"+d_yy);
		System.out.println(d_mm);
		
		Calendar cal = Calendar.getInstance();
		
		if (d_yy == 0) {
		d_yy =  cal.get(cal.YEAR) - 2000;
		d_mm = cal.get(cal.MONTH) + 1;
		}
			
		System.out.println("d_yy와 d_mm ::: "+service.getPaymentList(d_yy, d_mm));
		List <PaymentDTO> paylist = service.getPaymentList(d_yy, d_mm);
			
		JSONObject jso = new JSONObject();
		jso.put("data", paylist);
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println(jso.toString());
		return jso.toString();

	}
	
	
}
