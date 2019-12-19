package com.kh.recipe.hidden.battleShipGame.controller;

// 좌표값 저장하는 자료형 클래스

public class Point {
	public int x;
	public int y;
	
	public boolean isChecked;
	
	public Point() {
		isChecked = false;
	}
	
	
	public Point(int x, int y) {
		super();
		this.x = x;
		this.y = y;
		isChecked = false;
	}


	public int getX() {
		return x;
	}


	public void setX(int x) {
		this.x = x;
	}


	public int getY() {
		return y;
	}


	public void setY(int y) {
		this.y = y;
	}


	
	
	public boolean equals(Point temp)
	{
		return (this.x == temp.x && this.y == temp.y);
	}
}
