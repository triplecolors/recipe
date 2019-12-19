package com.kh.recipe.freeBoard.model.vo;

import java.sql.Date;

public class FreeBoard {
	
	private int bno;
	private int uno;
	private String pType;
	private String pTitle;
	private String pContent;
	private Date pDate;
	private int pCount;
	private String pStatus;
	private String writer;
	private int bnum;
	
	
	
	public FreeBoard() {
		super();
	}

	


	public FreeBoard(String pTitle, String pContent) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
	}




	public FreeBoard(int bno, int uno, String pType, String pTitle, String pContent) {
		super();
		this.bno = bno;
		this.uno = uno;
		this.pType = pType;
		this.pTitle = pTitle;
		this.pContent = pContent;
	}




	public FreeBoard(String pStatus, int bno, int pCount, String pTitle, String pType, String pContent, int uno,
			Date pDate) {
		super();
		this.pStatus = pStatus;
		this.bno = bno;
		this.pCount = pCount;
		this.pTitle = pTitle;
		this.pType = pType;
		this.pContent = pContent;
		this.uno = uno;
		this.pDate = pDate;
	}




	public int getBno() {
		return bno;
	}




	public void setBno(int bno) {
		this.bno = bno;
	}




	public int getUno() {
		return uno;
	}




	public void setUno(int uno) {
		this.uno = uno;
	}




	public String getpType() {
		return pType;
	}




	public void setpType(String pType) {
		this.pType = pType;
	}




	public String getpTitle() {
		return pTitle;
	}




	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}




	public String getpContent() {
		return pContent;
	}




	public void setpContent(String pContent) {
		this.pContent = pContent;
	}




	public Date getpDate() {
		return pDate;
	}




	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}




	public int getpCount() {
		return pCount;
	}




	public void setpCount(int pCount) {
		this.pCount = pCount;
	}




	public String getpStatus() {
		return pStatus;
	}




	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}




	public String getWriter() {
		return writer;
	}




	public void setWriter(String writer) {
		this.writer = writer;
	}




	public int getBnum() {
		return bnum;
	}




	public void setBnum(int bnum) {
		this.bnum = bnum;
	}




	@Override
	public String toString() {
		return "FreeBoard [bno=" + bno + ", uno=" + uno + ", pType=" + pType + ", pTitle=" + pTitle + ", pContent="
				+ pContent + ", pDate=" + pDate + ", pCount=" + pCount + ", pStatus=" + pStatus + ", writer=" + writer
				+ ", bnum=" + bnum + "]";
	}


	






	
	
	
	

}
