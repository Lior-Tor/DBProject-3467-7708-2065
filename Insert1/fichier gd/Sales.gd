
[General]
Version=1

[Preferences]
Username=
Password=2152
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=SALES
Count=10..20

[Record]
Name=SALEID
Type=NUMBER
Size=
Data=Sequence(4)
Master=

[Record]
Name=DATEOFSALE
Type=DATE
Size=
Data=Random(1/1/2020,1/1/2025)
Master=

[Record]
Name=TOTALAMOUNT
Type=NUMBER
Size=
Data=Random(100,2000)
Master=

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=
Data=Sequence(4)
Master=

[Record]
Name=PRODUCTID
Type=NUMBER
Size=
Data=Sequence(4)
Master=

