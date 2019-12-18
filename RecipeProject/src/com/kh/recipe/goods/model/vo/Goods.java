package com.kh.recipe.goods.model.vo;

public class Goods {
	// PRODUCT
	private int pcid;
	private int pcgtype;
	private int uno;
	private String pcname;
	private String pcfname;
	private String pcfpath;
	
	// PCATEGORY
	private String pcgname;
	
	// SALE
	private String pcurl;

	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 등록 용
	public Goods(int pcgtype, int uno, String pcname, String pcfname, String pcfpath, String pcurl) {
		super();
		this.pcgtype = pcgtype;
		this.uno = uno;
		this.pcname = pcname;
		this.pcfname = pcfname;
		this.pcfpath = pcfpath;
		this.pcurl = pcurl;
	}

	// 전체용 
	public Goods(int pcid, int pcgtype, int uno, String pcname, String pcfname, String pcfpath, String pcgname,
			String pcurl) {
		super();
		this.pcid = pcid;
		this.pcgtype = pcgtype;
		this.uno = uno;
		this.pcname = pcname;
		this.pcfname = pcfname;
		this.pcfpath = pcfpath;
		this.pcgname = pcgname;
		this.pcurl = pcurl;
	}

	@Override
	public String toString() {
		return "Goods [pcid=" + pcid + ", pcgtype=" + pcgtype + ", uno=" + uno + ", pcname=" + pcname + ", pcfname="
				+ pcfname + ", pcfpath=" + pcfpath + ", pcgname=" + pcgname + ", pcurl=" + pcurl + "]";
	}

	public int getPcid() {
		return pcid;
	}

	public void setPcid(int pcid) {
		this.pcid = pcid;
	}

	public int getPcgtype() {
		return pcgtype;
	}

	public void setPcgtype(int pcgtype) {
		this.pcgtype = pcgtype;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getPcname() {
		return pcname;
	}

	public void setPcname(String pcname) {
		this.pcname = pcname;
	}

	public String getPcfname() {
		return pcfname;
	}

	public void setPcfname(String pcfname) {
		this.pcfname = pcfname;
	}

	public String getPcfpath() {
		return pcfpath;
	}

	public void setPcfpath(String pcfpath) {
		this.pcfpath = pcfpath;
	}

	public String getPcgname() {
		return pcgname;
	}

	public void setPcgname(String pcgname) {
		this.pcgname = pcgname;
	}

	public String getPcurl() {
		return pcurl;
	}

	public void setPcurl(String pcurl) {
		this.pcurl = pcurl;
	}
	
}
