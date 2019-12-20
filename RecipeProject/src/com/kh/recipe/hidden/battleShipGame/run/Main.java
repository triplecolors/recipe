package com.kh.recipe.hidden.battleShipGame.run;

import java.util.Scanner;

import com.kh.recipe.hidden.battleShipGame.controller.SubFunction;
import com.kh.recipe.hidden.battleShipGame.view.GameScreen;
import com.kh.recipe.hidden.battleShipGame.view.Menu;


public class Main {

	public static void main(String[] args) {
	
		// 메인 메소드
		Menu mn = new Menu();
		Scanner sc =new Scanner(System.in);
		GameScreen gs = new GameScreen();
		
		
		mn.bootScreen(); // 부팅화면 
		do {
		
		int sel = mn.mainMenu();
		switch(sel) {
		case 1:		// 게임 실행
			gs.MainScreen(mn);
			
			break;
		case 2:		// 타깃 갯수 설정 변경
			mn.setAmountLocation(gs);
			
			break;
		case 3:		// 보드 사이즈 변경
			mn.switchSize(gs);
			break;
		case 4:
		    System.out.println("배틀쉽 게임을 종료합니다.");
			SubFunction.makeDelay(5);
			SubFunction.screenTransition(5);
			return;
			
		default:
			SubFunction.screenTransition(2);
			System.out.println("1~4 사이에서 입력해주세요.");
			SubFunction.makeDelay(30);
			SubFunction.screenTransition(20);
			continue;
		}
		
		}while(true);
	}

}
