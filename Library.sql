create database db_library;
use db_library;

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
	('The Lost Tribe', 'Penguin Random House'),
	('It', 'Oxford University Press'),
	('The Shining', 'Oxford University Press'),
	('1984', 'Hachette Book Group'),
	('Heart of Darkness', 'Black Dog Publishing'),
	('Siddhartha', 'City Lights Publishers'),
	('The Adventures of Huckleberry Finn', 'Penguin Random House'),
	('A Tale of Two Cities', 'Oxford University Press'),
	('The Call of the Wild', 'Hachette Book Group'),
	('Dune', 'Black Dog Publishing'),
	('The Last of the Mohicans', 'City Lights Publishers'),
	('Moby-Dick', 'Penguin Random House'),
	('A Song of Ice and Fire', 'Oxford University Press'),
	('Dracula', 'Hachette Book Group'),
	('The Food of the Gods and How It Came to Earth', 'Black Dog Publishing'),
	('The Three Musketeers', 'City Lights Publishers'),
	('Treasure Island','Hachette Book Group'),
	('Frankenstein', 'Penguin Random House'),
	('Planet of the Apes', 'Oxford University Press'),
	('Twenty Thousand Leagues Under the Sea', 'Hachette Book Group')
;

insert into tbl_branch (branch_name, branch_address) values
	('Sharpstown', '4367 Cessna Drive'),
	('Central', '366 Sardis Sta'),
	('Moon', '2163 Marigold Lane'),
	('Atlantis', '4105 Sundown Lane')
;

insert into tbl_authors(book_id, author_name) values
	(1, 'Mark Lee'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'George Orwell'),
	(5, 'Joseph Conrad'),
	(6, 'Hermann Hesse'),
	(7, 'Mark Twain'),
	(8, 'Charles Dickens'),
	(9, 'Jack London'),
	(10, 'Frank Herbert'),
	(11, 'James Fenimore Cooper'),
	(12, 'Herman Melville'),
	(13, 'George R. R. Martin'),
	(14, 'Bram Stoker'),
	(15, 'H. G. Wells'),
	(16, 'Alexandre Dumas'),
	(17, 'Robert Louis Stevenson'),
	(18, 'Mary Shelley'),
	(19, 'Arthur P. Jacobs'),
	(20, 'Jules Verne')
;

insert into tbl_borrower(borrower_name, borrower_address, borrower_phone) values
	('Tobie', '2163 Marigold Lane', '202-555-0154'),
	('Ritchie', '2387 Center Street', '487-265-9573'),
	('Rhonda ', '804 Star Route', '708-200-1670'),
	('Amanda', '1330 Bryan Street', '336-213-5156'),
	('Jared', '3197 Platinum Drive', '724-775-7156'),
	('Mellissa', '4458 Dovetail Drive', '847-292-6494'),
	('Georgia', '230 Coal Road', '570-647-4369'),
	('Charles', '2191 Pennsylvania Avenue', '732-371-2438'),
	('Ronald', '3003 Bolman Court', '217-337-2694'),
	('Alexander', '1244 North Bend River Road', '606-779-2193')
;

