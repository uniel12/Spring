-- board 게시판 테이블 생성
drop table board;

-- board 게시판 테이블 생성
Create table board(
	idx int not null auto_increment,
	memId varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

-- test 데이터 넣기

insert into board(title,content,writer)
values('신나는 월요일','월요일 좋아~','스폰지밥');

insert into board(title,content,writer)
values('월요일은 7교시','빨리 끝나~','짱구');

insert into board(title,content,writer)
values('내일은 화요일','얼마 안남았다!!','추석');

select * from board;

delete from board where title= "";





-- 회원 테이블 만들기
create table member(
	memIdx int auto_increment,
	memId varchar(20) not null unique,
	memPw varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(20),
	memProfile varchar(50),
	primary key(memIdx) 
	
);

drop table member;

insert into member(memId,memPw,memName,memAge,memGender,memEmail)
value("admin","0000","관리자",0,"여","admin@smhrd.com");

insert into member(memId,memPw,memName,memAge,memGender,memEmail)
value("root","0000","관리자2",1,"남","root@smhrd.com");

insert into member(memId,memPw,memName,memAge,memGender,memEmail)
value("yun","0000","관리자3",0,"여","yun@smhrd.com");

select * from member;

select * from member;










