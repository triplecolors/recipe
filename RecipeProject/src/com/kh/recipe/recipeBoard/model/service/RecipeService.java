package com.kh.recipe.recipeBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.recipe.BoardCommon.model.dao.BFileDAO;
import com.kh.recipe.BoardCommon.model.vo.Bfile;
import com.kh.recipe.recipeBoard.model.dao.RecipeDAO;
import com.kh.recipe.recipeBoard.model.vo.Recipe;

import static com.kh.recipe.common.JDBCTemplate.*;

public class RecipeService {
	private RecipeDAO rDao = new RecipeDAO();
	private BFileDAO fDao = new BFileDAO();
	private Connection con;
	
	public int insertRecipe(Recipe rcp, ArrayList<Bfile> fList) {
		con = getConnection();
		int result = 0;
		int bFileInsertCheck = 0;
		int recipeInsertCheck = rDao.insertRecipe(con, rcp);
		
		if(fList.size()>0 && recipeInsertCheck>1) {
			int currentBno = fDao.selectCurrentBno(con);
			
			for (int i = 0; i < fList.size(); i++) {
				fList.get(i).setBno(currentBno);
			}
			
			bFileInsertCheck = fDao.insertBfile(con, fList);
		}
		if(fList.size() > 0 && recipeInsertCheck>0 && bFileInsertCheck == fList.size()) {
			commit(con);
			result = 1;
		} else if(fList.size() == 0 && recipeInsertCheck>0 ){
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public HashMap<String, Object> selectOne(int bno) {
		con = getConnection();
		HashMap<String, Object> hmap = null; 
		System.out.println("서비스 도착!");
				
		hmap = rDao.selectOne(con, bno);
		
		return hmap;
	}

	public int updateRecipe(Recipe rcp, ArrayList<Bfile> fList) {
		con = getConnection();
		int result = 0;
		
		int result1 = rDao.updateRecipe(con, rcp);
		int result2 = fDao.insertBfile(con, fList);
		int result3 = fDao.deleteBfile(con, rcp.getBno());
		if(result1>0 && result2>0 && result3>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int selectCurrentBno() {
		con = getConnection();
		int result = 0;
		result = fDao.selectCurrentBno(con);
		return result;
	}

}