insert into tbl_loans(book_id, branch_id, card_no, date_out, date_due) values
	(1, 2, 1, '2000-05-18', '1939-02-03'),
	(2, 2, 1, '2009-06-16', '2018-9-20'),
	(3, 2, 1, '2000-07-18', '2018-9-21'),
	(4, 2, 1, '2009-08-16', '1946-12-25'),
	(5, 2, 1, '2000-09-18', '1948-11-24'),

	(6, 1, 2, '2009-10-16', '1955-04-18'),
	(7, 1, 2, '2000-11-18', '1955-11-27'),
	(8, 1, 2, '2009-12-16', '1958-12-10'),
	(9, 1, 2, '1926-06-20', '1959-07-23'),
	(10, 1, 2, '1929-05-06', '1965-07-14'),
	(11, 1, 2, '1939-02-03', '1969-03-06'),
	(12, 1, 2, '1942-05-21', '1970-04-15'),
	(13, 1, 2, '1945-01-27', '1971-04-12'),
	(14, 1, 2, '1946-12-25', '1972-04-05'),

	(15, 3, 3, '1948-11-24', '1976-10-12'),
	(16, 3, 3, '1955-04-18', '1978-09-05'),
	(17, 3, 3, '1955-11-27', '1989-07-04'),
	(18, 3, 3, '1958-12-10', '1989-10-04'),

	(19, 4, 4, '1959-07-23', '1993-05-09'),
	(20, 4, 4, '1965-07-14', '2009-01-30'),
	(1, 4, 4, '1969-03-06', '2015-12-03'),
	(2, 4, 4, '1970-04-15', '2018-9-19'),
	(3, 4, 4, '1971-04-12', '2017-10-14'),
	(4, 4, 4, '1972-04-05', '1926-06-20'),

	(5, 1, 5, '1976-10-12', '1929-05-06'),
	(6, 1, 5, '1978-09-05', '1939-02-03'),
	(7, 1, 5, '1989-07-04', '1942-05-21'),
	(8, 1, 5, '1989-10-04', '1945-01-27'),
	(9, 1, 5, '1993-05-09', '1946-12-25'),
	(10, 1, 5, '2009-01-30', '1948-11-24'),

	(11, 2, 7, '2015-12-03', '1955-04-18'),
	(12, 2, 7, '2017-05-27', '2018-9-20'),
	(13, 2, 7, '2017-10-14', '1958-12-10'),
	(14, 2, 7, '1926-06-20', '2018-9-21'),
	(15, 2, 7, '1929-05-06', '1965-07-14'),
	(16, 2, 7, '1939-02-03', '1969-03-06'),

	(17, 3, 7, '1942-05-21', '1970-04-15'),
	(18, 3, 7, '1945-01-27', '1971-04-12'),
	(19, 3, 7, '1946-12-25', '1972-04-05'),
	(20, 3, 7, '1948-11-24', '1976-10-12'),
	(1, 3, 7, '1955-04-18', '1978-09-05'),
	(2, 3, 7, '1955-11-27', '1989-07-04'),

	(3, 4, 8, '1958-12-10', '1989-10-04'),
	(4, 4, 8, '1959-07-23', '1993-05-09'),
	(5, 4, 8, '1965-07-14', '2009-01-30'),
	(6, 4, 8, '1969-03-06', '2018-9-21'),
	(7, 4, 8, '1970-04-15', '2017-05-27'),
	(8, 4, 8, '1971-04-12', '2017-10-14'),

	(9, 1, 9, '1972-04-05', '1926-06-20'),
	(10, 1, 9, '1976-10-12', '1929-05-06'),
	(11, 1, 9, '1978-09-05', '1939-02-03'),
	(12, 1, 9, '1989-07-04', '1942-05-21'),
	(13, 1, 9, '1989-10-04', '2018-9-20'),
	(14, 1, 9, '1993-05-09', '2018-9-21')
;

insert into tbl_copies(book_id, branch_id, number_copies) values
	(1, 1, 2),
	(2, 1, 2),
	(3, 1, 2),
	(4, 1, 4),
	(5, 1, 3),
	(6, 1, 5),
	(7, 1, 3),
	(8, 1, 2),
	(9, 1, 4),
	(10, 1, 5),
	(11, 1, 3),
	(12, 1, 4),
	(13, 1, 3),
	(14, 1, 5),
	(15, 1, 2),
	(16, 1, 6),
	(17, 1, 3),
	(18, 1, 4),
	(19, 1, 3),
	(20, 1, 4),

	(1, 2, 4),
	(2, 2, 2),
	(3, 2, 2),
	(4, 2, 4),
	(5, 2, 3),
	(6, 2, 5),
	(7, 2, 3),
	(8, 2, 2),
	(9, 2, 4),
	(10, 2, 5),
	(11, 2, 3),
	(12, 2, 4),
	(13, 2, 3),
	(14, 2, 5),
	(15, 2, 2),
	(16, 2, 6),
	(17, 2, 3),
	(18, 2, 4),
	(19, 2, 3),
	(20, 2, 4),

	(1, 3, 3),
	(2, 3, 2),
	(3, 3, 2),
	(4, 3, 4),
	(5, 3, 3),
	(6, 3, 5),
	(7, 3, 3),
	(8, 3, 2),
	(9, 3, 4),
	(10, 3, 5),
	(11, 3, 3),
	(12, 3, 4),
	(13, 3, 3),
	(14, 3, 5),
	(15, 3, 2),
	(16, 3, 6),
	(17, 3, 3),
	(18, 3, 4),
	(19, 3, 3),
	(20, 3, 4),

	(1, 4, 7),
	(2, 4, 2),
	(3, 4, 2),
	(4, 4, 4),
	(5, 4, 3),
	(6, 4, 5),
	(7, 4, 3),
	(8, 4, 2),
	(9, 4, 4),
	(10, 4, 5),
	(11, 4, 3),
	(12, 4, 4),
	(13, 4, 3),
	(14, 4, 5),
	(15, 4, 2),
	(16, 4, 6),
	(17, 4, 3),
	(18, 4, 4),
	(19, 4, 3),
	(20, 4, 4)
;

-- tables populated

