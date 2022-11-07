/* ȸ�� */
CREATE table userinfo(
	user_no NUMBER NOT NULL, /* ȸ����ȣ */
	user_name VARCHAR2(20) not null, /* ȸ���� */
	user_nick VARCHAR2(30) not null unique, /* �г��� */
	user_id VARCHAR2(30) not null unique, /* ���̵� */
	user_pwd VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	user_tel VARCHAR2(30) NOT NULL unique, /* ����ó */
	user_email VARCHAR2(50) NOT NULL unique, /* �̸��� */
	user_address VARCHAR2(80) NOT NULL, /* �ּ� */
	user_joindate DATE DEFAULT sysdate, /* ���Գ�¥ */
	user_iden NUMBER NOT NULL /* �νĹ�ȣ */
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

COMMENT ON COLUMN userinfo.user_iden IS '�νĹ�ȣ';

/* ��ǰ��� */
CREATE TABLE ProductList (
	pdcode NUMBER NOT NULL, /* ��ǰ�ڵ� */
	pdname VARCHAR2(30) NOT NULL, /* ��ǰ�� */
	price NUMBER NOT NULL, /* ���� */
	regdate DATE DEFAULT sysdate NOT NULL, /* ����� */
	div_no NUMBER not null/* �з���ȣ */
);


CREATE UNIQUE INDEX idx_ProductList
	ON ProductList (pdcode);

ALTER TABLE ProductList
	ADD	CONSTRAINT PK_ProductList
		PRIMARY KEY (pdcode	);

create sequence ProductList_seq
start with 1
increment by 1
nocache;
        
COMMENT ON TABLE ProductList IS '��ǰ���';

COMMENT ON COLUMN ProductList.pdcode IS '��ǰ�ڵ�';

COMMENT ON COLUMN ProductList.pdname IS '��ǰ��';

COMMENT ON COLUMN ProductList.price IS '����';

COMMENT ON COLUMN ProductList.regdate IS '�����';

COMMENT ON COLUMN ProductList.div_no IS '�з���ȣ';


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
	div_no NUMBER NOT NULL, /* ��ȣ */
	subproduct_name VARCHAR2(50) NOT NULL, /* ��ǰ�� */
	maincode NUMBER NOT NULL /* ��з��ڵ� */
);

CREATE UNIQUE INDEX idx_subproduct
	ON subproduct (div_no);

ALTER TABLE subproduct
	ADD	CONSTRAINT PK_subproduct
		PRIMARY KEY (div_no);

COMMENT ON TABLE subproduct IS '��ǰ�Һз�';

COMMENT ON COLUMN subproduct.div_no IS '��ȣ';

COMMENT ON COLUMN subproduct.subproduct_name IS '��ǰ��';

COMMENT ON COLUMN subproduct.maincode IS '��з��ڵ�';

