import csv
from faker import Faker

fake = Faker()

header = ['SalesProductsID', 'SaleID', 'CustomerID', 'EmployeeID', 'ProductID', 'Quantity']

data = []
for i in range(1, 401):
    sales_products_id = i
    sale_id = fake.random_int(min=1, max=400)  # Assuming 400 sales
    customer_id = fake.random_int(min=1, max=400)  # Assuming 400 customers
    employee_id = fake.random_int(min=1, max=400)  # Assuming 400 employees
    product_id = fake.random_int(min=1, max=400)  # Assuming 400 products
    quantity = fake.random_int(min=1, max=10)
    data.append([sales_products_id, sale_id, customer_id, employee_id, product_id, quantity])

with open('SalesProducts.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)

print("SalesProducts.csv file created successfully with 400 records!")
