CREATE user banker
IDENTIFIED BY bank2018
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA 10M ON USERS;

GRANT connect to banker;
GRANT resource to banker;
GRANT create session TO banker;
GRANT create table TO banker;
GRANT create view TO banker;
GRANT CREATE ANY TABLE TO banker ;
GRANT INSERT ANY TABLE TO banker ;
GRANT UPDATE ANY TABLE TO banker ;
GRANT DELETE ANY TABLE TO banker ;
GRANT CREATE ANY PROCEDURE TO banker ;
GRANT CREATE ANY TRIGGER TO banker ;
GRANT CREATE ANY SEQUENCE TO banker;
GRANT UNLIMITED TABLESPACE TO banker;



--conn banker/bank2018

CREATE TABLE Employee(
    eID NUMBER(9) PRIMARY KEY,      -- modified to varchar2
    fName VARCHAR(15) NOT NULL,        -- "
    lName VARCHAR(15) NOT NULL,         --"
    role VARCHAR(2) NOT NULL        --updated to VARCHAR2(10)
    );

CREATE TABLE Customer(
    cID NUMBER(9) PRIMARY KEY,
    fName VARCHAR(9) NOT NULL,
    lName VARCHAR(9) NOT NULL,
    city VARCHAR(9) NOT NULL        --updatd to varchar(15)

    );
    
CREATE TABLE Account(
    acNo NUMBER(9) PRIMARY KEY,
    acStatus CHAR(1) NOT NULL,  -- DROPPED 
    acStatusDate DATE NOT NULL,     --DROPPED
    acType VARCHAR(10) NOT NULL,
    --added BALANCE NUMBER
    
    cID NUMBER(9) NOT NULL,
    eID NUMBER(9) NOT NULL,
    
    CONSTRAINT fk_cID 
        FOREIGN KEY (cID) REFERENCES CUSTOMER(cID)
    );

CREATE TABLE Transaction(
    tid NUMBER(5) PRIMARY KEY,
    tdate DATE NOT NULL,
    deposit NUMBER(9),
    withdraw NUMBER(9),
    balance NUMBER(9),
    
    acNo NUMBER(9) NOT NULL,
    cId NUMBER(9) NOT NULL, -- DROPPED LATER
    
CONSTRAINT fk_acno FOREIGN KEY(acno) REFERENCES ACCOUNT(acno),
CONSTRAINT fk_tcid FOREIGN KEY(cID) REFERENCES CUSTOMER(cID)
);


/* create foreign key  */

ALTER TABLE ACCOUNT
ADD CONSTRAINT fk_eID FOREIGN KEY(eID) REFERENCES EMPLOYEE(eID);

ALTER TABLE EMPLOYEE
MODIFY  role VARCHAR(10);

ALTER TABLE CUSTOMER
MODIFY city VARCHAR(15);

ALTER TABLE EMPLOYEE
MODIFY FNAME VARCHAR2(15)
MODIFY LNAME VARCHAR2(15)
MODIFY ROLE VARCHAR2(15);

ALTER TABLE CUSTOMER
MODIFY FNAME VARCHAR2(15)
MODIFY LNAME VARCHAR2(15)
MODIFY CITY VARCHAR2(15);

ALTER TABLE TRANSACTION
DROP COLUMN BALANCE;

ALTER TABLE ACCOUNT
ADD  Balance NUMBER(10);

ALTER TABLE ACCOUNT
DROP COLUMN BALANCE;

ALTER TABLE TRANSACTION
DROP COLUMN CID;

/* POPULATE TABLES */
INSERT ALL
INTO EMPLOYEE(EID, FNAME, LNAME,ROLE) VALUES(10, 'petey', 'cruiser','manager')
INTO EMPLOYEE (EID, FNAME, LNAME,ROLE) VALUES(11,'anna', 'mull','banker')
INTO EMPLOYEE (EID, FNAME, LNAME, ROLE) VALUES(12, 'bob', 'lee', 'banker')
INTO EMPLOYEE (EID, FNAME, LNAME, ROLE) VALUES(13, 'maya', 'life', 'banker')
INTO EMPLOYEE (EID, FNAME, LNAME, ROLE) VALUES(14, 'cliff', 'hanger', 'banker')
INTO EMPLOYEE (EID, FNAME, LNAME, ROLE) VALUES(15, 'sal', 'cherry', 'banker')
SELECT 1 FROM DUAL;

