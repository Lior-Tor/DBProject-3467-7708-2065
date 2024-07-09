
[General]
Version=1

[Preferences]
Username=
Password=2564
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PRODUCTSALES
Count=400

[Record]
Name=SALEID
Type=NUMBER
Size=
Data=List(select saleid from Sales)
Master=

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=
Data=List(select customerid from Customers)
Master=

[Record]
Name=EMPLOYEEID
Type=NUMBER
Size=
Data=List(select employeeid from Employees)
Master=

[Record]
Name=PRODUCTID
Type=NUMBER
Size=
Data=List(select productid from Products)
Master=

