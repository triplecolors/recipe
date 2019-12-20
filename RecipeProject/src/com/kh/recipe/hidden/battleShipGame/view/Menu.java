package com.kh.recipe.hidden.battleShipGame.view;

import java.util.Scanner;

import com.kh.recipe.hidden.battleShipGame.controller.*;


public class Menu {

	Scanner sc = new Scanner(System.in);
	
	public void bootScreen() {
		StringBuilder arrBoot = new StringBuilder(" ㅁ  ");
		SubFunction.screenTransition(5);
		System.out.println("                 Loading ...");
		for (int i = 0; i < 15; i++) {
			if (i == 9 || i == 10) {
				System.out.print(arrBoot);
				SubFunction.makeDelay(30);
			} else if (i > 10) {
				System.out.print(arrBoot);
				SubFunction.makeDelay(1);
			} else {
				System.out.print(arrBoot);
				SubFunction.makeDelay(10);
			}
		}
		
		System.out.println();
		System.out.println("             Loading Complete!");
		SubFunction.makeDelay(20);
		SubFunction.screenTransition(100);

		System.out.println("  =======================================================");
		SubFunction.makeDelay(3);
		System.out.println("  =======================================================");
		SubFunction.makeDelay(3);
		System.out.println("      ____        __  __  __        _____ __    _       ");
		SubFunction.makeDelay(3);
		System.out.println("     / __ )____ _/ /_/ /_/ /__     / ___// /_  (_)___   ");
		SubFunction.makeDelay(3);
		System.out.println("    / __  / __ `/ __/ __/ / _ \\   | |__ / __ \\ / / _  \\   ");
		SubFunction.makeDelay(3);
		System.out.println("   / /_/ / /_/ / /_/ /_/ /  __/   ___/ / / / // / /_/ /   ");
		SubFunction.makeDelay(3);
		System.out.println("  /_____/|__,_/|__/|__/_/|___/   /____/_/ /_//_/ .___/   ");
		SubFunction.makeDelay(3);
		System.out.println("                                               /_/         ");
		SubFunction.makeDelay(3);
		System.out.println("  =======================================================");
		SubFunction.makeDelay(3);
		System.out.println("  =======================================================");

		for (int i = 0; i < 4; i++) {
			SubFunction.makeDelay(3);
			System.out.println();
		}
		System.out.println("                    - Press Enter - ");

		for (int i = 0; i < 6; i++) {
			SubFunction.makeDelay(3);
			System.out.println();
		}
	
		sc.nextLine();
		SubFunction.screenTransition(70);
	}

	public int mainMenu() {

		System.out.println(" _____     _   _   _     _____ _   _     ");
		System.out.println("| __  |___| |_| |_| |___|   __| |_|_|___ ");
		System.out.println("| __ -| .'|  _|  _| | -_|__   |   | | . |");
		System.out.println("|_____|__,|_| |_| |_|___|_____|_|_|_|  _|");
		System.out.println("                                    |_|  ");
		System.out.println("   BattleShip ver.1.0        \n ");
		System.out.println("  1. 게임 실행");
		System.out.println("  2. 타깃 갯수 설정 변경");
		System.out.println("  3. 보드 사이즈 변경");
		System.out.println("  4. 게임 종료 ");
		//System.out.println("  5. ??????");
		System.out.println("------------------------------------");
		System.out.print("    메뉴 선택 : ");
		int sel = sc.nextInt();
		return sel;
	}

	public void switchSize(GameScreen gs) {
		int sel;
		System.out.println("1. 사이즈 초기화 (5*5) ");
		System.out.println("2. 사이즈  사용자 설정 ");
		do {
			System.out.print(" 메뉴 선택 : ");
			sel = sc.nextInt();
			switch (sel) {
			case 1:
				System.out.println();
				System.out.println("가로길이 5, 세로길이 5로 초기화되었습니다.");
				SubFunction.makeDelay(5);
				SubFunction.screenTransition(5);
				gs.setChangedSize(true);
				return;

			case 2:
				System.out.print("가로 길이 입력 : ");
				int width = sc.nextInt();
				System.out.print("세로 길이 입력 : ");
				int length = sc.nextInt();
				System.out.printf("가로 길이 %d칸, 세로길이 %d칸 으로 설정되었습니다.", width, length);
				gs.setSize(width, length);
				SubFunction.makeDelay(15);
				SubFunction.screenTransition(5);
				gs.setChangedSize(false);
				return;

			default:
				System.out.println("1~2 둘중에서만 입력해 주세요.");
			}
		} while (true);
	}

	public void setAmountLocation(GameScreen gs) {

		System.out.println("1. 타깃 갯수 초기화 (기본 : 7개) ");
		System.out.println("2. 타깃 갯수  사용자 설정 ");
		do {
			System.out.print(" 메뉴 선택 : ");
			int sel = sc.nextInt();
			switch (sel) {
			case 1:
				System.out.println(" 타깃 갯수가 7개로 초기화 되었습니다.");
				SubFunction.makeDelay(20);
				gs.setChangedTarget(true);
				return;
			case 2:
				System.out.print("설정말 타깃의 갯수를 입력해 주세요 : ");
				int target_Num = sc.nextInt();
				gs.setTarget_num(target_Num);
				gs.setChangedTarget(false);
				return;
			default:
				System.out.println(" 1~2 둘중에서만 입력해 주세요.");
			}
		} while (true);

	}
}
