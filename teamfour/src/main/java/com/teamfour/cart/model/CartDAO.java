package com.teamfour.cart.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.userinfo.db.ConnectionPool2;

public class CartDAO {

	private ConnectionPool2 pool;

	public CartDAO() {
		pool=new ConnectionPool2();
	}
	
	/**
	 * 카트 저장
	 * @param carVo
	 * @return
	 * @throws SQLException
	 */
	public int insertCart(CartVO carVo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		System.out.println(carVo);
		
		try {
			con=pool.getConnection();
			
			String sql="insert into CART(CARTNO, PDCODE, QTY, USER_NO)"
				+ " values(cart_seq.nextval,?,?,1)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, carVo.getPdcode());
			ps.setInt(2, carVo.getQty());
			
			int cnt=ps.executeUpdate();
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 장바구니 조회
	 * @return
	 * @throws SQLException
	 */
	public List<CartVO> selectCartItem() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<CartVO> list = new ArrayList<>();
		CartVO cartVO = null;
		try {
			con = pool.getConnection();
			
			String sql = "SELECT A.PDCODE AS pdcode\r\n"
					+ "	 , A.CARTNO AS cartNo\r\n"
					+ "	 , A.QTY AS qty \r\n"
					+ "	 , A.USER_NO AS userNo\r\n"
					+ "	 , B.PRICE AS price\r\n"
					+ "	 , B.PDNAME AS pdName\r\n"
					+ "	 , B.IMAGE AS image\r\n"
					+ "	 , B.price * B.qty AS totalprice\r\n"
					+ "  FROM CART A\r\n"
					+ " INNER JOIN PRODUCTLIST B \r\n"
					+ "    ON A.PDCODE = B.PDCODE";
			ps = con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				cartVO = new CartVO();
				cartVO.setPdcode(rs.getInt("pdcode"));
				cartVO.setCartNo(rs.getInt("cartno"));
				cartVO.setQty(rs.getInt("qty"));
				cartVO.setUserNo(rs.getInt("userNo"));
				cartVO.setPrice(rs.getInt("price"));
				cartVO.setPdName(rs.getString("pdName"));
				cartVO.setImage(rs.getString("image"));
				cartVO.setTotalprice(rs.getInt("totalprice"));
				list.add(cartVO);
			}
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int deleteCart(int cartno) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from cart where cartno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, cartno);
			
			int cnt=ps.executeUpdate();
			System.out.println("상품 삭제결과 cnt="+cnt+", 매개변수 cartno"+cartno);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}

	
}
