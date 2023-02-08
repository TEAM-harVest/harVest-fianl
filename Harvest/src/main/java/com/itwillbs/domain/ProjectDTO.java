package com.itwillbs.domain;

import java.sql.Date;

public class ProjectDTO {
	
	private int idx;
	private String creNm;
	private String category;
	private String title;
	private String img1;
	private int targetAmt;
	private int totalAmt;
	private Date start;
	private Date end;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCreNm() {
		return creNm;
	}
	public void setCreNm(String creNm) {
		this.creNm = creNm;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public int getTargetAmt() {
		return targetAmt;
	}
	public void setTargetAmt(int targetAmt) {
		this.targetAmt = targetAmt;
	}
	public int getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(int totalAmt) {
		this.totalAmt = totalAmt;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "ProjectDTO [idx=" + idx + ", creNm=" + creNm + ", category=" + category + ", title=" + title + ", img1="
				+ img1 + ", targetAmt=" + targetAmt + ", totalAmt=" + totalAmt + ", start=" + start + ", end=" + end
				+ "]";
	}
	

	
	
	


}