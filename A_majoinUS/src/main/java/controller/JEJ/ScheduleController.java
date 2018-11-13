package controller.JEJ;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.JEJ;
import project.DTO.ScheduleDTO;

@Controller
public class ScheduleController {

   @Autowired
   private JEJ service;

   public void setService(JEJ service) {
      this.service = service;
   }
   
   @RequestMapping(value = "/aus/JEJ/ProjectSchedule")
   public void moveSchedule(ModelMap model,String year, String month,HttpSession session) {
	   session.setAttribute("userNo", 500);
	   int pj_num = (int)session.getAttribute("userNo");
	   
       String strYear = year;
       String strMonth = month;
     
       Calendar cal = Calendar.getInstance();
   
       int year1 = cal.get(Calendar.YEAR); // 오늘 년 월 일
       int month1 = cal.get(Calendar.MONTH);
       
       int today_year = cal.get(Calendar.YEAR); 
       int today_month = cal.get(Calendar.MONTH);
       int today_date = cal.get(Calendar.DATE);

       if(strYear != null)
       {
         year1 = Integer.parseInt(strYear);
         month1 = Integer.parseInt(strMonth);
       }

       //년도/월 셋팅
       cal.set(year1, month1, 1);

       int startDay = cal.getMinimum(Calendar.DATE);            // 그 달이 언제부터?
       int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);   // 그 달이 언제까지?
       int start = cal.get(Calendar.DAY_OF_WEEK);         // 1일이 언제부터 시작인지
       int newLine = 0;

       //오늘 날짜 저장.
       Calendar todayCal = Calendar.getInstance();
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
       String intToday = sdf.format(todayCal.getTime());

       List<ScheduleDTO> list =  service.select_schedule(pj_num);
       System.out.println("d은쥬"+list.size());
       int vacation_number = 1;
                      
       model.addAttribute("year", year1);
       model.addAttribute("month", month1);
       model.addAttribute("startDay", startDay);
       model.addAttribute("endDay", endDay);
       model.addAttribute("start", start);
       model.addAttribute("newLine", newLine);
       model.addAttribute("intToday", intToday);
       model.addAttribute("list", list);
       model.addAttribute("today_year", today_year);
       model.addAttribute("today_month", today_month);
       model.addAttribute("today_date", today_date);

       model.addAttribute("vacation_number", vacation_number);

     //return "aus/JEJ/ProjectSchedule";
  }

   
   @RequestMapping(value = "/aus/JEJ/AddSchedule", method = RequestMethod.GET)
   public void add_schedule(Model model, HttpServletRequest request) {
	   
   }
  
   
   @RequestMapping(value = "/aus/JEJ/AddSchedule", method = RequestMethod.POST)
   public String Schedule_add(HttpSession session, @RequestParam(value="s_content")String holiday_name, @RequestParam(value="s_start")String holiday_start, @RequestParam(value="s_end")String holiday_end) throws ParseException, java.text.ParseException {      
	   int pj_num = (int)session.getAttribute("userNo");
	   
	   System.out.println(pj_num);
	   System.out.println(holiday_name);
	   System.out.println(holiday_start);
	   System.out.println(holiday_end);
      DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

      Date a[] = new Date[2];

		a[0] = sdFormat.parse(holiday_start);
		a[1] = sdFormat.parse(holiday_end);

      int b = (int) (a[1].getTime() - a[0].getTime()) / (1000 * 3600 * 24);

      int x = service.get_h_num()+1;

      service.insert_holiday(holiday_name, holiday_start, holiday_end, pj_num);
      System.out.println("asdfasdf");
      for (int i = 0; i <= b; i++) {
         Long nal = a[0].getTime() + i * 1000 * 3600 * 24;
         DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
         Date date = new Date(nal);
         String date2 = df.format(date);
         ScheduleDTO dto = new ScheduleDTO();
         dto.setPj_num(pj_num);
         dto.setH_num(x);
         dto.setS_date(date2);
         System.out.println("x:"+x);
         System.out.println(date2);
         service.insert_schedule(dto);
      }
      System.out.println("asdfas112132123132123df");
      return "redirect:/aus/JEJ/ProjectSchedule";
/*      return "redirect:aus/JEJ/AddSchedule"; //추후에 수정할것
*/
   }
}