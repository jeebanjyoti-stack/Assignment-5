create database Assesment05Db
use Assesment05Db

create schema bank
create table bank.Customer
(CId int primary key identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) not null unique,
Contact nvarchar(30) not null unique,
CPwd as right(CName, 2) + convert(nvarchar(10),CId)+left(Contact,2) persisted
)

create table bank.Mailinfo
( MailTo  nvarchar(50),
MailDate date,
MailMessage nvarchar(max))

create trigger bank.trgMailToCust
on bank.Customer
after insert
as
begin
insert into bank.Mailinfo (MailTo,MailDate, MailMessage)
select i.CEmail,GETDATE(), 'Your net banking Password is : ' + i.CPwd + '. It is valid up to 2 days only. Update it.'
from inserted i
end


insert into bank.Customer ( CName, CEmail, Contact) values ( 'HarryPotter', 'harrypott@543.com', '8542369820')
insert into bank.Customer ( CName, CEmail, Contact) values ( 'RamKumar', 'ramkumar@854.com', '8542365231')
insert into bank.Customer ( CName, CEmail, Contact) values ( 'Akhil', 'akhil@678.com', '8542365247')


select * from bank.Customer
select * from bank.Mailinfo


