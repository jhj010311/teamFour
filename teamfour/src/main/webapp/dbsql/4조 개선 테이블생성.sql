/* ȸ�� */
CREATE TABLE userinfo (
	user_no NUMBER NOT NULL, /* ȸ����ȣ */
	user_name VARCHAR2(20) NOT NULL, /* ȸ���� */
	user_nick VARCHAR2(30) NOT NULL, /* �г��� */
	user_id VARCHAR2(30) NOT NULL, /* ���̵� */
	user_pwd VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	user_tel VARCHAR2(30) NOT NULL, /* ����ó */
	user_email VARCHAR2(50) NOT NULL, /* �̸��� */
	user_address VARCHAR2(80) NOT NULL, /* �ּ� */
	user_joindate DATE DEFAULT sysdate /* ���Գ�¥ */
);

CREATE unique index idx_userinfo
ON userinfo (user_no);

ALTER TABLE userinfo
ADD	CONSTRAINT PK_userinfo
PRIMARY KEY (user_no);

create sequence userinfo_seq
start with 1
increment by 1
nocache;

COMMENT ON TABLE userinfo IS 'ȸ��';

COMMENT ON COLUMN userinfo.user_no IS 'ȸ����ȣ';

COMMENT ON COLUMN userinfo.user_name IS 'ȸ����';

COMMENT ON COLUMN userinfo.user_nick IS '�г���';

COMMENT ON COLUMN userinfo.user_id IS '���̵�';

COMMENT ON COLUMN userinfo.user_pwd IS '��й�ȣ';

COMMENT ON COLUMN userinfo.user_tel IS '����ó';

COMMENT ON COLUMN userinfo.user_email IS '�̸���';

COMMENT ON COLUMN userinfo.user_address IS '�ּ�';

COMMENT ON COLUMN userinfo.user_joindate IS '���Գ�¥';

/* ��ǰ��� */
CREATE TABLE ProductList (
	pdcode NUMBER NOT NULL, /* ��ǰ�ڵ� */
	pdname VARCHAR2(30) NOT NULL, /* ��ǰ�� */
	price NUMBER NOT NULL, /* ���� */
	regdate DATE DEFAULT sysdate NOT NULL, /* ����� */
	seller_no NUMBER NOT NULL, /* �Ǹ��ڹ�ȣ */
	image VARCHAR2(200) NOT NULL, /* �̹��� */
	detail CLOB NOT NULL, /* �󼼼��� */
	div_no NUMBER NOT NULL /* �Һз��ڵ� */
);

CREATE UNIQUE INDEX idx_ProductList
	ON ProductList (pdcode);

ALTER TABLE ProductList
	ADD	CONSTRAINT PK_ProductList
		PRIMARY KEY (pdcode	);
        
COMMENT ON TABLE ProductList IS '��ǰ���';

COMMENT ON COLUMN ProductList.pdcode IS '��ǰ�ڵ�';

COMMENT ON COLUMN ProductList.pdname IS '��ǰ��';

COMMENT ON COLUMN ProductList.price IS '����';

COMMENT ON COLUMN ProductList.regdate IS '�����';

COMMENT ON COLUMN ProductList.seller_no IS '�Ǹ��ڹ�ȣ';

COMMENT ON COLUMN ProductList.image IS '�̹���';

COMMENT ON COLUMN ProductList.detail IS '�󼼼���';

COMMENT ON COLUMN ProductList.div_no IS '�Һз��ڵ�';

/* ��ǰ��з� */
CREATE TABLE mainproduct (
	maincode NUMBER NOT NULL, /* ��з��ڵ� */
	mainname VARCHAR2(30) NOT NULL /* ��з��̸� */
);

CREATE UNIQUE INDEX idx_mainproduct
	ON mainproduct (maincode);

ALTER TABLE mainproduct
	ADD CONSTRAINT PK_mainproduct
		PRIMARY KEY (maincode);
        
COMMENT ON TABLE mainproduct IS '��ǰ��з�';

COMMENT ON COLUMN mainproduct.maincode IS '��з��ڵ�';