INSERT ALL
INTO CUSTOMER(CID,FNAME,LNAME,CITY) VALUES(50, 'zack' , 'lee', 'Maspeth')
INTO CUSTOMER(CID,FNAME,LNAME, CITY) VALUES(51, 'jimmy' , 'vaneer', 'Jackson H')
INTO CUSTOMER(CID,FNAME,LNAME, CITY) VALUES(52, 'barry', 'wine', 'Woodside')
INTO CUSTOMER(CID,FNAME,LNAME, CITY) VALUES(53, 'don' , 'stairs', 'Reston')
INTO CUSTOMER(CID,FNAME,LNAME, CITY) VALUES(54, 'tom' , 'foolery', 'Sunny Side')
INTO CUSTOMER(CID,FNAME,LNAME, CITY) VALUES(55, 'otto', 'maltic' , 'Herndon')
INTO CUSTOMER(CID,FNAME,LNAME, CITY) VALUES(56,  'al', 'dente', 'Maspeth' )
SELECT 1 FROM DUAL;

CREATE TABLE CUST_LOGIN(
    cUserName VARCHAR2(9) PRIMARY KEY,
    cPassword VARCHAR2(9) NOT NULL,
    cID NUMBER(9) NOT NULL,
    acNo NUMBER(9) NOT NULL,
    CONSTRAINT fk_lcust_cid FOREIGN KEY(cID) REFERENCES CUSTOMER(cID),
    CONSTRAINT fk_lcust_acNo FOREIGN KEY(acNo) REFERENCES ACCOUNT(acNo)
    );

CREATE TABLE EMP_LOGIN(
    eUserName VARCHAR2(9),
    ePassword VARCHAR2(9) NOT NULL,
    eID NUMBER(9) NOT NULL,
    CONSTRAINT fk_emp_eid FOREIGN KEY(eID) REFERENCES EMPLOYEE(eID)
    );

ALTER TABLE ACCOUNT
DROP COLUMN acStatusDate;

ALTER TABLE ACCOUNT
DROP COLUMN ACSTATUS;

CREATE TABLE AC_STATUS(
    status CHAR(1) NOT NULL,
    acno NUMBER(9) NOT NULL,
    CONSTRAINT fk_st_acno FOREIGN KEY(acno) REFERENCES ACCOUNT(acno)
    );

INSERT INTO CUSTOMER (CID,FNAME, LNAME, CITY) VALUES(57, 'bob', 'jacky', 'Reston');

INSERT ALL
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(800, 'CHECKING' , 50, 10)
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(801, 'SAVING' , 51, 11)
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(802, 'CHECKING' , 52, 12)
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(803, 'CHECKING' , 53, 13)
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(804, 'CHECKING' , 54, 14)
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(805, 'SAVING' , 55, 15)
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(806, 'CHECKING' , 56, 10)
INTO ACCOUNT (ACNO, ACTYPE, CID,EID) VALUES(807, 'CHECKING' , 57, 11)
SELECT 1 FROM DUAL;

INSERT ALL
INTO AC_STATUS(ACNO, STATUS) VALUES(800, '1')
INTO AC_STATUS(ACNO, STATUS) VALUES(801, '0')
INTO AC_STATUS(ACNO, STATUS) VALUES(802, '1')
INTO AC_STATUS(ACNO, STATUS) VALUES(803, '1')
INTO AC_STATUS(ACNO, STATUS) VALUES(804, '0')
INTO AC_STATUS(ACNO, STATUS) VALUES(805, '1')
INTO AC_STATUS(ACNO, STATUS) VALUES(806, '0')
INTO AC_STATUS(ACNO, STATUS) VALUES(807, '1')
SELECT 1 FROM DUAL;

