package com.teamfour.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.userinfo.db.ConnectionPool2;

public class BoardDAO {
	private ConnectionPool2 pool;

	public BoardDAO() {
		pool = new ConnectionPool2();
	}
	
	public List<BoardVO> selectBoard() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<BoardVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			
			String sql = "select * from board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String write_no = rs.getString("write_no");
				String user_no = rs.getString("user_no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				Timestamp regdate = rs.getTimestamp("regdate");
				String read = rs.getString("read");
				String content = rs.getString("content");
				String filename = rs.getString("filename");
				String file_size = rs.getString("file_size");
				
				BoardVO boardVo = new BoardVO(write_no, user_no, 
						title, writer, regdate, read, content, filename, file_size);
				
				list.add(boardVo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
