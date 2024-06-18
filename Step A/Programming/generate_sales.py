import csv
from faker import Faker

fake = Faker()

header = ['SaleID', 'DateOfSale', 'TotalAmount', 'CustomerID', 'EmployeeID']

data = []
for i in range(1, 401):
    sale_id = i
    date_of_sale = fake.date_between(start_date='-1y', end_date='today')
    total_amount = fake.random_int(min=100, max=5000)
    customer_id = fake.random_int(min=1, max=400)  # Assuming 400 customers
    employee_id = fake.random_int(min=1, max=400)  # Assuming 400 employees
    data.append([sale_id, date_of_sale, total_amount, customer_id, employee_id])

with open('Sales.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)

print("Sales.csv file created successfully with 400 records!")
