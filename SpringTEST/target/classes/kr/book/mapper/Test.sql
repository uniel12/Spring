Create table book(
	num int not null auto_increment,
	title varchar(50) not null,
	author varchar(30) not null,
	company varchar(50) not null,
	isbn varchar(30) not null,
	count int default 0 not null,
	primary key(num)
);

insert into book(title,author,company,isbn,count)
values('해리포터와 아즈카반의 죄수','J.K 롤링','문학수첩','8983920726','12');

insert into book(title,author,company,isbn,count)
values('난중일기','이순신','서해문집','8974832232','8');