
[General]
Version=1

[Preferences]
Username=
Password=2684
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=INVENTORY
Count=400

[Record]
Name=INVENTORYID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=PRODUCTID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=QUANTITYINSTOCK
Type=NUMBER
Size=
Data=Random(0, 500)
Master=

[Record]
Name=LASTRESTOCKEDDATE
Type=DATE
Size=
Data=
Master=

[Record]
Name=SUPPLIERID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

