package com.kh.recipe.hidden.battleShipGame.controller;

public class SubFunction {

	// 게임 진행시 각종 소소한 기능들을 모아놓은 클래스
	
	public static void makeDelay(int sec) {
		// 화면 전환시 입력밭는 숫자의 초만큼 딜레이 발생
		try {
			Thread.sleep(sec*100); // 1초 대기
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public static void screenTransition(int num) {
	// 입력받은 숫자만큼 줄을 여러번 넘겨서 화면 전환 효과 부여
	for(int i=0;i<num;i++) {
		System.out.print("\n");
	}	
}

}