go
	CREATE PROCEDURE ListCopiesInBranch
		@BookName varchar(50),
		@Branch varchar(30)
	AS
		select tbl_branch.branch_name as 'Branch', tbl_books.title as 'Title', tbl_copies.number_copies as 'Copies' from
			((tbl_branch 
			inner join tbl_copies on tbl_branch.branch_id = tbl_copies.branch_id) 
			inner join tbl_books on tbl_copies.book_id = tbl_books.book_id)
		where
			tbl_books.title = @BookName and
			tbl_branch.branch_name = @Branch
		;

GO 
	
go
	CREATE PROCEDURE ListCopies
		@BookName varchar(50)
	AS
		select tbl_branch.branch_name as 'Branch', tbl_books.title as 'Title', tbl_copies.number_copies as 'Copies' from
			((tbl_branch 
			inner join tbl_copies on tbl_branch.branch_id = tbl_copies.branch_id) 
			inner join tbl_books on tbl_copies.book_id = tbl_books.book_id)
		where
			tbl_books.title = @BookName
		;

GO

go
	CREATE PROCEDURE ListInactiveBorrowers AS
		select tbl_borrower.borrower_name as 'Name', 0 as 'Books Loaned' from
			(tbl_borrower left join
			tbl_loans on tbl_borrower.card_no = tbl_loans.card_no)
		where
			book_id is null
		;
GO

go
	CREATE PROCEDURE ListDueBorrowers
		@Branch varchar(30)
	 AS
		select tbl_books.title as 'Title', tbl_borrower.borrower_name as 'Borrower Name', tbl_borrower.borrower_address as 'Address' from
			(((tbl_books inner join 
			tbl_loans on tbl_books.book_id = tbl_loans.book_id) inner join 
			tbl_borrower on tbl_borrower.card_no = tbl_loans.card_no) inner join
			tbl_branch on tbl_loans.branch_id = tbl_branch.branch_id)
		where
			tbl_loans.date_due = CONVERT(date, GETDATE()) and
			tbl_branch.branch_name = @Branch
		;
GO

go
	CREATE PROCEDURE ListLoanedBooks AS
	--	declare @BranchCount int;
	--	set @BranchCount = (select COUNT(tbl_branch.branch_id) from tbl_branch);

	--	create table tempTbl_loanCount(branch_id int, loans int);-- temporary table used to store the count of loans per each branch

	--	declare @index int;
	--	set @index = 0;
	--	while @index < @BranchCount
	--		begin
	--			insert into tempTbl_loanCount(branch_id, loans) values(
	--				@index + 1, --using (@index + 1) because branch_id starts at 1
	--				(select COUNT(tbl_loans.book_id) from tbl_loans where tbl_loans.branch_id = (@index + 1)) 
	--			);
	--			set @index = @index + 1;
	--		end
		
	--	select tbl_branch.branch_name as 'Branch', tempTbl_loanCount.loans as 'Loans Out' from --extracting values from temp table
	--		tbl_branch inner join tempTbl_loanCount on tempTbl_loanCount.branch_id = tbl_branch.branch_id
	--	;
	--	drop table tempTbl_loanCount;

	select COUNT(*) as 'Loans', tbl_branch.branch_name 
	from tbl_loans
	INNER JOIN tbl_branch ON tbl_loans.branch_id = tbl_branch.branch_id
	GROUP BY tbl_branch.branch_name
GO

go
	CREATE PROCEDURE ListBorrowers
		@MinLoans int = 0
	 AS
		select tbl_borrower.borrower_name as 'Name', tbl_borrower.borrower_address as 'Address', COUNT(*) as 'Books Checked Out' 
		from tbl_borrower 
		inner join tbl_loans on tbl_borrower.card_no = tbl_loans.card_no
		group by tbl_borrower.borrower_name, tbl_borrower.borrower_address
		having COUNT(*) >= @MinLoans
		;
GO

go
	CREATE PROCEDURE ListCopiesByAuthorAndBranch
		@Author varchar(30),
		@Branch varchar(30)
	 AS
		select tbl_books.title as 'Title', tbl_copies.number_copies as 'Copies' from ((tbl_copies 
		inner join tbl_branch on tbl_copies.branch_id = tbl_branch.branch_id) 
		inner join tbl_books on tbl_books.book_id = tbl_copies.book_id) 
		inner join tbl_authors on tbl_authors.book_id = tbl_books.book_id
		where
		tbl_authors.author_name = @Author
		and tbl_branch.branch_name = @Branch
GO

--procedures created

exec ListCopiesInBranch 'The Lost Tribe', 'Sharpstown';
exec ListCopies 'The Lost Tribe';
exec ListInactiveBorrowers;
exec ListDueBorrowers 'Sharpstown'
exec ListLoanedBooks;
exec ListBorrowers 6;
exec ListCopiesByAuthorAndBranch 'Stephen King', 'Central'



