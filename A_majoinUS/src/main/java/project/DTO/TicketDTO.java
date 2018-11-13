package project.DTO;

public class TicketDTO {
	private int t_num;
	private String id;
	private String t_date;
	private String t_status;
	private String name;
	
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public String getT_status() {
		return t_status;
	}
	public void setT_status(String t_status) {
		this.t_status = t_status;
	}
	public String getName() { 
		return name;
	}  
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "TicketDTO [t_num=" + t_num + ", id=" + id + ", t_date=" + t_date + ", t_status=" + t_status + ", name="
				+ name + "]";
	}
	
	
	
}
