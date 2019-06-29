package controller.LSH.DTO;

import java.util.Arrays;

public class SearchDTO {

	private String[] job;
	private String[] local;
	private double eval;
	private String keyword;
	private String sort;
	private String sort_way;
	private int startRow;
	private int endRow;
	
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

	public String getSort_way() {
		return sort_way;
	}

	public void setSort_way(String sort_way) {
		this.sort_way = sort_way;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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

	public double getEval() {
		return eval;
	}

	public void setEval(double eval) {
		this.eval = eval;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchDTO [job=" + Arrays.toString(job) + ", local=" + Arrays.toString(local) + ", eval=" + eval
				+ ", keyword=" + keyword + ", sort=" + sort + ", sort_way=" + sort_way + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}

}
