package cn.jaeblog.entity;

public class Page {
	@SuppressWarnings("unused")
	private Integer start;	
	@SuppressWarnings("unused")
	private Integer end;	
	private Integer pageNo = 1;	
	private Integer pageSize = 5;
	public Integer getStart() {
		return (pageNo-1)*pageSize;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {
		return pageNo*pageSize;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
