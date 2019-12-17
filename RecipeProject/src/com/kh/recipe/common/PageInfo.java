package com.kh.recipe.common;

import java.io.Serializable;

public class PageInfo implements Serializable{
	 private int startPage;
	 private int endPage;
	 private int maxPage;
	 private int currentPage=1;
	 private int limit=10;
	 private int listCount;
	 
	 
	 public PageInfo(){}
	 
	
	 
	 
	public PageInfo(int startPage, int endPage, int maxPage, int currentPage, int limit, int listCount) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.currentPage = currentPage;
		this.limit = limit;
		this.listCount = listCount;
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

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	
	
	public void maxPage(int listCount) {
		this.maxPage = (int)((double)listCount/this.limit+0.9);
	}
	
	public void startPage (int currentPage) {
		this.startPage = (int)((double)currentPage/this.limit+0.9)*limit-9;
	}
	
	public void endPage() {
		if(this.maxPage < this.endPage) {
			this.endPage = this.maxPage;
		}else {
			this.endPage = this.startPage+ this.limit -1;
		}
	}
	public  int[] getRowNum() {
		int startRow = (this.currentPage-1)*this.limit;
		int endRow = startRow + this.limit;
		
		int rowNum[] = {startRow, endRow};
		
		return rowNum;
	}
	
	
	
	
}
