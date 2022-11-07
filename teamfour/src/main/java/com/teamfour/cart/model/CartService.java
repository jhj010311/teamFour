package com.teamfour.cart.model;

import java.sql.SQLException;
import java.util.List;

public class CartService {

	private CartDAO dao;

	public CartService() {
		dao = new CartDAO();
	}

	public int insertCart(CartVO vo) throws SQLException {
		return dao.insertCart(vo);
	}

	public List<CartVO> selectCartItem() throws SQLException {
		return dao.selectCartItem();
	}
}
