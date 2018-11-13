package controller.JHR;

import java.util.Arrays;
import java.util.Date;

public class MemberDTO {
		
		private String id;
		private String password;
		private String name;
		private String birth;
		private String phone;
		private String profile;
		private String u_img;
		private String[] job;
		private String[] local;		

		public MemberDTO (){}
		public MemberDTO(String id, String password, String name, String birth, String phone, String profile,
				String u_img, String[] job, String[] local) {
		
			this.id = id;
			this.password = password;
			this.name = name;
			this.birth = birth;
			this.phone = phone;
			this.profile = profile;
			this.u_img = u_img;
			this.job = job;
			this.local = local;
		}

		public String[] getJob() {
			return job;
		}
		public void setJob(String[] job) {
			this.job = job;
		}
		public String[] getLocal() {
			return local;
		}
		public void setLocal(String[] local) {
			this.local = local;
		}
		public String getBirth() {
			return birth;
		}
		public void setBirth(String birth) {
			this.birth = birth.split(" ")[0];
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
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
		
		@Override
		public String toString() {
			return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", phone="
					+ phone + ", profile=" + profile + ", u_img=" + u_img + ", job=" + Arrays.toString(job) + ", local="
					+ Arrays.toString(local) + "]";
		}

		
	}


