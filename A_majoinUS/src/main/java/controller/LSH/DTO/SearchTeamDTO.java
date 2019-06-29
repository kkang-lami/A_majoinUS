package controller.LSH.DTO;

import java.util.Arrays;

public class SearchTeamDTO {

	private String[] job;
	private String[] local;
	private String keyword;
	private String start_d;
	private String end_d;
	private String sort;
	private String sort_way;
	private String checking;
	private String id;
	private int startRow;
	private int endRow;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChecking() {
		return checking;
	}
	public void setChecking(String checking) {
		this.checking = checking;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStart_d() {
		return start_d;
	}
	public void setStart_d(String start_d) {
		this.start_d = start_d;
	}
	public String getEnd_d() {
		return end_d;
	}
	public void setEnd_d(String end_d) {
		this.end_d = end_d;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getSort_way() {
		return sort_way;
	}
	public void setSort_way(String sort_way) {
		this.sort_way = sort_way;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "[job=" + Arrays.toString(job) + ", local=" + Arrays.toString(local) + ", keyword="
				+ keyword + ", start_d=" + start_d + ", end_d=" + end_d + ", sort=" + sort + ", sort_way=" + sort_way
				+ ", checking=" + checking + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	

	

	
}
