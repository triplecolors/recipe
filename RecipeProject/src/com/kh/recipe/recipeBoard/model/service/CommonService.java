package com.kh.recipe.recipeBoard.model.service;

import static com.kh.recipe.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.Map;

import com.kh.recipe.recipeBoard.model.dao.commonDAO;


public class CommonService {
	private commonDAO cDao = new commonDAO();
	Connection con;
	
	
	public Map<Integer, Map<Integer, String>> selectCate() {
		con = getConnection();
		Map<Integer, Map<Integer, String>> catelist = cDao.selectCate(con);
		close(con);
		return catelist;
	}

}
