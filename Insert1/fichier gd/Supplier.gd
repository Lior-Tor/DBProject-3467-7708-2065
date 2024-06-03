
[General]
Version=1

[Preferences]
Username=
Password=2868
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=SUPPLIERS
Count=400

[Record]
Name=SUPPLIERID
Type=NUMBER
Size=
Data=Sequence(4)
Master=

[Record]
Name=SUPPLIERNAME
Type=VARCHAR2
Size=30
Data=FirstName + '   ' + LastName
Master=

[Record]
Name=SUPPLIEREMAIL
Type=VARCHAR2
Size=30
Data=Email
Master=

