package com.teamfour.orderinfo.model;

import java.sql.SQLException;
import java.util.List;

import com.teamfour.productAll.model.ProductAllVO;

public class OrderinfoService {
	private OrderinfoDAO dao;
	public OrderinfoService() {
		dao = new OrderinfoDAO();
	}
	
	public ProductAllVO detailViewPdCode(int pdcode) throws SQLException{
		return dao.detailViewPdCode(pdcode);
	}
	public List<ProductAllVO> selectByMaincode(int maincode) throws SQLException{
		return dao.selectByMaincode(maincode);
	}
	
	public List<ProductAllVO> selectAllPd() throws SQLException{
		return dao.selectAllPd();
	}
}
