package controller.LSH.DTO;

public class ProfileDTO {

	private String id;
	private String name;
	private String profile;
	private String u_img;
	private double eval;
	private int isfriend;
	private int follower;
	private int pj_count;

	private String job;
	private String local ;
	private String review_content ;
	
//	private List<PortfolioDTO> port =  new ArrayList<PortfolioDTO>();
	private int port_num;
	private String subject;
	private String start_d;
	private String end_d;
	private String p_private;
	
	
	
	public int getPj_count() {
		return pj_count;
	}
	public void setPj_count(int pj_count) {
		this.pj_count = pj_count;
	}
	public int getFollower() {
		return follower;
	}
	public void setFollower(int follower) {
		this.follower = follower;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getU_img() {
		return u_img;
	}
	public void setU_img(String u_img) {
		this.u_img = u_img;
	}
	public double getEval() {
		return eval;
	}
	public void setEval(double eval) {
		this.eval = eval;
	}

	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public int getPort_num() {
		return port_num;
	}
	public void setPort_num(int port_num) {
		this.port_num = port_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStart_d() {
		return start_d;
	}
	public void setStart_d(String start_d) {
		this.start_d = start_d.split(" ")[0];
	}
	public String getEnd_d() {
		return end_d;
	}
	public void setEnd_d(String end_d) {
		this.end_d = end_d.split(" ")[0];
	}
	public String getP_private() {
		return p_private;
	}
	public void setP_private(String p_private) {
		this.p_private = p_private;
	}
	public int getIsfriend() {
		return isfriend;
	}
	public void setIsfriend(int isfriend) {
		this.isfriend = isfriend;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	@Override
	public String toString() {
		return "ProfileDTO [name=" + name + ", profile=" + profile + ", u_img=" + u_img + ", eval=" + eval
				+ ", isfriend=" + isfriend + ", job=" + job + ", local=" + local + ", review_content="
				+ review_content + ", port_num=" + port_num + ", subject=" + subject + ", start_d=" + start_d
				+ ", end_d=" + end_d + ", p_private=" + p_private + "]";
	}

	

//	private List<String> review_content;
}
