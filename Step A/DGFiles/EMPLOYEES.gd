
[General]
Version=1

[Preferences]
Username=
Password=2821
Database=
DateFormat=DD/MM/YYYY
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=EMPLOYEES
Count=400

[Record]
Name=EMPLOYEEID
Type=NUMBER
Size=
Data=Sequence(401)
Master=

[Record]
Name=EMPLOYEENAME
Type=VARCHAR2
Size=100
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=POSITION
Type=VARCHAR2
Size=100
Data=List('Manager', 'Sales Associate', 'Cashier', 'Product Manager')
Master=

[Record]
Name=HIREDATE
Type=DATE
Size=
Data=Random(1/1/2020,1/1/2024)
Master=

