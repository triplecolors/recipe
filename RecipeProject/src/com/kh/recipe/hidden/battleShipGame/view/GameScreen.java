package com.kh.recipe.hidden.battleShipGame.view;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import com.kh.recipe.hidden.battleShipGame.controller.Board;
import com.kh.recipe.hidden.battleShipGame.controller.Point;
import com.kh.recipe.hidden.battleShipGame.controller.SetLocation;
import com.kh.recipe.hidden.battleShipGame.controller.SubFunction;

//화면 출력용 클래스

public class GameScreen {

	Board bd = new Board();
	
	SetLocation sl;
	SetLocation slCom;
	String location_X;
	String location_Y;
	int p_Count,c_Count;
	int target_num;
	boolean isChangedSize = true;
	boolean isChangedTarget = true;
	boolean isPlayerTurn= true;
	
	public void setChangedSize(boolean isChangedSize) {
		this.isChangedSize = isChangedSize;
	}
	public void setChangedTarget(boolean isChangedTarget) {
		this.isChangedTarget = isChangedTarget;
	}

	public void setTarget_num(int target_num) {
		this.target_num = target_num;
	}
	
	public ArrayList<StringBuilder[]>  MainScreen(Menu mn) {

		sl = new SetLocation();
		slCom = new SetLocation();
		if(isChangedSize) {
		bd.setLength(Board.getD_length());
		bd.setWide(Board.getD_wide());
		}else {
		//bd.setLength(bd.getLength());
		//bd.setWide(bd.getWide());
		}
		
		if(isChangedTarget) {
		sl.setSize(SetLocation.target_D);
		slCom.setSize(SetLocation.target_D);
		}else {
		sl.setSize(target_num);
		slCom.setSize(target_num);
		}
		//int size = mn.setAmountLocation();
		//sl.setSize(size);
		//slCom.setSize(size);
		
		bd.defaultBoard(bd.getLength(), bd.getWide());

	
		
		p_Count = sl.getSize();
		c_Count = slCom.getSize();
		/*for(int i = 0;i<sl.getSize();i++) {
			replacePllocation(sl.get, String "☆");
		}
		*/
		
			SubFunction.screenTransition(50);
		ArrayList<StringBuilder[]> list = ScreenOut(bd.getLength(), bd.getWide());
		
		return list;
	}
	public ArrayList<Point[]> randomLocation() {
		
		ArrayList<Point[]> list = new ArrayList<>();;
		sl = new SetLocation();
		slCom = new SetLocation();
		System.out.println(sl.randomLocation(5, 5));
		list.add(sl.randomLocation(5, 5));
		list.add(slCom.randomLocation(5, 5));
		
		return list;
	}
	
	
	public void changeTurn(){	
			if(isPlayerTurn) {
				System.out.println("  플레이어 턴 ! ");
				System.out.printf("  남은 플레이어 타겟 갯수 : %d",p_Count);
				SubFunction.makeDelay(10);
				SubFunction.screenTransition(1);
				//playerInput();
				
			}else {
				System.out.println("  컴퓨터 턴 ! ");
				SubFunction.makeDelay(10);
				SubFunction.screenTransition(1);
				computerInput();
				
			}
		
		SubFunction.screenTransition(20);
		if(p_Count==0) {
			for(int i = 0 ;i<sl.getSize();i++) {
			System.out.println("당신은 Loser입니다!");
			SubFunction.makeDelay(5);
			SubFunction.screenTransition(2);
			}
		}else if(c_Count==0) {
			System.out.println("당신은 Winner입니다!");
			SubFunction.makeDelay(30);
		}
		SubFunction.screenTransition(50);
	}// 메소드 끝

	public void setSize(int width, int length) {
		bd.setWide(width);
		bd.setLength(length);
	}

	public ArrayList<StringBuilder[]>  ScreenOut(int length, int wide) {

		StringBuilder screen = new StringBuilder();
		StringBuilder boundary = new StringBuilder();
		for (int i = 0; i < wide + 2; i++) {
			screen.append("---");
			boundary.append("===");
		}
		System.out.println("Com");
		System.out.println(boundary);
		for (int i = 1; i < wide + 1; i++) {
			System.out.print(" " + (char) (i + 64) + " ");
		}
		System.out.println();
		System.out.println(boundary);

		for (int i = 0; i < bd.getArrP1().length; i++) {
			System.out.println(bd.getArrP1()[i]);

		}

		System.out.println(screen); // 가림판

		for (int i = 0; i < bd.getArrP2().length; i++) {
			System.out.println(bd.getArrP2()[i]);
		}
		System.out.println(boundary);
		for (int i = 1; i < wide + 1; i++) {
			System.out.print(" " + (char) (i + 64) + " ");
		}
		System.out.println();

		System.out.println(boundary);
		System.out.println("Player");
		System.out.println();
		ArrayList<StringBuilder[]> list = new ArrayList<StringBuilder[]>();
		
		list.add(bd.getArrP1());
		list.add(bd.getArrP2());
		
		return list;
	}

	public void inputUserLocation() {
		Scanner sc = new Scanner(System.in);
		System.out.println();
		System.out.print(" X 좌효 입력(A-Z) : ");
		location_X = sc.next().toUpperCase();
		System.out.print(" Y 좌효 입력 () : ");
		location_Y = sc.next();		
	}
	
	public StringBuilder[] computerInput() {
		Random rn = new Random();
		
		Point plCom;
		int x;
		int y;
		do
		{
			x = rn.nextInt(bd.getWide());
			y = rn.nextInt(bd.getLength());
		} while (bd.isChecked(x, y, isPlayerTurn));
		plCom = new Point(x , y);
		
		if (bd.isChecked(plCom.x, plCom.y, isPlayerTurn))
		{
			System.out.println("이미 체크된 좌표입니다.");
			SubFunction.makeDelay(20);
		}else if(sl.isExist(plCom, sl.getSize())) {
			System.out.println();
			System.out.println("       명중!");
			
			bd.replacePl(plCom.x,  plCom.y, " X ");
			
			SubFunction.makeDelay(20);
			SubFunction.screenTransition(20);
			p_Count-=1;
			
		}else {
			System.out.println();
			System.out.println("       헛방입니다!");
			bd.replacePl(plCom.x,  plCom.y, " ■ ");
			SubFunction.makeDelay(20);
			SubFunction.screenTransition(20);

			isPlayerTurn = !isPlayerTurn;
			
	}
		return bd.getArrP2();
	}
	
	public StringBuilder[] playerInput(int x, int y,ArrayList<StringBuilder[]> list) {
		//inputUserLocation();
		Point pl = new Point(x,y);
		if (bd.isChecked(pl.x, pl.y, isPlayerTurn))
		{
			System.out.println("이미 체크된 좌표입니다.");
			SubFunction.makeDelay(20);
		}
		else if(slCom.isExist(pl, slCom.getSize())) {
			System.out.println();
			System.out.println("       명중!");
			
			bd.replaceCom(pl.x,  pl.y, " X ");
			
			SubFunction.makeDelay(20);
			SubFunction.screenTransition(20);
			c_Count-=1;
			
		}else {
			System.out.println();
			System.out.println("       헛방입니다!");
			bd.replaceCom(pl.x,  pl.y, " ■ ");
			SubFunction.makeDelay(20);
			SubFunction.screenTransition(20);

			isPlayerTurn = !isPlayerTurn;
		}
		return bd.getArrP1();
	}
	
	

} // class 끝
