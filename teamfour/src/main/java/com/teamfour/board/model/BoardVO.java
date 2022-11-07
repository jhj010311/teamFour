package com.teamfour.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private String write_no; /* NUMBER NOT NULL 글번호 */
	private String user_no; /* NUMBER 회원번호 */
	private String title;  /* VARCHAR2(30) NOT NULL 제목 */
	private String writer; /* VARCHAR2(30) NOT NULL 작성자 */
	private Timestamp regdate; /* DATE DEFAULT sysdate 작성일 */
	private String read; /* NUMBER NOT NULL 조회 */
	private String content; /* CLOB 글내용 */
	private String filename; /* VARCHAR2(50) 첨부파일 */
	private String file_size; /* NUMBER 파일크기 */
	
	
	public BoardVO() {
		super();
	}
	
	public BoardVO(String write_no, String user_no, String title, String writer, Timestamp regdate, String read,
			String content, String filename, String file_size) {
		super();
		this.write_no = write_no;
		this.user_no = user_no;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.read = read;
		this.content = content;
		this.filename = filename;
		this.file_size = file_size;
	}

	public String getWrite_no() {
		return write_no;
	}

	public void setWrite_no(String write_no) {
		this.write_no = write_no;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	@Override
	public String toString() {
		return "BoardVO [write_no=" + write_no + ", user_no=" + user_no + ", title=" + title + ", writer=" + writer
				+ ", regdate=" + regdate + ", read=" + read + ", content=" + content + ", filename=" + filename
				+ ", file_size=" + file_size + "]";
	}
}