INSERT ALL
INTO EMP_LOGIN(EUSERNAME, EPASSWORD, EID) VALUES('peteyu','cruiserp',10)
INTO EMP_LOGIN(EUSERNAME, EPASSWORD, EID) VALUES('annau','mullp',11)
INTO EMP_LOGIN(EUSERNAME, EPASSWORD, EID) VALUES('bobu','leep',12)
INTO EMP_LOGIN(EUSERNAME, EPASSWORD, EID) VALUES('mayau','lifep',13)
INTO EMP_LOGIN(EUSERNAME, EPASSWORD, EID) VALUES('cliffu','hangerp',14)
INTO EMP_LOGIN(EUSERNAME, EPASSWORD, EID) VALUES('salu','cherryp',15)
SELECT 1 FROM DUAL;

INSERT ALL
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('zacku', 'leep',50,800)
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('jimmyu', 'vaneerp',51,801)
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('barryu', 'winep',52,802)
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('donu', 'stairsp',53,803)
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('tomu', 'fooleryp',54,804)
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('ottou', 'malticp',55,805)
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('alu', 'dentep',56,806)
INTO CUST_LOGIN(CUSERNAME,CPASSWORD,CID,ACNO) VALUES('bobu', 'jackyp',57,807)
SELECT 1 FROM DUAL;

--CREATE FUNCTIONS



SELECT EMPLOYEE.FNAME, EMPLOYEE.LNAME, EMPLOYEE.EID
FROM EMPLOYEE
INNER JOIN EMP_LOGIN 
ON EMPLOYEE.EID = EMP_LOGIN.EID
WHERE EMP_LOGIN.EUSERNAME = 'annau' AND EMP_LOGIN.EPASSWORD = 'mullp';


CREATE OR REPLACE FUNCTION check_empLoginPwd(empUser IN VARCHAR2, empPwd IN VARCHAR2, empName IN VARCHAR2) RETURN CHAR
IS
empu VARCHAR2(10);

BEGIN
    
    SELECT EMPLOYEE.FNAME
    INTO empu
    FROM EMPLOYEE
        INNER JOIN EMP_LOGIN
        ON EMPLOYEE.EID = EMP_LOGIN.EID 
        WHERE EMP_lOGIN.EUSERNAME = empUser AND EMP_LOGIN.EPASSWORD = empPwd;

    IF empu = empName THEN
    return 1;
    
    ELSE 
    RETURN 0;
    
    END IF;

END;
/

SELECT check_empLoginPwd('bobu', 'leep', 'bob' )
FROM DUAL;

select *
from EMPLOYEE;

-- ============================================

CREATE OR REPLACE FUNCTION check_custLoginPwd(custUser VARCHAR2, custPwd VARCHAR2, custName VARCHAR2) RETURN CHAR
IS
custu VARCHAR2(10);

BEGIN
    SELECT CUSTOMER.FNAME 
    INTO custu
    FROM CUSTOMER
        INNER JOIN CUST_LOGIN
        ON CUSTOMER.CID = CUST_LOGIN.CID 
        WHERE CUST_lOGIN.CUSERNAME = custUser AND CUST_LOGIN.CPASSWORD = custPwd;

    IF custu = custName THEN
    return 1;
    
    ELSE 
    RETURN 0;
    
    END IF;

END;
/

SELECT check_custLoginPwd('alu', 'dentep', 'al')
FROM DUAL;

--====================================================================

CREATE SEQUENCE customer_id_sequence
    MINVALUE 0
    MAXVALUE 1000
    START WITH 58
    INCREMENT BY 1
    NOCACHE;
    
CREATE SEQUENCE employee_id_sequence
    MINVALUE 0
    MAXVALUE 1000
    START WITH 16
    INCREMENT BY 1
    NOCACHE;
    
CREATE SEQUENCE transaction_sequence
    MINVALUE 0
    MAXVALUE 1000
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
--=======================================================
CREATE OR REPLACE TRIGGER customer_trigger_insert
BEFORE INSERT
ON customer
FOR EACH ROW
BEGIN
    IF : new.cid IS NULL THEN
        SELECT customer_id_sequence.nextval INTO : new.cid FROM dual;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER employee_trigger_insert
