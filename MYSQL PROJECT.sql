Create table WARDS (
WardNum int,
WardName varchar (25) NOT NULL DEFAULT '',
TelephoneExtns varchar (25) NOT NULL DEFAULT ''
);


Create table STAFF (
StaffNum int,
StaffName varchar (25) NOT NULL DEFAULT '',
Address varchar (25) NOT NULL DEFAULT '',
PhoneNum int, 
DOB date,
Sex varchar (25) NOT NULL DEFAULT '',
NIN int,
Position varchar (25) NOT NULL DEFAULT '',
Salary int,
SalaryScale int,
Hours int,
Contract varchar (25) NOT NULL DEFAULT '',
SalaryType varchar (25) NOT NULL DEFAULT ''
);


Create table QUALIFICATIONS (
CertDate date,
CertType varchar (25),
InstitutionName varchar (25),
PastWork varchar (25),
PastWorkPosition varchar (25),
StartDate date,
Primary Key(StaffNum),
FinishDate date

);


Create table PATIENT (
PatientNum int,
PatientName varchar (25) NOT NULL DEFAULT '',
Address varchar (25) NOT NULL DEFAULT '', 
PhoneNo int,
DOB date,
Sex varchar (25) NOT NULL DEFAULT '',
MartialStatus varchar (25) NOT NULL DEFAULT '',
DateRegis date,
NextOfKin int
);


Create table NEXTOFKIN (
KinName int,
Relationship varchar (25) NOT NULL DEFAULT '',
Address int, 
PhoneNo int,
Primary Key (NextofKin)
);




Create table P_APPOINTMENT 
(
AppNum int,
StaffName varchar (25) NOT NULL DEFAULT '',
StaffNum int NOT NULL DEFAULT '',
AppDateTime datetime,
ExamRoom int,
IsRecommended bool,
Primary Key(AppNum)
);

Create table OUTPATIENTS
(
PatientNum int,
OutPatientNum int,
AppDateTime datetime,
Primary Key(OutPatientNum),
Foreign Key(PatientNum) References PATIENTS(PatientNum)
);



Create table INPATIENTS
(
PatientNum int,
ListDate date,
WardNum int,
ExpStayDuration int,
WardPlaceDate date,
ExpLeaveDate date,
LeaveDate date,
Primary Key(InPatientID),
Foreign Key(PatientNum) References PATIENTS(PatientNum),
Foreign Key(WardNum) References WARDS(WardNum)
);


Create table P_MEDICATION
(
PatientNum int,
PatMedID int,
DrugNum int,
DrugName varchar (25) NOT NULL DEFAULT '',
UnitsPerDay decimal,
MethodOfAdmin varchar (25) NOT NULL DEFAULT '',
Primary Key(PatMedID),
Foreign Key(PatientNum) References PATIENTS(PatientNum)
);


Create table L_DOCTORS
(
StaffNum int,
StaffName varchar (25) NOT NULL DEFAULT '',
ClinNum int,
ClinAddress varchar (25) NOT NULL DEFAULT '',
ClinPhone varchar (25) NOT NULL DEFAULT '',
Primary Key(StaffNum)
);







Create table PHARM_SUP
(
DrugNum int,
DrugName varchar (25),
Description varchar (50),
Dosage int, 
AdminMethod varchar (10),
Quantity int,
Reorder int,
Cost int
);

Create table WARD_REQ
(
Foreign Key (StaffName) REFERENCES STAFF(StaffName),
Foreign Key (WardNum) REFERENCES WARDS(WardNum),
Foreign Key (WardName) References WARDS(WardNum),
Foreign Key (DrugNum) References PHARM_SUP(DrugNum)
);


Create table SURGICAL_SUPPLIES
(
ItemNum int,
ItemName varchar(25) NOT NULL DEFAULT "",
ItemDesc varchar(50) NOT NULL DEFAULT "",
QuantInStock decimal,
ReorderLvl bool,
CostPerUnit decimal,
Primary Key(ItemNum)
);

Create table SUPPLIERS
(
SuppName varchar(25) NOT NULL DEFAULT "",
SuppNum int,
SuppAddr varchar(50) NOT NULL DEFAULT "",
SuppPhone varchar(12) NOT NULL DEFAULT "",
SuppFax varchar(50) NOT NULL DEFAULT "",
Primary Key(SuppNum)
);
