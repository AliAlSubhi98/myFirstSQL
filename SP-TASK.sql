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
    OpenBal decimal(10,2) CHECK (OpenBal >= 50)
);

CREATE TABLE Deposits (
    DNo int PRIMARY KEY,
    AcNo int FOREIGN KEY REFERENCES Registration(AcNo),
    DDate date DEFAULT GETDATE(),
    DAmount decimal(10,2) NOT NULL,
    DLocation varchar(10) NOT NULL
);

CREATE TABLE Withdrawals (
    WNo int PRIMARY KEY,
    AcNo int FOREIGN KEY REFERENCES Registration(AcNo),
    WDate date DEFAULT GETDATE(),
    WAmount decimal(10,2) NOT NULL,
    WLocation varchar(10) NOT NULL
);