/* �ֹ����� */
CREATE TABLE orderinfo (
	order_no NUMBER NOT NULL, /* �ֹ���ȣ */
	orderdate DATE DEFAULT sysdate not null, /* �ֹ��� */
	qty NUMBER NOT NULL, /* ��ǰ���� */
	totalprice NUMBER NOT NULL, /* �ѱݾ� */
	pdcode NUMBER NOT NULL, /* ��ǰ�ڵ� */
	user_no NUMBER NOT NULL /* ȸ����ȣ */
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

COMMENT ON COLUMN orderinfo.orderdate IS '�ֹ���';

COMMENT ON COLUMN orderinfo.qty IS '��ǰ����';

COMMENT ON COLUMN orderinfo.totalprice IS '�ѱݾ�';

COMMENT ON COLUMN orderinfo.pdcode IS '��ǰ�ڵ�';

COMMENT ON COLUMN orderinfo.user_no IS 'ȸ����ȣ';

/* ���ǰԽ��� */
CREATE TABLE board (
	write_no NUMBER NOT NULL, /* �۹�ȣ */
	title VARCHAR2(30) NOT NULL, /* ���� */
	writer VARCHAR2(30) NOT NULL, /* �ۼ��� */
	regdate DATE DEFAULT sysdate, /* �ۼ��� */
	read NUMBER NOT NULL, /* ��ȸ */
	content CLOB NOT NULL, /* �۳��� */
	user_no NUMBER, /* �����ڵ� */
	user_no2 NUMBER /* ȸ����ȣ */
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

COMMENT ON COLUMN board.title IS '����';

COMMENT ON COLUMN board.writer IS '�ۼ���';

COMMENT ON COLUMN board.regdate IS '�ۼ���';

COMMENT ON COLUMN board.read IS '��ȸ';

COMMENT ON COLUMN board.content IS '�۳���';

COMMENT ON COLUMN board.user_no IS '�����ڵ�';

COMMENT ON COLUMN board.user_no2 IS 'ȸ����ȣ';


/* ��ٱ��� */
CREATE TABLE cart (
	cartno NUMBER , /* ��ٱ��Ϲ�ȣ */
	pdcode NUMBER not null, /* ��ǰ��ȣ */
	qty NUMBER not null, /* ���� */
	totalprice NUMBER not null , /* ���� */
	user_no NUMBER, /* ȸ����ȣ */
    constraint ck_cart_totalprice check(totalprice>=0)
);

create sequence cart_seq
start with 1
increment by 1
nocache;

COMMENT ON TABLE cart IS '��ٱ���';

COMMENT ON COLUMN cart.cartno IS '��ȣ';

COMMENT ON COLUMN cart.pdcode IS '��ǰ��ȣ';

COMMENT ON COLUMN cart.qty IS '����';

COMMENT ON COLUMN cart.totalprice IS '����';

COMMENT ON COLUMN cart.user_no IS 'ȸ����ȣ';

/* ȯ�����̺� */
CREATE TABLE refund (
	refund_no NUMBER NOT NULL, /* ȯ�ҹ�ȣ */
	order_no NUMBER NOT NULL, /* �ֹ���ȣ */
	reason VARCHAR2(100) NOT NULL, /* ȯ�һ��� */
	condition VARCHAR2(20) NOT NULL /* ó������ */
);

CREATE UNIQUE INDEX idx_refund
	ON refund (refund_no);

ALTER TABLE refund
	ADD	CONSTRAINT PK_refund
		PRIMARY KEY (refund_no);

create sequence refund_seq
start with 1
increment by 1
nocache;

COMMENT ON TABLE refund IS 'ȯ�����̺�';

COMMENT ON COLUMN refund.refund_no IS 'ȯ�ҹ�ȣ';

COMMENT ON COLUMN refund.order_no IS '�ֹ���ȣ';

COMMENT ON COLUMN refund.reason IS 'ȯ�һ���';

COMMENT ON COLUMN refund.condition IS 'ó������';

/* �ֱٺ���ǰ */
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

COMMENT ON TABLE recent IS '�ֱٺ���ǰ';

COMMENT ON COLUMN recent.recent_no IS '�ֱٺ���ǰ��ȣ';

COMMENT ON COLUMN recent.user_no IS 'ȸ����ȣ';

COMMENT ON COLUMN recent.pdcode IS '��ǰ�ڵ�';


ALTER TABLE cart
	ADD	CONSTRAINT FK_user_TO_cart
		FOREIGN KEY (user_no)
        REFERENCES userinfo(user_no);
        
ALTER TABLE ProductList
	ADD	CONSTRAINT FK_subproduct_TO_ProductList
		FOREIGN KEY (div_no)
		REFERENCES subproduct (div_no);

ALTER TABLE subproduct
	ADD	CONSTRAINT FK_mainproduct_TO_subproduct
		FOREIGN KEY (maincode)
		REFERENCES mainproduct (maincode);

ALTER TABLE orderinfo
	ADD	CONSTRAINT FK_user_TO_order
		FOREIGN KEY (user_no)
		REFERENCES userinfo (user_no);

ALTER TABLE orderinfo
	ADD	CONSTRAINT FK_ProductList_TO_order
		FOREIGN KEY (pdcode)
		REFERENCES ProductList (pdcode);

ALTER TABLE board
	ADD CONSTRAINT FK_user_TO_board
		FOREIGN KEY (user_no2)
		REFERENCES userinfo (user_no);

ALTER TABLE refund
	ADD	CONSTRAINT FK_order_TO_refund
		FOREIGN KEY (order_no)
		REFERENCES orderinfo (order_no);

ALTER TABLE recent
	ADD	CONSTRAINT FK_user_TO_recent
		FOREIGN KEY (user_no)
		REFERENCES userinfo (user_no);

ALTER TABLE recent
	ADD	CONSTRAINT FK_ProductList_TO_recent
		FOREIGN KEY (pdcode)
		REFERENCES ProductList (pdcode);