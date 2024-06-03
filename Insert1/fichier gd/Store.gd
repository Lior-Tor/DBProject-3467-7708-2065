
[General]
Version=1

[Preferences]
Username=
Password=2840
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=STORE
Count=400

[Record]
Name=STOREID
Type=NUMBER
Size=
Data=Sequence(4)
Master=

[Record]
Name=QUANTITY
Type=NUMBER
Size=
Data=Random(0, 1000)
Master=

[Record]
Name=LASTRESTOCKEDDATE
Type=DATE
Size=
Data=Random(1/1/2020, 1/1/2025)
Master=

[Record]
Name=PRODUCTID
Type=NUMBER
Size=
Data=Random(0, 300)
Master=

[Record]
Name=SUPPLIERID
Type=NUMBER
Size=
Data=Random(0, 300)
Master=

[Record]
Name=EMPLOYEEID
Type=NUMBER
Size=
Data=Random(0, 300)
Master=