BEFORE INSERT
ON Employee
FOR EACH ROW
BEGIN
    IF : new.EID IS NULL THEN
        SELECT employee_id_sequence.nextval INTO: new.eid FROM dual;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER transaction_trigger_insert
BEFORE INSERT
ON Transaction
FOR EACH ROW
BEGIN
    IF : new.TID IS NULL THEN
        SELECT transaction_sequence.nextval INTO: new.TID FROM dual;
    END IF;
END;
/

--===========================================
CREATE OR REPLACE PROCEDURE insert_customer(cfname IN VARCHAR2,clname IN VARCHAR2,ccity IN VARCHAR2)
AS
BEGIN
    INSERT INTO Customer(cid,fName,lName,city) 
    VALUES(null,cfname, clname, ccity);
END;
/

BEGIN
    insert_customer('sam','lama', 'Reston');
END;
/

CREATE OR REPLACE PROCEDURE insert_employee(efname IN VARCHAR2, elname IN VARCHAR2, role1 IN VARCHAR2)
AS BEGIN
    INSERT INTO EMPLOYEE(eid, fName, lName, ROLE)
    VALUES(null, efname, elname, role1);
END;
/

BEGIN
    insert_customer('danny','don', 'sunnyside');
END;
/

BEGIN
    insert_employee('rock','lewis', 'banker');
END;
/

--==========================================

CREATE OR REPLACE PROCEDURE lock_account(accountNo IN NUMBER) AS
    
    accountStatus CHAR(1);

BEGIN
            SELECT AC_STATUS.STATUS INTO accountStatus 
            FROM ACCOUNT
            INNER JOIN AC_STATUS
            ON ACCOUNT.ACNO = AC_STATUS.ACNO
            WHERE ACCOUNT.ACNO = accountNo;
             
             
            IF accountStatus <> 0 THEN
                UPDATE AC_STATUS
                SET AC_STATUS.STATUS = '0';
            ELSE 
                dbms_output.put_line('the customer is already locked');
                    
            END IF;
END;

BEGIN
    unlock_account(807);
END;
/

CREATE OR REPLACE PROCEDURE unlock_account(accountNo NUMBER) AS
    
    accountStatus CHAR(1);

BEGIN
            SELECT AC_STATUS.STATUS INTO accountStatus 
            FROM ACCOUNT
            INNER JOIN AC_STATUS
            ON ACCOUNT.ACNO = AC_STATUS.ACNO
            WHERE ACCOUNT.ACNO = accountNo;
             
             
            IF accountStatus = 0 THEN
                UPDATE AC_STATUS
                SET AC_STATUS.STATUS = '1';
            ELSE 
                dbms_output.put_line('the customer is not locked');
                    
            END IF;
END;
/


CREATE OR REPLACE PROCEDURE DEPOSIT(acno NUMBER,deposit NUMBER) AS

BEGIN

    INSERT INTO TRANSACTION(TID,TDATE,DEPOSIT,WITHDRAW,ACNO) VALUES(NULL,CURRENT_TIMESTAMP,deposit,NULL,acno);

END;
/

CREATE OR REPLACE PROCEDURE WITHDRAW(acno NUMBER,withdraw NUMBER) AS

BEGIN

    INSERT INTO TRANSACTION(TID,TDATE,DEPOSIT,WITHDRAW,ACNO) VALUES(NULL,CURRENT_TIMESTAMP,NULL,withdraw,acno);

END;
/

CREATE OR REPLACE FUNCTION getBalance(acno NUMBER) RETURN NUMBER
IS

    totalDeposit NUMBER(10);
    
BEGIN
    
    SELECT SUM(deposit) INTO totalDeposit
    FROM TRANSACTION
    WHERE TRANSACTION.ACNO = acno;
    
    dbms_output.put_line(totalDeposit);
      
    RETURN totalDeposit ;
END;
/

select *
from transaction;


SELECT sum(deposit)
FROM TRANSACTION
WHERE ACNO = 807;


COMMIT;








