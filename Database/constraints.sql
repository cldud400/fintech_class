-- 제약조건 (constraints)

/*
primary key : not null, unique한 데이터로 구성 - 모든 데이터를 구분할 수 있는 칼럼값 (ex) : id)
not null : 해당 칼럼에 null값이 없어야 함. null - null값 허용 (초기값)
default 값 : 해당 칼럼에 default값을 지정, 해당 칼럼에 값을 입력하지 않으면 default값으로 자동입력
unique : 해당 칼럼의 값들은 중복값을 가지지 못한다.
foreign key : 두 테이블을 연결해서 데이터의 일치성을 유지하도록
*/

drop database if exists tabledb;
create database tabledb;
use tabledb;

drop table if exists usertbl, buytbl;

create table usertbl(
	userid char(8) not null primary key,
    username varchar(10) not null,
    birthyear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date);

create table buytbl(
	num int not null primary key,
    userid char(8) not null,
    prodname char(6) not null,
    groupName char(4) null,
    price int not null,
    amount smallint not null);
 
 
 
drop table if exists buytbl;

-- usertbl의 userid를 참조해서 foreign key로 사용
-- usertbl에 있는 데이터만 입력이 된다
-- usertbl에는 JYP에 대한 데이터가 없기 때문에 buytbl에는 JYP데이터가 입력이 안된다.
create table buytbl(
	num int not null primary key,
    userid char(8) not null,
    prodname char(6) not null,
    groupName char(4) null,
    price int not null,
    amount smallint not null,
    # constraint로 외래키 이름을 지정해 주면 제거하기도 쉽다
    constraint fk_userid foreign key(userid) references usertbl(userid));
    # buytbl userid 칼럼은 usertbl의 userid칼럼을 참조 => 데이터의 일치성 유지
    # buytbl의 userid의 값들은 usertbl에 존재하고 있어야 한다.

# table_name = 'buytbl'인 테이블이 존재하는가?
select * from information_schema.table_constraints where table_name='buytbl';
    
insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-07-07');
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '11111111', 173, '2008-07-07');
insert into usertbl values('KKH', '김경호', 1971, '전남', '011', '11111111', 177, '2008-07-07');
desc usertbl;
select * from usertbl;

insert into buytbl values(3, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values(1, 'KBS', '운동화', null, 30, 2);
# usertbl에 userid = 'JYP'인 데이터가 존재하지 않아 에러가 난다
insert into buytbl values(2, 'JYP', '모니터', '전자', 200, 1);  -- error


desc buytbl;
select * from buytbl;


drop table if exists usertbl;

create table usertbl(
	userid char(8) not null,
    username varchar(10) not null,
    birthyear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date,
    constraint primary key pk_userid (userid));

## foreign key 제거하기
select * from information_schema.table_constraints where table_name = 'buytbl';
alter table buytbl drop foreign key fk_userid;



ALTER TABLE userTbl
	ADD CONSTRAINT PK_userTbl_userID
    PRIMARY KEY (userID); # 참조받는 테이블의 칼럼은 primary key로 지정되어있어야 한다.