COMMENT ON COLUMN mainproduct.mainname IS '��з��̸�';


/* ��ǰ�Һз� */
CREATE TABLE subproduct (
	div_no NUMBER NOT NULL, /* �Һз��ڵ� */
	subproduct_name VARCHAR2(50) NOT NULL, /* ��ǰ�� */
	maincode NUMBER NOT NULL /* ��з��ڵ� */
);

CREATE UNIQUE INDEX idx_subproduct
	ON subproduct (div_no);

ALTER TABLE subproduct
	ADD	CONSTRAINT PK_subproduct
		PRIMARY KEY (div_no);
        
COMMENT ON TABLE subproduct IS '��ǰ�Һз�';

COMMENT ON COLUMN subproduct.div_no IS '�Һз��ڵ�';

COMMENT ON COLUMN subproduct.subproduct_name IS '��ǰ��';

COMMENT ON COLUMN subproduct.maincode IS '��з��ڵ�';



/* �ֹ����� */
CREATE TABLE orderinfo (
	order_no NUMBER NOT NULL, /* �ֹ���ȣ */
	user_no NUMBER NOT NULL, /* ȸ����ȣ */
	pdcode NUMBER NOT NULL, /* ��ǰ�ڵ� */
	orderdate DATE DEFAULT sysdate, /* �ֹ��� */
	qty NUMBER NOT NULL, /* ��ǰ���� */
	totalprice NUMBER NOT NULL, /* �ѱݾ� */
	del_name VARCHAR2(20) NOT NULL, /* ��۹޴»���̸� */
	del_tel VARCHAR2(20) NOT NULL, /* ��۹޴¿���ó */
	del_add VARCHAR2(40) NOT NULL, /* ��۹޴��ּ� */
	del_deadd VARCHAR2(40) NOT NULL, /* ��۹޴»��ּ� */
	del_email VARCHAR2(30) NOT NULL, /* ��۹޴��̸��� */
	refund_mgno NUMBER /* ȯ�ҹ�ȣ */
);
CREATE UNIQUE INDEX idx_order
	ON orderinfo (order_no);

ALTER TABLE orderinfo
	ADD	CONSTRAINT PK_order
		PRIMARY KEY (order_no);
        
create sequence orderinfo_seq
start with 1
increment by 1
nocache;

COMMENT ON TABLE orderinfo IS '�ֹ�����';

COMMENT ON COLUMN orderinfo.order_no IS '�ֹ���ȣ';

COMMENT ON COLUMN orderinfo.user_no IS 'ȸ����ȣ';

COMMENT ON COLUMN orderinfo.pdcode IS '��ǰ�ڵ�';

COMMENT ON COLUMN orderinfo.orderdate IS '�ֹ���';

COMMENT ON COLUMN orderinfo.qty IS '��ǰ����';

COMMENT ON COLUMN orderinfo.totalprice IS '�ѱݾ�';

COMMENT ON COLUMN orderinfo.del_name IS '��۹޴»���̸�';

COMMENT ON COLUMN orderinfo.del_tel IS '��۹޴¿���ó';

COMMENT ON COLUMN orderinfo.del_add IS '��۹޴��ּ�';

COMMENT ON COLUMN orderinfo.del_deadd IS '��۹޴»��ּ�';

COMMENT ON COLUMN orderinfo.del_email IS '��۹޴��̸���';

COMMENT ON COLUMN orderinfo.refund_mgno IS 'ȯ�ҹ�ȣ';


/* ���ǰԽ��� */
CREATE TABLE board (
	write_no NUMBER NOT NULL, /* �۹�ȣ */
	user_no NUMBER, /* ȸ����ȣ */
	title VARCHAR2(30) NOT NULL, /* ���� */
	writer VARCHAR2(30) NOT NULL, /* �ۼ��� */
	regdate DATE DEFAULT sysdate, /* �ۼ��� */
	read NUMBER NOT NULL, /* ��ȸ */
	content CLOB, /* �۳��� */
	filename VARCHAR2(50), /* ÷������ */
	file_size NUMBER /* ���ϻ����� */
);

