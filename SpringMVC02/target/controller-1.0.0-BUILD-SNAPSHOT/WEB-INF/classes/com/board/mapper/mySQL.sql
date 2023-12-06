-- board 게시판 테이블 생성
Create table board(
	idx int not null auto_increment,
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



