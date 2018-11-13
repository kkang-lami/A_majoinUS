package project.DTO;

public class PaymentDTO {
	private int pay_no;
	private String p_name;
	private String pg;
	private String pay_method;
	private String reg_date;
	private String id;
	private int pay_price;
	private String imp_uid;
	private int state;
	private String phone;
	private String name;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPay_no() {
		return pay_no;
	}
	@Override
	public String toString() {
		return "PaymentDTO [pay_no=" + pay_no + ", p_name=" + p_name + ", pg=" + pg + ", pay_method=" + pay_method
				+ ", reg_date=" + reg_date + ", id=" + id + ", pay_price=" + pay_price + ", imp_uid=" + imp_uid
				+ ", state=" + state + ", phone=" + phone + ", name=" + name + "]";
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getPg() {
		return pg;
	}
	public void setPg(String pg) {
		this.pg = pg;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
