
[General]
Version=1

[Preferences]
Username=
Password=2032
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SUPPLIERS
Count=400

[Record]
Name=SUPPLIERID
Type=NUMBER
Size=
Data=Sequence(801)
Master=

[Record]
Name=SUPPLIERNAME
Type=VARCHAR2
Size=100
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=SUPPLIEREMAIL
Type=VARCHAR2
Size=100
Data=Email
Master=

