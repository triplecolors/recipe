package com.kh.recipe.hidden.battleShipGame.controller;

public class Board {

	// 게임판 구성요소 클래스
	

	private StringBuilder[] arrP1;
	private StringBuilder[] arrP2;
	private int wide; // 보드 폭 조절용 변수 기본설정은 13
	private int length;
	private static final int d_wide = 5;
	private static final int d_length = 5;
	
	

	public Board() {}
	
	public Board(StringBuilder[] arrP1, StringBuilder[] arrP2) {
		super();
		this.arrP1 = arrP1;
		this.arrP2 = arrP2;
	}
	
	public Board(StringBuilder[] arrP1, StringBuilder[] arrP2, int wide, int length) {
		super();
		this.arrP1 = arrP1;
		this.arrP2 = arrP2;
		this.wide = wide;
		this.length = length;
	}
	
	public int getWide() {
		return wide;
	}

	public void setWide(int wide) {
		this.wide = wide;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public Board(int size) {
		arrP1 = new StringBuilder[size];
		arrP2 = new StringBuilder[size];
		
	}

	public StringBuilder[] getArrP1() {
		return arrP1;
	}

	public void setArrP1(StringBuilder[] arrP1) {
		this.arrP1 = arrP1;
	}

	public StringBuilder[] getArrP2() {
		return arrP2;
	}

	public void setArrP2(StringBuilder[] arrP2) {
		this.arrP2 = arrP2;
	}

	public static int getD_wide() {
		return d_wide;
	}
	
	public static int getD_length() {
		return d_length;
	}
//□ ■ ▣

	public void defaultBoard(int length , int wide) {
		 arrP1 = new StringBuilder[length];
		 arrP2 = new StringBuilder[length];
		
		for (int i = 0; i < arrP1.length; i++) {
			arrP1[i] = new StringBuilder();
			arrP2[i] = new StringBuilder();
			for (int j = 0; j < wide; j++) {
				
				arrP1[i] = arrP1[i].append(" □ ");
				arrP2[i] = arrP2[i].append(" □ ");	
				if(j==wide-1) {
					arrP1[i] = arrP1[i].append(" | " + (i+1));
					arrP2[i] = arrP2[i].append(" | " + (arrP1.length-i));	
				}
			}
		}
		

	}//inputBoard 끝

	public void replacePl(int x, int y, String newStr)
	{
		int destX = x * 3 + 1;
		arrP2[arrP2.length-y-1].replace(destX-1, destX+2, newStr);
	}
	public void replaceCom(int x, int y, String newStr)
	{
		int destX = x * 3 + 1;
		arrP1[y].replace(destX-1, destX+2, newStr);
	}
	
	public boolean isChecked(int x, int y, boolean isPlayer)
	{
		if (isPlayer)
		{
			int destX = x * 3 + 1;
			return (arrP1[y].charAt(destX) != '□');
		}
		else
		{
			int destX = x * 3 + 1;
			return (arrP2[arrP2.length-y-1].charAt(destX) != '□');
		}
	}
	public void replacePllocation(int x, int y, String newStr)
	{
		int destX = x * 3 + 1;
		arrP2[arrP2.length-y-1].replace(destX-1, destX+2, newStr);
	}
	
}
