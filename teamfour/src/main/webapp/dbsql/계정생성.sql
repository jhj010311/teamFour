--sys�� system �������� �α����ؼ� ����� ����, ���̺����̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace teamfour_tb
datafile 'C:\oraclexe\mydata\teamfour_tb.dbf' size 48m
autoextend on next 10m;

/*
--���̺� �����̽� ����
drop tablespace teamfour_tb including contents and datafiles;
*/

alter session set "_ORACLE_SCRIPT"=true; 

--����� ���� ����
create user ezen
identified by ezen123
default tablespace teamfour_tb;

--����� ���Ѻο�
grant connect,resource to ezen;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to ezen;

grant unlimited tablespace to ezen;  --���̺����̽��� ���� ���� �ο�
