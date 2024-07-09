
[General]
Version=1

[Preferences]
Username=
Password=2427
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
Data=Sequence(10000)
Master=

[Record]
Name=PRODUCTNAME
Type=VARCHAR2
Size=100
Data=List('Laptop', 'Dog Food', 'Skin Care', 'Phone', 'Sports Shoes')
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=
Data=Random(10, 500)
Master=

[Record]
Name=TYPEOFPRODUCT
Type=VARCHAR2
Size=100
Data=List('Electronics', 'Pet Supplies', 'Beauty', 'Sports Equipment')
Master=

