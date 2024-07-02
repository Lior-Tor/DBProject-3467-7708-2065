import csv
from faker import Faker
import random
from datetime import datetime, timedelta

# Initialize the Faker library
fake = Faker()

# Generate Customers data
customer_header = ['CustomerID', 'CustomerName', 'CustomerEmail']
customer_data = []
for i in range(1, 401):
    customer_id = i
    customer_name = fake.name()
    customer_email = fake.email()
    customer_data.append([customer_id, customer_name, customer_email])

with open('Customers.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(customer_header)
    writer.writerows(customer_data)
print("Customers.csv file created successfully with 400 records!")

# Generate Products data
product_header = ['ProductID', 'ProductName', 'Price', 'TypeOfProduct']
product_data = []
product_names_and_types = [
    ('Laptop', 'Electronics'),
    ('Smartphone', 'Electronics'),
    ('Desk Chair', 'Furniture'),
    ('Office Desk', 'Furniture'),
    ('Headphones', 'Electronics'),
    ('Bookshelf', 'Furniture'),
    ('Tablet', 'Electronics'),
    ('Monitor', 'Electronics'),
    ('Printer', 'Electronics'),
    ('Gaming Console', 'Electronics'),
    ('Coffee Table', 'Furniture'),
    ('Sofa', 'Furniture'),
    ('Dining Table', 'Furniture'),
    ('Wardrobe', 'Furniture'),
    ('Camera', 'Electronics'),
    ('Smartwatch', 'Electronics'),
    ('Bluetooth Speaker', 'Electronics'),
    ('Keyboard', 'Electronics'),
    ('Mouse', 'Electronics'),
    ('Router', 'Electronics')
]

for i in range(1, 401):
    product_id = i
    product_name, type_of_product = random.choice(product_names_and_types)
    price = random.randint(50, 2000)
    product_data.append([product_id, product_name, price, type_of_product])

with open('Products.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(product_header)
    writer.writerows(product_data)
print("Products.csv file created successfully with 400 records!")

# Generate Employees data
employee_header = ['EmployeeID', 'EmployeeName', 'Position', 'HireDate']
employee_data = []
positions = ['Manager', 'Salesperson', 'Clerk', 'Technician', 'Cashier']
for i in range(1, 401):
    employee_id = i
    employee_name = fake.name()
    position = random.choice(positions)
    hire_date = fake.date_between(start_date='-5y', end_date='today')
    employee_data.append([employee_id, employee_name, position, hire_date])

with open('Employees.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(employee_header)
    writer.writerows(employee_data)
print("Employees.csv file created successfully with 400 records!")

# Generate Suppliers data
supplier_header = ['SupplierID', 'SupplierName', 'SupplierEmail']
supplier_data = []
for i in range(1, 401):
    supplier_id = i
    supplier_name = fake.company()
    supplier_email = fake.email()
    supplier_data.append([supplier_id, supplier_name, supplier_email])

with open('Suppliers.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(supplier_header)
    writer.writerows(supplier_data)
print("Suppliers.csv file created successfully with 400 records!")

# Generate Sales data
sale_header = ['SaleID', 'DateOfSale', 'TotalAmount', 'CustomerID', 'EmployeeID']
sale_data = []
for i in range(1, 401):
    sale_id = i
    date_of_sale = fake.date_between(start_date='-1y', end_date='today')
    total_amount = random.randint(100, 2000)
    customer_id = random.randint(1, 400)
    employee_id = random.randint(1, 400)
    sale_data.append([sale_id, date_of_sale, total_amount, customer_id, employee_id])

with open('Sales.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(sale_header)
    writer.writerows(sale_data)
print("Sales.csv file created successfully with 400 records!")

# Generate Inventory data
inventory_header = ['InventoryID', 'Quantity', 'LastRestockedDate', 'ProductID', 'SupplierID']
inventory_data = []
for i in range(1, 401):
    inventory_id = i
    quantity = random.randint(1, 100)
    last_restocked_date = fake.date_between(start_date='-1y', end_date='today')
    product_id = random.randint(1, 400)
    supplier_id = random.randint(1, 400)
    inventory_data.append([inventory_id, quantity, last_restocked_date, product_id, supplier_id])

with open('Inventory.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(inventory_header)
    writer.writerows(inventory_data)
print("Inventory.csv file created successfully with 400 records!")

# Generate ProductSales data
product_sales_header = ['SaleID', 'CustomerID', 'EmployeeID', 'ProductID']
product_sales_data = []
for i in range(1, 401):
    sale_id = random.randint(1, 400)
    customer_id = random.randint(1, 400)
    employee_id = random.randint(1, 400)
    product_id = random.randint(1, 400)
    product_sales_data.append([sale_id, customer_id, employee_id, product_id])

with open('ProductSales.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(product_sales_header)
    writer.writerows(product_sales_data)
print("ProductSales.csv file created successfully with 400 records!")
