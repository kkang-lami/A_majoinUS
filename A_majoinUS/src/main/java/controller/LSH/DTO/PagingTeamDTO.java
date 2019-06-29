package controller.LSH.DTO;

import java.util.List;

public class PagingTeamDTO {

	private int pageNum;
	private int rowCount;
	private int pageCount;	
	private int startPage;	
	private int endPage;	
	private List<ResultTeamDTO> list;
	private int pageBlock;
	
	public PagingTeamDTO() {}
	
	public PagingTeamDTO(int pageNum, int rowCount, int pageCount, int startPage, int endPage, List<ResultTeamDTO> list,int pageBlock) {
		this.pageNum = pageNum;
		this.rowCount = rowCount;
		this.pageCount = pageCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.list = list;
		this.pageBlock = pageBlock;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public List<ResultTeamDTO> getList() {
		return list;
	}

	public void setList(List<ResultTeamDTO> list) {
		this.list = list;
	}

	public int getRowCount() {
		return rowCount;
	}


	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}


	@Override
	public String toString() {
		return "PagingDTO [list=" + list + ", rowCount=" + rowCount + ", pageCount=" + pageCount + ", startPage="
				+ startPage + ", endPage=" + endPage + ", pageNum=" + pageNum + "]";
	}

	
}

