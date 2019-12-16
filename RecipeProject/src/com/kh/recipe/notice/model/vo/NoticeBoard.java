package com.kh.recipe.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class NoticeBoard  {
	
	 private int bno;
	 private int uno;
	 private String nType;
	 private String nTitle;
	 private String nContent;
	 private Date nDate;
	 private String nStatus;
	 
	 public NoticeBoard() {}

	 public NoticeBoard(int uno, String nType, String nTitle, String nContent) {
			super();
			
			this.uno = uno;
			this.nTitle = nTitle;
			this.nContent = nContent;
		}
	 
	 
	 public NoticeBoard(int bno, int uno, String nType, String nTitle, String nContent) {
			super();
			this.bno = bno;
			this.uno = uno;
			this.nTitle = nTitle;
			this.nContent = nContent;
		}
	 
	public NoticeBoard(int bno, int uno, String nType, String nTitle, String nContent, Date nDate, String nStatus) {
		super();
		this.bno = bno;
		this.uno = uno;
		this.nType = nType;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nDate = nDate;
		this.nStatus = nStatus;
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

	public String getnType() {
		return nType;
	}

	public void setnType(String nType) {
		this.nType = nType;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "NoticeBoard [bno=" + bno + ", uno=" + uno + ", nType=" + nType + ", nTitle=" + nTitle + ", nContent="
				+ nContent + ", nDate=" + nDate + ", nStatus=" + nStatus + "]";
	}
	 
	 


	
	 
	
	
	
	
	
}
