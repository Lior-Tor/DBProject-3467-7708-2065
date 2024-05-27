
[General]
Version=1

[Preferences]
Username=
Password=2656
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=STAFF
Count=400

[Record]
Name=STAFFID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=STAFFNAME
Type=VARCHAR2
Size=100
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=POSITION
Type=VARCHAR2
Size=50
Data=List('Cashier', 'Manager', 'Sales Associate', 'Technician')
Master=

[Record]
Name=HIREDATE
Type=DATE
Size=
Data=
Master=

