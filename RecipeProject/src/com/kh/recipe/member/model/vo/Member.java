package com.kh.recipe.member.model.vo;

import java.sql.Date;

public class Member {
	
   private int mrank;
   private int uno;
   private String utype;
   private String userid;
   private String upwd;
   private String unick;
   private String uadrs;
   private String uphone;
   private Date udate;
   private String mrname;
   private String mstatus;

public Member() {
      super();
      // TODO Auto-generated constructor stub
   }
// 로그인 용
public Member(String userid, String upwd) {
	super();
	this.userid = userid;
	this.upwd = upwd;
}
// 회원가입 용
public Member(String userid, String upwd, String unick, String uadrs, String uphone) {
	super();
	this.userid = userid;
	this.upwd = upwd;
	this.unick = unick;
	this.uadrs = uadrs;
	this.uphone = uphone;
}
// 전체 가져오기 용
 public Member(String mrank ,int uno, String utype, String userid, String upwd, String unick, String uadrs, String uphone,
       Date udate, String mrname, String mstatus) {
    super();
    this.uno = uno;
    this.utype = utype;
    this.userid = userid;
    this.upwd = upwd;
    this.unick = unick;
    this.uadrs = uadrs;
    this.uphone = uphone;
    this.udate = udate;
    this.mrname = mrname;
    this.mstatus = mstatus;
 }




public int getMrank() {
	return mrank;
}
public void setMrank(int mrank) {
	this.mrank = mrank;
}
public int getUno() {

      return uno;
   }

   public void setUno(int uno) {
      this.uno = uno;
   }

   public String getUtype() {
      return utype;
   }

   public void setUtype(String utype) {
      this.utype = utype;
   }

   public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   public String getUpwd() {
      return upwd;
   }

   public void setUpwd(String upwd) {
      this.upwd = upwd;
   }

   public String getUnick() {
      return unick;
   }

   public void setUnick(String unick) {
      this.unick = unick;
   }

   public String getUadrs() {
      return uadrs;
   }

   public void setUadrs(String uadrs) {
      this.uadrs = uadrs;
   }

   public String getUphone() {
      return uphone;
   }

   public void setUphone(String uphone) {
      this.uphone = uphone;
   }

   public Date getUdate() {
      return udate;
   }

   public void setUdate(Date udate) {
      this.udate = udate;
   }

   public String getMrname() {
      return mrname;
   }

   public void setMrname(String mrname) {
      this.mrname = mrname;
   }

   public String getMstatus() {
      return mstatus;
   }

   public void setMstatus(String mstatus) {
      this.mstatus = mstatus;
   }
@Override
public String toString() {
	return "Member [mrank=" + mrank + ", uno=" + uno + ", utype=" + utype + ", userid=" + userid + ", upwd=" + upwd
			+ ", unick=" + unick + ", uadrs=" + uadrs + ", uphone=" + uphone + ", udate=" + udate + ", mrname=" + mrname
			+ ", mstatus=" + mstatus + "]";
}


   

}