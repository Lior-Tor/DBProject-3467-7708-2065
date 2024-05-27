
[General]
Version=1

[Preferences]
Username=
Password=2798
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PRODUCTS
Count=400

[Record]
Name=PRODUCTID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=PRODUCTNAME
Type=VARCHAR2
Size=100
Data=List('Laptop', 'Tea', 'Chocolate', 'Perfume', 'Cigar')
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=
Data=Random(1, 1000)
Master=