CREATE UNIQUE INDEX idx_board
	ON board (write_no);

ALTER TABLE board
	ADD	CONSTRAINT PK_board
		PRIMARY KEY (write_no);
        
create sequence board_seq
start with 1
increment by 1
nocache;

COMMENT ON TABLE board IS '���ǰԽ���';

COMMENT ON COLUMN board.write_no IS '�۹�ȣ';

COMMENT ON COLUMN board.user_no IS 'ȸ����ȣ';

COMMENT ON COLUMN board.title IS '����';

COMMENT ON COLUMN board.writer IS '�ۼ���';

COMMENT ON COLUMN board.regdate IS '�ۼ���';

COMMENT ON COLUMN board.read IS '��ȸ';

COMMENT ON COLUMN board.content IS '�۳���';

COMMENT ON COLUMN board.filename IS '÷������';

COMMENT ON COLUMN board.file_size IS '���ϻ�����';

/* ��ٱ��� */
CREATE TABLE cart (
	cartno NUMBER, /* ��ȣ */
	pdcode NUMBER, /* ��ǰ�ڵ� */
	qty NUMBER, /* ���� */
	user_no NUMBER /* ȸ����ȣ */
    
);

create sequence cart_seq
start with 1
increment by 1
nocache;

COMMENT ON TABLE cart IS '��ٱ���';

COMMENT ON COLUMN cart.cartno IS '��ȣ';

COMMENT ON COLUMN cart.pdcode IS '��ǰ�ڵ�';

COMMENT ON COLUMN cart.qty IS '����';

COMMENT ON COLUMN cart.user_no IS 'ȸ����ȣ';

/* �ֱ� �� ��ǰ */
CREATE TABLE recent (
	recent_no NUMBER NOT NULL, /* �ֱٺ���ǰ��ȣ */
	user_no NUMBER NOT NULL, /* ȸ����ȣ */
	pdcode NUMBER NOT NULL /* ��ǰ�ڵ� */
);

CREATE UNIQUE INDEX PK_recent
	ON recent (recent_no);

ALTER TABLE recent
	ADD	CONSTRAINT PK_recent
		PRIMARY KEY (recent_no);

create sequence recent_seq
start with 1
increment by 1
nocache;

COMMENT ON TABLE recent IS '�ֱ� �� ��ǰ';

COMMENT ON COLUMN recent.recent_no IS '�ֱٺ���ǰ��ȣ';

COMMENT ON COLUMN recent.user_no IS 'ȸ����ȣ';

COMMENT ON COLUMN recent.pdcode IS '��ǰ�ڵ�';

/* �Ǹ��� */
CREATE TABLE sellorinfo (
	sellor_no NUMBER NOT NULL, /* �Ǹ��ڹ�ȣ */
	sellor_name VARCHAR2(20) NOT NULL, /* �Ǹ��ڸ� */
	sellor_nic VARCHAR2(30) NOT NULL, /* �г��� */
	sellor_id VARCHAR2(30) NOT NULL, /* �Ǹ��ھ��̵� */
	sellor_pwd VARCHAR2(30) NOT NULL, /* �ǹ��ں�й�ȣ */
	sellor_tel VARCHAR2(30) NOT NULL, /* �Ǹ��ڿ���ó */
	sellor_email VARCHAR2(50) NOT NULL, /* �Ǹ����̸��� */
	sellor_address VARCHAR2(80) NOT NULL, /* �Ǹ����ּ� */
	sellor_joindate DATE DEFAULT sysdate /* ���Գ�¥ */
);

CREATE UNIQUE INDEX idx_sellorinfo
	ON sellorinfo (	sellor_no );

ALTER TABLE sellorinfo
	ADD	CONSTRAINT PK_sellorinfo
		PRIMARY KEY (sellor_no);
        
create sequence sellorinfo_seq
start with 100000000
increment by 1
nocache;

COMMENT ON TABLE sellorinfo IS '�Ǹ���';

COMMENT ON COLUMN sellorinfo.sellor_no IS '�Ǹ��ڹ�ȣ';

