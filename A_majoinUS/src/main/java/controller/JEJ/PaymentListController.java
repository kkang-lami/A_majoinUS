package controller.JEJ;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
   
   @RequestMapping(value = "/aus/PaymentList")
   public String payment_list123(Model model, @RequestParam(value="d_yy", defaultValue="0")int d_yy, @RequestParam(value="d_mm", defaultValue="0")int d_mm) throws Exception {   
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
      
      return "JEJ/PaymentList";
   }
   
   @RequestMapping(value = "/aus/PaymentAjax", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
   public String payment_list(Model model, @RequestParam(value="d_yy", defaultValue="0")int d_yy, @RequestParam(value="d_mm", defaultValue="0")int d_mm) throws Exception {   
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
      
      return "JEJ/PaymentAjax";
   }
   
   @RequestMapping(value = "/aus/PaymentListPro")
   public String payment_list_submit(Model model, int d_yy, int d_mm) throws Exception {
      System.out.println("년도:"+d_yy);
      System.out.println("월:"+d_mm);
      
      List <PaymentDTO> paylist1 = service.getPaymentList(d_yy, d_mm);
      model.addAttribute("paylist1",paylist1);
      //return "redirect:/aus/JEJ/PaymentList";
      
      model.addAttribute("d_yy",d_yy);
      model.addAttribute("d_mm",d_mm);
      
      return "JEJ/PaymentListPro";
   }
   
   
   
   
   
   
   
   
   @RequestMapping(value = "/aus/PaymentAjax", method=RequestMethod.POST,  produces = "application/text; charset=utf8")
   //@ResponseBody
   public void payment_list1(Model model,  HttpServletResponse resp, @RequestParam(value="d_yy", defaultValue="0")int d_yy, @RequestParam(value="d_mm", defaultValue="0")int d_mm) throws Exception {   
      resp.setContentType("text/html;charset=utf-8");
      
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
      PrintWriter out = resp.getWriter();
      out.print(jso);
      System.out.println(jso.toString());
      //return jso.toString()

   }
   
   
}