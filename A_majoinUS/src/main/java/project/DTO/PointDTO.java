package project.DTO;

public class PointDTO {
	
	private int p_num;
	private String id;
	private String update_date;
	private String type;
	private int update_point;
	private int after_point;
	private String pay_price;
	
	public String getPay_price() {
		return pay_price;
	}
	public void setPay_price(String pay_price) {
		this.pay_price = pay_price;
	}
	public int getP_num() {
		return p_num;  
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getUpdate_point() {
		return update_point;
	}
	public void setUpdate_point(int update_point) {
		this.update_point = update_point;
	}
	public int getAfter_point() {
		return after_point;
	}
	public void setAfter_point(int after_point) {
		this.after_point = after_point;
	}
	
	@Override  
	public String toString() {
		return "PointDTO [p_num=" + p_num + ", id=" + id + ", update_date=" + update_date + ", type=" + type
				+ ", update_point=" + update_point + ", after_point=" + after_point + ", pay_price=" + pay_price + "]";
	}
}
