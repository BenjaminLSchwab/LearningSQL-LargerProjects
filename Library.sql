create table tbl_branch(
	branch_id int not null identity(1,1) primary key,
	branch_name varchar(30),
	branch_address varchar(30)
);

create table tbl_publisher(
	publisher_name varchar(50) primary key,
	publisher_address varchar(90),
	publisher_phone varchar(30)
);

create table tbl_books(
	book_id int not null identity(1,1) primary key,
	title varchar(50) not null,
	publisher_name varchar(50) foreign key references tbl_publisher(publisher_name)
);

create table tbl_copies(
	book_id int not null foreign key references tbl_books(book_id),
	branch_id int not null foreign key references tbl_branch(branch_id),
	number_copies int not null
);

create table tbl_borrower(
	card_no int not null identity(1,1) primary key,
	borrower_name varchar(50),
	borrower_address varchar(90),
	borrower_phone varchar(30)
);

create table tbl_authors(
	book_id int not null foreign key references tbl_books(book_id),
	author_name varchar(50)
);

create table tbl_loans(
	book_id int not null foreign key references tbl_books(book_id),
	branch_id int not null foreign key references tbl_branch(branch_id),
	card_no int not null foreign key references tbl_borrower(card_no),
	date_out date not null,
	date_due date not null
);

--tables created

insert into tbl_publisher(publisher_name, publisher_address, publisher_phone) values
	('Penguin Random House', '534 Linda Street', '202-555-0154'),
	('Oxford University Press', '3075 Kessla Way', '202-555-0194'),
	('Hachette Book Group', '376 Sand Fork Road', '202-555-2865'),
	('Black Dog Publishing', '752 Myra Street', '202-375-1740'),
	('City Lights Publishers', '2253 Collins Street', '202-487-3487')
;

insert into tbl_books(title, publisher_name) values
	('The Lost Tribe', 'Penguin Random House')
;