COMMENT ON COLUMN sellorinfo.sellor_name IS '�Ǹ��ڸ�';

COMMENT ON COLUMN sellorinfo.sellor_nic IS '�г���';

COMMENT ON COLUMN sellorinfo.sellor_id IS '�Ǹ��ھ��̵�';

COMMENT ON COLUMN sellorinfo.sellor_pwd IS '�ǹ��ں�й�ȣ';

COMMENT ON COLUMN sellorinfo.sellor_tel IS '�Ǹ��ڿ���ó';

COMMENT ON COLUMN sellorinfo.sellor_email IS '�Ǹ����̸���';

COMMENT ON COLUMN sellorinfo.sellor_address IS '�Ǹ����ּ�';

COMMENT ON COLUMN sellorinfo.sellor_joindate IS '���Գ�¥';

/* ȯ�� ���� */
CREATE TABLE refund_manage (
	refund_mgno NUMBER NOT NULL, /* ȯ�ҹ�ȣ */
	order_no NUMBER NOT NULL, /* �ֹ���ȣ */
	refund_state VARCHAR2(30) DEFAULT 'ȯ�Ҵ��', /* ó������ */
	refund_resson VARCHAR2(100) NOT NULL /* ȯ�һ��� */
);

CREATE UNIQUE INDEX idx_refund_manage
	ON refund_manage (refund_mgno);
 
ALTER TABLE refund_manage
	ADD	CONSTRAINT PK_refund_manage
		PRIMARY KEY (refund_mgno);
        
create sequence refund_manage_seq
start with 1
increment by 1
nocache;
        
COMMENT ON TABLE refund_manage IS 'ȯ�� ����';

COMMENT ON COLUMN refund_manage.refund_mgno IS 'ȯ�ҹ�ȣ';

COMMENT ON COLUMN refund_manage.order_no IS '�ֹ���ȣ';

COMMENT ON COLUMN refund_manage.refund_state IS 'ó������';

COMMENT ON COLUMN refund_manage.refund_resson IS 'ȯ�һ���';

ALTER TABLE ProductList
	ADD	CONSTRAINT FK_subproduct_TO_ProductList
		FOREIGN KEY (div_no)
		REFERENCES subproduct (div_no);

ALTER TABLE ProductList
	ADD	CONSTRAINT FK_sellorinfo_TO_ProductList
		FOREIGN KEY (seller_no)
		REFERENCES sellorinfo (sellor_no);

ALTER TABLE subproduct
	ADD	CONSTRAINT FK_mainproduct_TO_subproduct
		FOREIGN KEY (maincode)
		REFERENCES mainproduct (maincode);

ALTER TABLE orderinfo
	ADD	CONSTRAINT FK_userinfo_TO_orderinfo
		FOREIGN KEY (user_no)
		REFERENCES userinfo (user_no);

ALTER TABLE orderinfo
	ADD	CONSTRAINT FK_ProductList_TO_orderinfo
		FOREIGN KEY (pdcode)
		REFERENCES ProductList (pdcode);

ALTER TABLE board
	ADD	CONSTRAINT FK_userinfo_TO_board
		FOREIGN KEY (user_no)
		REFERENCES userinfo (user_no);

ALTER TABLE cart
	ADD	CONSTRAINT FK_userinfo_TO_cart
		FOREIGN KEY (user_no)
		REFERENCES userinfo (user_no);

ALTER TABLE cart
	ADD	CONSTRAINT FK_ProductList_TO_cart
		FOREIGN KEY (pdcode)
		REFERENCES ProductList (pdcode);

ALTER TABLE recent
	ADD	CONSTRAINT FK_userinfo_TO_recent
		FOREIGN KEY (user_no)
		REFERENCES userinfo (user_no);

ALTER TABLE recent
	ADD	CONSTRAINT FK_ProductList_TO_recent
		FOREIGN KEY (pdcode)
		REFERENCES ProductList (pdcode);

ALTER TABLE refund_manage
	ADD	CONSTRAINT FK_orderinfo_TO_refund_manage
		FOREIGN KEY (order_no)
		REFERENCES orderinfo (order_no);