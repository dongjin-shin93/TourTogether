
--1. ������������ ���̵带 ���ϴ� ������� ���� ��� ���

select * from BOARD where REGION = '����' and BOARD_TYPE = 10;

--2. ������ �� ���� ��� ���

select * from BOARD where WRITER = 'parkgy22@gmail.com';

--3. �����Ʈ�� ���ϴ� ���� ��� ���

select * from BOARD where BOARD_TYPE = 20;

--4. �۹�ȣ 8���� �޸� ����� ��� ���

select * from MY_COMMENT where BOARD_NO = 8;

--5. �丣�� ���ƿ� �� �۵��� �۾��� ���̵� ��� ���

select * from FAVORITE where EMAIL = 'thorGood@gmail.com';

--6. �ֱ��̶� �Բ� �����Ͽ� �ϱ⸦ ���� ������� ���̵� ��� ���

select * from TOUR_DIARY where COMPANY = 'jookwang88@hanmail.com';

--7. ������ �ϱ⿡�� �±׸� �� ������� ���̵� ��� ���

select * from TOUR_DIARY where WRITER = 'parkgy22@gmail.com';

--8. ������ ��� ������ �� ��� ���

select * from USE_LANG where EMAIL = 'parkgy22@gmail.com';

--9. 9�� 6�� ���� ��¥���� �����Ʈ�� ���ϴ� ������� ���� ��� ���

select * from BOARD where START_DATE >= '2018-09-06' and BOARD_TYPE = 20;

--10. ��õ���� ������ ������� ���� �ϱ⸦ ��� ���

select * from TOUR_DIARY where REGION = '��õ';

--11. �� �����̳� ���뿡 '��'�� ���� �ϱ⸦ ��� ��� 

select * from TOUR_DIARY where TITLE like '%��%' or DIARY_CONTENT like '%��%';


-- �ֱ� 
--1. 9�� 1�� ���� 5�ϻ��̿� ���� ���̵� ���ֽǺ� ã��
select * from board where board_type=10 and start_date>='2018/9/1' and end_date<='2018/9/5';

--2. ��õ���� �����Ʈ ã��
select * from board where board_type=20 and start_date>sysdate and region='��õ' order by write_date desc;

--3.  eogh0000@naver.com �� ��밡���� ��� Ȯ���ϱ�
select lang from lang natural join use_lang where email = 'eogh0000@naver.com'; 

--4. thorGood@gmail.com �� ��۳��� �Խ��� ��� ����
select * from board where board_no in (select board_no from my_comment where writer = 'thorGood@gmail.com'); 

--5. twocomsdev@gmail.com ���ƿ� ��� ����
select * from board where board_no in (select board_no from favorite where email = 'twocomsdev@gmail.com');  

--6. jookwang88@hanmail.com �� �Բ� ���� �ߴ� �����Ʈ�� �ϱ� ����
select * from tour_diary where company = 'jookwang88@hanmail.com';  

--7. ��� ������ ���̵� Ȯ���ϱ�
select * from board where board_type = 10 and writer in (select email from use_lang where lang_no = 14); 

--8. parkgy22@gmail.com �� ���ƿ� ����߿��� ���� ��¥�� ������ ��� Ȯ���ϱ�
select * from board where start_date>=sysdate and board_no in (select board_no from favorite where email = 'parkgy22@gmail.com');  

--9. 9�� 5�Ͽ��� 12�� ���̿� ���� ���̵� ���ֽǺ� ã��
select * from board where board_type=10 and region='����' and start_date>='2018/9/5' and end_date='2018/9/12'; 

--10.  ���� ������ ���� ��
select board_no from ( select board_no, count(*) cnt, rank() over(order by count(*) desc) rang from favorite group by board_no) where rang = 1;

--����

--1. �̸����� parkgy22@gmail.com�� ȸ���� ���̵� �Խ��� ���� ���
select * from BOARD 
where BOARD_TYPE = 10 
AND WRITER = 'parkgy22@gmail.com';

--2. �̸����� twocomsdev@gmail.com�� ȸ���� ���̵� �Խ����� �� �ۿ�
	�ִ� ��� ��� ���
select COMMENT_CONTENT from MY_COMMENT 
where BOARD_NO IN 
(select BOARD_NO from BOARD 
where WRITER = 'twocomsdev@gmail.com');

--3. ���� ������ ������ ���̵� ����Ʈ�� �������� ���� ������ ���
select WRITER from BOARD 
where BOARD_TYPE = 10 
and REGION = '����' 
order by START_DATE;

--4. ���� �ð��� 4�ð� �̸��� ������ ��� ������ ���

--5. ����̵� ����Ʈ �� '�Ǿ���' �ܾ �� �������� ��� ���� ���
select * from BOARD
where BOARD_CONTENT LIKE '%�Ǿ���%';

--1. ���� �������� 2018-09-03 ������ �Խñ��� ������ �������� ���� ������ ���
select TITLE from BOARD
where BOARD_TYPE = 20 and START_DATE > '2018-09-03'
order by START_DATE;

--2. �̸����� jookwang88@hanmail.com�� ȸ���� �����Ʈ �Խ��ǿ� �� ���� ���� �ð��� ���
select TOUR_TIME from BOARD
where BOARD_TYPE = 20
and WRITER = 'jookwang88@hanmail.com';

--3. �����Ʈ �Խ��ǿ� 2018-07-15�� �ö�� ���� ������� ��� ���
select TITLE from BOARD
where BOARD_TYPE = 20
and WRITE_DATE like '18/07/15';

--4. �����Ʈ �Խñ� ���� '���̵�'�� �ܾ �� ���� �������� ���
select REGION from BOARD
where BOARD_TYPE = 20
and TITLE like '%���̵�%';


--5. ����ð��� 5�ð� �̸��� �Խñ��� ȸ�� �̸��ϰ� ������ ���
