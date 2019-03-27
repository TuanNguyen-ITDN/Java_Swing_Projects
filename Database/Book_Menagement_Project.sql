Drop Database Book_Menagement_Project;
Create Database Book_Menagement_Project;
Use Book_Menagement_Project;


Create Table User (
	ID Int NOT NULL Auto_increment PRIMARY KEY,
    FullName VARCHAR (30) NOT NULL ,  
    User_Name VARCHAR (30) NOT NULL, 
    Email VARCHAR (30) NOT NULL, 
    Pass_Word VARCHAR (30) NOT NULL check (Pass_Word>5)
    
);


Create Table Book_Information (
	ID_Book Varchar(30) NOT NULL  PRIMARY KEY     ,
    BookName VARCHAR (50) NOT NULL, 
    Type VARCHAR (30) NOT NULL, 
    Author VARCHAR (30) NOT NULL,
    DatePublish Date NOT NULL,
    Status varchar (30)  ,
    Notes Varchar (30) 
    
    
);

INSERT INTO Book_Information 
	VALUES  ('SK1','How to stop worrying and start living','Skill','Dale Carnegie','2012-03-23','Available','Borrowed'),
			('SK2','A brief history of time','Skill','Stephen Hawking','2011-02-01','Available','Borrowed'),
			('SK3','Mans search for meaning','Skill','Viktor E.Frankl','2008-03-05','Available','Borrowed'),
			('SK4','Life and teaching of the master of the far East','Skill','Baird T.Spalding','2001-04-03','Available','Borrowed'),
			('SK5','Predictably Irational','Skill','Dan Ariely','2007-04-12','Available','Borrowed'),  
			('SK6','Toi tu hoc','Skill','Nguyen Duy Can','2000-03-12','Available','Borrowed'),
			('SK7','Nha gia kim','Skill','Paulo Coelho','2001-02-23','Available','Borrowed'),
			('SK8','Nguoi giau co nhat thanh Babylon','Skill','George Classon','2000-2-23','Available','Not yet'),
			('CM1','Dai chua te','Comic','J.Omiky','2004-03-16','Available','Not yet'),
			('CM2','De men phieu luu ky','Comic','Tô Hoài','2001-2-4','Available','Not yet'),
		    ('CM3','Tam cam','Comic','Khong co tac gia','1999-12-23','Available','Not yet'),
			('CM4','Cay khe','Comic','Khong co tac gia','1999-04-23','Available','Borrowed'),
			('CM5','Bay vien ngoc rong','Comic','Khong co tac gia','2010-02-23','Available','Borrowed'),
			('CM6','Cay tre tram dot','Comic','Khong co tac gia','2004-04-23','Available','Not yet'),
			('CM7','Thach sanh','Comic','Khong co tac gia','2012-03-04','Available','Not yet'),
			('CM8','Thanh giong','Comic','Khong co tac gia','2009-03-01','Available','Not yet'),
			('CM9','Ngheu so oc hen','Comic','Khong co tac gia','2008-03-23','Available','Not yet'),
			('CM10','Cay neu ngay tet','Comic','Khong co tac gia','1990-09-07','Available','Not yet'),
		    ('CM11','Qua bau tien','Comic','Khong co tac gia','2003-09-09','Available','Not yet'), 
		    ('CM12','Anh den dom dom','Comic','Khong co tac gia','2003-2-23','Available',' Not yet');
         
 

/*Select * from Book_Information where ID_Book like '%CM%';
 Select * from Book_Information where BookName like '%Qua bau tien%';
 Select * from Book_Information where Type like '%Comic%';*/
CREATE TABLE READER

 (

	ID_READER VARCHAR (30) PRIMARY KEY ,
    NAME_READER VARCHAR (30) NOT NULL,  
    CLASS VARCHAR (30) NOT NULL, 
    GENDER  VARCHAR (30)   , 
    EMAIL  VARCHAR (30) NOT NULL
    
);

Insert into  READER
	Values  ('PNV01','Tuan','PNV 20A','Male','tuan.nguyen@gmail.com'),
			('PNV02','Hung','PNV 20A','Male','hung.nguyen@gmail.com'),
			('PNV03','Nhung','PNV20B','Female','nhung.tran@gmail.com'),
            ('PNV04','Van','PNV20A','Female','van.nguyen@gmail.com'),
            ('PNV05','Kiet','PNV20A','Female','kiet.alang@gmail.com'),
            ('PNV06','Trang','PNV20B','Female','trang.le@gmail.com');
            
/*Select NAME_READER from READER where ID_READER = 'HT';*/
        
CREATE TABLE BOOK_INFORMATION_BORROWED 
(
	STT INT not null AUTO_INCREMENT PRIMARY KEY,
	ID_READER VARCHAR (30)  NULL ,
	ID_BOOK VARCHAR(20)   NOT NULL,
	DATE_BORROWED DATE NOT NULL,
	DATE_GIVE DATE NOT NULL,
	NOTES VARCHAR(30) NOT NULL ,
	Foreign key (ID_READER)  References READER (ID_READER ),
	Foreign key (ID_BOOK)  References BOOK_INFORMATION (ID_BOOK )
);

Insert into BOOK_INFORMATION_BORROWED (ID_READER,ID_BOOK,DATE_BORROWED,DATE_GIVE,NOTES)
	Values ('PNV01','SK1','2018-07-15','2018-07-20','New'),
		   ('PNV02','SK2','2018-06-15','2018-07-20','New'),
		   ('PNV03','SK3','2018-07-16','2018-07-25','New'),
           ('PNV04','SK4','2018-07-15','2018-07-20','New'),
           ('PNV05','SK5','2018-07-15','2018-07-20','New'),
           ('PNV06','SK6','2018-07-15','2018-07-20','New'),
           ('PNV06','CM4','2018-07-15','2018-07-20','New'),
           ('PNV06','CM5','2018-07-15','2018-07-20','New'),
           ('PNV06','SK7','2018-07-15','2018-07-20','New');
          
           
   /*      
	Select borrow.STT,borrow.ID_READER,borrow.ID_BOOK,bookInfor.BookName,bookInfor.Type,bookInfor.Author,
			borrow.DATE_BORROWED,borrow.DATE_GIVE,borrow.NOTES from BOOK_INFORMATION_BORROWED as borrow,
            Book_Information as bookInfor where borrow.ID_BOOK = bookInfor.ID_BOOK and borrow.ID_BOOK like 'SK1 ' ;
*//*
CREATE TABLE GIVE_BOOK(

	STT INT AUTO_INCREMENT PRIMARY KEY,
	ID_BOOK VARCHAR(20)  NULL ,
    ID_READER VARCHAR(20) Null,
	Foreign key (ID_BOOK)  References Book_Information (ID_BOOK ),
    Foreign key (ID_READER)  References READER (ID_READER )

);*/