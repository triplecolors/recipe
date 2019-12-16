package com.kh.recipe.recipeBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Menu implements Serializable {

	private int rno;
	private int bno;
	private int uno;
	private String rtitle;
	private String rsource;
	private String rprocess;
	private Date rdate;
	private String rgoods;
	private String rcontent;
	private String rvideo;
	private int rkind;
	private int rsituation;
	private int rway;
	private int ringred;
	private int rtime;
	private int rlevel;
	private String rtip;
	private String rstatus;
	
	
	public Menu() {
		super();
	}


	public Menu(int rno, int bno, int uno, String rtitle, String rsource, String rprocess, Date rdate, String rgoods,
			String rcontent, String rvideo, int rkind, int rsituation, int rway, int ringred, int rtime, int rlevel,
			String rtip, String rstatus) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.uno = uno;
		this.rtitle = rtitle;
		this.rsource = rsource;
		this.rprocess = rprocess;
		this.rdate = rdate;
		this.rgoods = rgoods;
		this.rcontent = rcontent;
		this.rvideo = rvideo;
		this.rkind = rkind;
		this.rsituation = rsituation;
		this.rway = rway;
		this.ringred = ringred;
		this.rtime = rtime;
		this.rlevel = rlevel;
		this.rtip = rtip;
		this.rstatus = rstatus;
	}


	public Menu(String rtitle, String rsource, String rprocess, String rgoods, String rcontent, String rvideo,
			int rtime, int rlevel, String rtip) {
		super();
		this.rtitle = rtitle;
		this.rsource = rsource;
		this.rprocess = rprocess;
		this.rgoods = rgoods;
		this.rcontent = rcontent;
		this.rvideo = rvideo;
		this.rtime = rtime;
		this.rlevel = rlevel;
		this.rtip = rtip;
	}


	@Override
	public String toString() {
		return "Menu [rno=" + rno + ", bno=" + bno + ", uno=" + uno + ", rtitle=" + rtitle + ", rsource=" + rsource
				+ ", rprocess=" + rprocess + ", rdate=" + rdate + ", rgoods=" + rgoods + ", rcontent=" + rcontent
				+ ", rvideo=" + rvideo + ", rkind=" + rkind + ", rsituation=" + rsituation + ", rway=" + rway
				+ ", ringred=" + ringred + ", rtime=" + rtime + ", rlevel=" + rlevel + ", rtip=" + rtip + ", rstatus="
				+ rstatus + "]";
	}


	public int getRno() {
		return rno;
	}


	public void setRno(int rno) {
		this.rno = rno;
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


	public String getRtitle() {
		return rtitle;
	}


	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}


	public String getRsource() {
		return rsource;
	}


	public void setRsource(String rsource) {
		this.rsource = rsource;
	}


	public String getRprocess() {
		return rprocess;
	}


	public void setRprocess(String rprocess) {
		this.rprocess = rprocess;
	}


	public Date getRdate() {
		return rdate;
	}


	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


	public String getRgoods() {
		return rgoods;
	}


	public void setRgoods(String rgoods) {
		this.rgoods = rgoods;
	}


	public String getRcontent() {
		return rcontent;
	}


	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}


	public String getRvideo() {
		return rvideo;
	}


	public void setRvideo(String rvideo) {
		this.rvideo = rvideo;
	}


	public int getRkind() {
		return rkind;
	}


	public void setRkind(int rkind) {
		this.rkind = rkind;
	}


	public int getRsituation() {
		return rsituation;
	}


	public void setRsituation(int rsituation) {
		this.rsituation = rsituation;
	}


	public int getRway() {
		return rway;
	}


	public void setRway(int rway) {
		this.rway = rway;
	}


	public int getRingred() {
		return ringred;
	}


	public void setRingred(int ringred) {
		this.ringred = ringred;
	}


	public int getRtime() {
		return rtime;
	}


	public void setRtime(int rtime) {
		this.rtime = rtime;
	}


	public int getRlevel() {
		return rlevel;
	}


	public void setRlevel(int rlevel) {
		this.rlevel = rlevel;
	}


	public String getRtip() {
		return rtip;
	}


	public void setRtip(String rtip) {
		this.rtip = rtip;
	}


	public String getRstatus() {
		return rstatus;
	}


	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}  
	
	
	
	
	
	
	
}
