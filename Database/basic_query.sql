
-- 한 줄 주석
# 한 줄 주석

/*
여러 줄 주석
여러 줄 주석
*/


use shopdb; -- 데이터베이스 선택


-- select 칼럼명 from 테이블명 where 조건;

select * from membertbl;

-- ctrl + enter : 한 줄 실행
-- ctrl + shift + enter : 전체 실행 또는 선택한 블록 실행

select memberaddress from membertbl;
select memberaddress from membertbl where membername = '당당';
select * from producttbl;
select productname, amount from producttbl where amount < 5;

-- employees 데이터베이스에서 titles 테이블의 모든 데이터를 출력
use employees;

select * from titles;

use shopdb;
select * from membertbl;
select * from producttbl;

-- 삼성 제품만 출력
select * from producttbl where company = '삼성';

-- 세탁기의 원가는 얼마인가
select cost from producttbl where productname = '세탁기';

-- shopdb 데이터베이스의 테이블 목록을 출력
show tables;

show databases;

-- employees 데이터베이스에서 종업원 전체 목록을 출력alter
use employees;

show tables;
select * from employees;
select count(*) from employees;

-- 남성 종사자의 목록을 출력
select * from employees where gender = 'M';

-- 60년 이전 출생자의 목록을 출력alter
select emp_no, last_name from employees where birth_date < '1960-01-01'; 

-- 연봉 1억 이상인 사람의 emp_no을 출력
show tables;
select emp_no from salaries where salary > 100000;

-- 연봉 1억 이상인 사람의 인원수를 출력
select count(*) from salaries where salary > 100000;

-- 입사연도가 1990년 07월 07일 이전인 'engineer'의 데이터를 출력
show tables;
select * from employees;
select * from titles where from_date < '1990-07-07' and title = 'engineer';

-- Table을 생성하고 값을 입력하는 sql query

-- (create database 데이터베이스이름;)
-- (use 데이터베이스이름;)

-- create table 테이블이름 (칼럼명, 데이터타입, 제약조건);
-- insert into 테이블이름 (칼럼명) values (값1, 값2,...);

create database sqldb;
use sqldb;

create table usertbl (
	userid char(8) not null primary key,
    name varchar(10) not null,
    birthyear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date);

-- ignore 중복 무시
    
insert ignore into usertbl values ('LSG', '이승기', 1987, '서울', '001', '11111111', 182, '2008-8-8');
insert ignore into usertbl values ('KBS', '김범수', 1979, '경남', '001', '22222222', 175, '2012-9-8');
insert ignore into usertbl values ('KKH', '김경호', 1984, '인천', '010', '22221111', 177, '2010-8-8');
insert ignore into usertbl values ('JYP', '조용필', 1963, '부산', '001', '33333333', 166, '2009-8-8');
insert ignore into usertbl values ('SSK', '성시경', 1979, '서울', NULL, NULL, 187, '2013-12-12');
insert ignore into usertbl values ('LJB', '임재범', 1969, '서울', '006', '11111111', 182, '2009-8-8');
insert ignore into usertbl values ('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-8-8');
insert ignore into usertbl values ('EJW', '은지원', 1972, '경기', '001', '11111111', 174, '2014-3-3');
insert ignore into usertbl values ('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2010-10-10');
insert ignore into usertbl values ('JWK', '조관우', 1965, '광주', '010', '00000000', 172, '2013-10-10');

select * from usertbl;

create table buytbl
( num int not null primary key auto_increment,
  userid char(8) not null,
  prodname char(6) not null,
  groupname char(4),
  price int not null,
  amount smallint not null
);

insert into buytbl values ( Null, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values ( Null, 'JYP', '모니터', '전자', 200, 5);

select * from buytbl;
select * from usertbl;

-- 김경호라는 가수의 데이터 출력

select * from usertbl where name = '김경호';



use gmarketdb;
select * from item;
select * from ranking;