
[General]
Version=1

[Preferences]
Username=
Password=2735
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PRODUCTS
Count=10..20

[Record]
Name=PRODUCTID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=
Data=Random(0, 100000)
Master=

[Record]
Name=PRODUCTNAME
Type=CHAR
Size=30
Data=List('Apple', 'Banana', 'Milk', 'Bread', 'Eggs', 'Chicken Breast', 'Broccoli', 'Cheddar Cheese', 'Orange Juice', 'Yogurt')
Master=

