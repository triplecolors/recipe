package com.kh.recipe.recipeBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.recipe.recipeBoard.model.dao.MenuDAO;
import com.kh.recipe.recipeBoard.model.vo.Menu;

import static com.kh.recipe.common.JDBCTemplate.*;

public class MenuSearchService {
	private Connection con;
	private MenuDAO mdao = new MenuDAO();
	

	public ArrayList<Menu> selectList(int currentPage, int limit) {
		con = getConnection();
		
		// 게시글 시작값과 끝 미리 계산하기
		int startRow = (currentPage - 1) * limit;
		int endRow = startRow + 10;
		
		ArrayList<Menu> list = mdao.selectList(con, startRow, endRow);
		return null;
	}
	


	public int getListCount() {
	con = getConnection();
	
	int result = mdao.getListCount(con);
	
	close(con);
	
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectList(String[] keywordArr, String word, int part) {
		con = getConnection();
		System.out.println("keywordArr"+keywordArr);
		System.out.println("word"+word);
		System.out.println("part"+part);
		ArrayList<HashMap<String, Object>> list = mdao.selectSearchList(con, keywordArr, word, part);
		
		close(con);
		
		return list;
	}

	
	


}
