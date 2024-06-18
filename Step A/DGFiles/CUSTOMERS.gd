
[General]
Version=1

[Preferences]
Username=
Password=2783
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=CUSTOMERS
Count=400

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=CUSTOMERNAME
Type=VARCHAR2
Size=100
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=CUSTOMEREMAIL
Type=VARCHAR2
Size=100
Data=Email
Master=

