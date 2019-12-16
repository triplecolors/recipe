package com.kh.recipe.BoardCommon.model.vo;

import java.sql.Date;

public class Bfile {
	private int fno;
	private int bno;
	private String fname;
	private String fpath;
	private Date fdate;
	private int flevel;
	
	public Bfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 레시피 등록 용
	public Bfile(String fname, String fpath, int flevel) {
		super();
		this.fname = fname;
		this.fpath = fpath;
		this.flevel = flevel;
	}

	// 전체 용
	public Bfile(int fno, int bno, String fname, String fpath, Date fdate, int flevel) {
		super();
		this.fno = fno;
		this.bno = bno;
		this.fname = fname;
		this.fpath = fpath;
		this.fdate = fdate;
		this.flevel = flevel;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public Date getFdate() {
		return fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	public int getFlevel() {
		return flevel;
	}

	public void setFlevel(int flevel) {
		this.flevel = flevel;
	}

	@Override
	public String toString() {
		return "Bfile [fno=" + fno + ", bno=" + bno + ", fname=" + fname + ", fpath=" + fpath + ", fdate=" + fdate
				+ ", flevel=" + flevel + "]";
	}
	
	
	
	
	
	
	

}
