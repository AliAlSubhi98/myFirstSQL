CREATE TABLE Registration (
    AcNo int PRIMARY KEY,
    FName varchar(15) NOT NULL,
    LName varchar(15) NOT NULL,
    DOB date,
    RegDate date DEFAULT GETDATE(),
    CivillD int NOT NULL,
    Gender char(1) CHECK (Gender IN ('M','m','F','f')),
	GSM varchar(8) UNIQUE CHECK (GSM LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    --GSM varchar(8) UNIQUE,
    OpenBal int CHECK (OpenBal >= 50)
);

CREATE TABLE Deposits (
    DNo int PRIMARY KEY,
    AcNo int FOREIGN KEY REFERENCES Registration(AcNo),
    DDate date DEFAULT GETDATE(),
    DAmount int NOT NULL,
    DLocation varchar(10) NOT NULL
);

CREATE TABLE Withdrawals (
    WNo int PRIMARY KEY,
    AcNo int FOREIGN KEY REFERENCES Registration(AcNo),
    WDate date DEFAULT GETDATE(),
    WAmount int NOT NULL,
    WLocation varchar(10) NOT NULL
);

CREATE procedure Reg_Add_Record (
	@AcNo int ,
    @FName varchar(15),
    @LName varchar(15),
    @DOB date,
    @RegDate date ,
    @CivillD int ,
    @Gender char(1),
	@GSM varchar(8),
    @OpenBal int
)
AS
BEGIN
	INSERT INTO Registration VALUES (@AcNo, @FName, @LName, @DOB, @RegDate , @CivillD , @Gender, @GSM, @OpenBal);
		PRINT('record saved sucessfully');
END;

EXEC Reg_Add_Record 
	@AcNo = 1,
	@FName = 'Ali',
	@LName = 'AlSubhi',
	@DOB = '1998-04-09',
	@RegDate = '2022-02-28',
	@CivillD = 12091100,
	@Gender = 'M',
	@GSM = '95878690',
	@OpenBal = 1000;

	select * 
	from Registration

	-- to delete a row from the table
	DELETE FROM Registration WHERE AcNo = 12345;



/*This is an Example on how we use procedure to insert data in a table
create procedure departments3_insert
(
    @deptid  int,
    @dept_name  varchar,
   @HOD  varchar
)
AS
begin
	insert into department values (@deptid,@dept_name,@HOD);
	PRINT('record saved sucessfully');	
end;
EXEC departments3_insert 6,'ENLISH',NULL */