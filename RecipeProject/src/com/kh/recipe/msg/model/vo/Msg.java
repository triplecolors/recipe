package com.kh.recipe.msg.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Msg implements Serializable{
	
	private int mSender ;     		//발신자
	private int  mReceiver;	  		//수신자	
	private String  mType;   		//알림 종류 ID
	private String  mContent;	//내용
	private Date mSendDate;	//발신일시
	private Date mRecvDate; 	//수신확인
	
	// 기본생성자
	public Msg() {
		super();

	}

	// 사용자 * 생성자
	public Msg(int mSender, int mReceiver, String mType, String mContent, Date mSendDate, Date mRecvDate) {
		super();
		this.mSender = mSender;
		this.mReceiver = mReceiver;
		this.mType = mType;
		this.mContent = mContent;
		this.mSendDate = mSendDate;
		this.mRecvDate = mRecvDate;
		
	
		
	}
	// 작성할때 필요한 생성자

	public Msg(int mSender, int mReceiver, String mContent) {
		super();
		this.mSender = mSender;
		this.mReceiver = mReceiver;
		this.mContent = mContent;
	}
	
	



	@Override
	public String toString() {
		return "Msg [mSender=" + mSender + ", mReceiver=" + mReceiver + ", mType=" + mType + ", mContent=" + mContent
				+ ", mSendDate=" + mSendDate + ", mRecvDate=" + mRecvDate + "]";
	}

	public int getmSender() {
		return mSender;
	}

	public void setmSender(int mSender) {
		this.mSender = mSender;
	}

	public int getmReceiver() {
		return mReceiver;
	}

	public void setmReceiver(int mReceiver) {
		this.mReceiver = mReceiver;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public Date getmSendDate() {
		return mSendDate;
	}

	public void setmSendDate(Date mSendDate) {
		this.mSendDate = mSendDate;
	}

	public Date getmRecvDate() {
		return mRecvDate;
	}

	public void setmRecvDate(Date mRecvDate) {
		this.mRecvDate = mRecvDate;
	}
	
	
	
	
	
	

	
	
	
	
	
}
	