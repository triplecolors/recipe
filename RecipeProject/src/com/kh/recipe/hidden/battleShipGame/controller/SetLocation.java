package com.kh.recipe.hidden.battleShipGame.controller;

import java.util.Random;

public class SetLocation {

	
	// 랜덤좌표 생성해주는 클래스
	public static final int target_D = 7;
	
	
	private Point[] pt;
	private int size;
	
	
	public int getSize() { 
		return size; 
		}
	public void setSize(int s) { 
		size = s; 
		pt = new Point[size];
		}

	public SetLocation() {
	
	}
	
	
	
	public SetLocation(int size) {
		super();
		this.pt = new Point[size];
	}
	

	public Point[] randomLocation(int rangeX,int rangeY) {
		Random rn = new Random();
		pt = new Point[5];
		for(int i = 0 ;i<4; i++) {
			int x = rn.nextInt(rangeX);
			int y = rn.nextInt(rangeY);
			pt[i] = new Point(x, y);
			
			if (isExist(pt[i], i))
				i--;
		}
		
		return pt;
	}
	
	public boolean isChecked(Point p)
	{
		for (int i = 0; i < pt.length; ++i)
		{
			if (p.equals(pt[i]))
				return pt[i].isChecked;
		}
		
		return false;
	}
	
	public boolean isExist(Point p, int endIndex)
	{
		for (int i = 0; i < endIndex; ++i)
		{
			if (p.equals(pt[i]))
			{
				pt[i].isChecked = true;
				return true;
			}
		}
		return false;
	}
	
	
}
