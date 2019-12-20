package com.kh.recipe.BCOMMENT.model.vo;

import java.sql.Date;

public class comment {
	private int cno;
	private int bno;
	private int uno;
	private String ccontent;
	private int clevel;
	private int ref_cno;
	private Date cdate;
	private String cstatus;
	// ulist에서
	private String unick;
	
	public comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	// 댓글 insert
	public comment(int bno, int uno, String ccontent, int clevel, int ref_cno) {
		super();
		this.bno = bno;
		this.uno = uno;
		this.ccontent = ccontent;
		this.clevel = clevel;
		this.ref_cno = ref_cno;
	}


	public comment(int cno, int bno, int uno, String ccontent, int clevel, int ref_cno, Date cdate, String cstatus,
			String unick) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.uno = uno;
		this.ccontent = ccontent;
		this.clevel = clevel;
		this.ref_cno = ref_cno;
		this.cdate = cdate;
		this.cstatus = cstatus;
		this.unick = unick;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
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

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public int getClevel() {
		return clevel;
	}

	public void setClevel(int clevel) {
		this.clevel = clevel;
	}

	public int getRef_cno() {
		return ref_cno;
	}

	public void setRef_cno(int ref_cno) {
		this.ref_cno = ref_cno;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getCstatus() {
		return cstatus;
	}

	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}

	public String getUnick() {
		return unick;
	}

	public void setUnick(String unick) {
		this.unick = unick;
	}

	@Override
	public String toString() {
		return "comment [cno=" + cno + ", bno=" + bno + ", uno=" + uno + ", ccontent=" + ccontent + ", clevel=" + clevel
				+ ", ref_cno=" + ref_cno + ", cdate=" + cdate + ", cstatus=" + cstatus + ", unick=" + unick + "]";
	}

	
	
	
	
}
