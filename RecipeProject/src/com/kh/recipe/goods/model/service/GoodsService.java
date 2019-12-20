package com.kh.recipe.goods.model.service;

import static com.kh.recipe.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import com.kh.recipe.goods.model.dao.GoodsDAO;
import com.kh.recipe.goods.model.vo.Goods;


public class GoodsService {
	private GoodsDAO gDao = new GoodsDAO();
	Connection con;
	
	public int insertRecipe(Goods g) {
		int result = 0;
		con = getConnection();
		
		result = gDao.insertRecipe(con, g);
		
		if(result>1) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Goods> selectProducts() {
		ArrayList<Goods> goodsList = null;
		con = getConnection();
		
		goodsList = gDao.selectProducts(con);
		System.out.println(goodsList);
		close(con);
		return goodsList;
	}

	public Goods selectOne(int pcid) {
		Goods gd = null;
		con = getConnection();
		
		gd = gDao.selectOne(con, pcid);
		
		return gd;
	}

	public int updateProduct(Goods gd) {
		con = getConnection();
		int result = 0;
		
		result = gDao.updateProduct(con, gd);
		
		if(result > 1) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int deleteGoods(int pcid) {
	    con = getConnection();
	    
	    int result = gDao.deleteGoods(con, pcid);
	    
	    if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con); 
		return result;
	}

	public ArrayList<Goods> goodsselect(String goodsName) {
		con = getConnection();
		
		ArrayList<Goods> list = gDao.goodsselect(con,goodsName);
		
		close(con);
		
		return list;
	}

	

}
