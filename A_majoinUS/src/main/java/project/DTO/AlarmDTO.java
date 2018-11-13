package project.DTO;

public class AlarmDTO extends ProjectroomDTO{
	private int a_num;
	private String sender;
	private String receiver;
	private int pj_num;
	private String a_date;
	private String a_type;
	
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}

	public int getPj_num() {
		return pj_num;
	}
	public void setPj_num(int pj_num) {
		this.pj_num = pj_num;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	public String getA_type() {
		return a_type;
	}
	public void setA_type(String a_type) {
		this.a_type = a_type;
	}
	
	@Override
	public String toString() {
		return "AlarmDTO [a_num=" + a_num + ", receiver=" + receiver + ", sender=" + sender + ", pj_num=" + pj_num
				+ ", a_date=" + a_date + ", a_type=" + a_type + "]";
	}
	

}
