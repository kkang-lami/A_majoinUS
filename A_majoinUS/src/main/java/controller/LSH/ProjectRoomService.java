package controller.LSH;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LSH;

@Service
public class ProjectRoomService {

	private LSH dao;

	@Autowired	
	public void setDao(LSH dao) {
		this.dao = dao;
	}
	
	public List<Map<String,Object>> getProgress(int n){
		List<Map<String,Object>> list = null;
		int a=0,b=0,c=0;
		int total = 0,complete = 0;
		String temp[]= {};
		String end_d="",d_day="";
		Map<String,Object> temp_m = new HashMap<String,Object>();
		try {
			list = dao.getProgress("LSH_AUS.getProgress",n);
			
			for(int i = 0 ; i< list.size();i+=1) {
				a = Integer.parseInt(list.get(i).get("ONGOING").toString());
				b = Integer.parseInt(list.get(i).get("COMPLETE").toString());
				c = Integer.parseInt(list.get(i).get("DELAY").toString());
				list.get(i).put("total", a+b+c);
				total += a+b+c;
				complete += b;
				
				if(list.get(i).get("LEADER").equals(list.get(i).get("MEM_ID"))) {
					temp_m = list.get(i);
					list.remove(i);
					list.add(0,temp_m);
				}
			}
			
	        total = (total == 0)? 0: (complete*100)/total;
	        list.get(0).put("percent", total);
			
			temp = list.get(0).get("END_D").toString().split("-");
			
			if(Integer.parseInt(temp[0]) >= 2099){
				end_d = "무기한";
				d_day = "9999";
			}else {
				end_d = temp[0]+"-"+temp[1]+"-"+temp[2].split(" ")[0];
				
				d_day = d_day(Integer.parseInt(temp[0]),Integer.parseInt(temp[1])-1,Integer.parseInt(temp[2].split(" ")[0]));
			}

			list.get(0).replace("END_D",end_d);
			list.get(0).put("d_day", d_day);
		}catch (Exception e) {
			System.out.println("[에러] 프로젝트룸 서비스실패 ::"+e.toString());
		}
		return list;
	}
	
	public String d_day(int y, int m,int d) {
		Calendar now = Calendar.getInstance();
		Calendar dday = Calendar.getInstance();
		dday.set(y,m,d);
		long substract = (long)dday.getTimeInMillis()/(24*60*60*1000)-(long)now.getTimeInMillis()/(24*60*60*1000);		
				/*		now.add(Calendar.DAY_OF_MONTH, (int)substract);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
						System.out.println(sdf.format(dday.getTime()));
				*/		
		return substract+"";
	}

	public int updateLeader(String id,int pj_num) {
		int x = 0;
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("id", id);
		m.put("pj_num", pj_num);
		
		try {
			x = dao.updateLeader("LSH_AUS.update_leader", m);
		}catch (Exception e) {
			System.out.println("[에러] 프로젝트룸 서비스실패 ::"+e.toString());
		}
		return x;
	}
	
	public int kick(int pjm_num) {
	      int x = 0;
	      try {
	         x = dao.kick("LSH_AUS.kick", pjm_num);
	      }catch (Exception e) {
	    	  System.out.println("[에러] 킥 서비스실패 ::"+e.toString());
	      }
	      return x;
	}
}
