
[General]
Version=1

[Preferences]
Username=
Password=2019
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=EMPLOYEES
Count=400

[Record]
Name=EMPLOYEEID
Type=NUMBER
Size=
Data=Sequence(4)
Master=

[Record]
Name=EMPLOYEENAME
Type=VARCHAR2
Size=30
Data=FirstName + '  ' + LastName
Master=

[Record]
Name=POSITION
Type=VARCHAR2
Size=30
Data=List('Software Engineer', 'Data Analyst', 'Marketing Manager', 'Financial Analyst', 'Human Resources Manager', 'Product Manager', 'Sales Representative', 'Customer Service Specialist', 'Operations Manager', 'Graphic Designer')
Master=

[Record]
Name=HIREDATE_
Type=DATE
Size=
Data=Random(1/1/1970, 1/1/2025)
Master=

